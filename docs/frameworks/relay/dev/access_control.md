# Access Control

This section explains how to integrate Relay API [Access Control](../admin/access_control.md) into your application. 

## Policy Configuration

You can add [Access Control Policies](../admin/access_control.md#access-control-policies) and 
[Access Control Attributes](../admin/access_control.md#access-control-attributes) to your application by 
appending the respective node definitions to the config tree of your application
(see [Symfony Documentation](https://symfony.com/doc/current/components/config/definition.html#adding-node-definitions-to-the-tree)
for details):

```php
class Configuration implements ConfigurationInterface
{
   public const MAY_READ_BLOG_POST = 'MAY_READ_BLOG_POST';
   public const MAY_ADD_BLOG_POSTS = 'MAY_ADD_BLOG_POSTS';
   public const USER_GROUPS = 'USER_GROUPS';

    public function getConfigTreeBuilder(): TreeBuilder
    {
        $treeBuilder = new TreeBuilder('my_app');
        $treeBuilder->getRootNode()->append(
           AuthorizationConfigDefinition::create()
              ->addResourcePermission(self::MAY_READ_BLOG_POST, 'false', 'Returns true if the authenticated user may read the given blog post.')
              ->addRole(self::MAY_ADD_BLOG_POSTS, 'false', 'Returns true if the authenticated user may add blog posts.')
              ->addAttribute(self::USER_GROUPS, '[]', 'Returns an array of group IDs the authenticated user is member of')
              ->getNodeDefinition()
        );
          
        return $treeBuilder;
)
```

The ```AuthorizationConfigDefinition``` class is defined in the [Core Bundle](../../../components/api/core/README.md).
Its provides the following methods:

```php
public static function create()
```

Creates a new instance of ```AuthorizationConfigDefinition```.

```php
public function addRole(string $roleName, string $defaultExpression = 'false', string $info = ''): AuthorizationConfigDefinition
``` 
Appends a new node definition for the role ```$roleName```, with the default expression ```$defaultExpression``` 
(```'false'``` meaning that nobody is granted access) and the role description ```$info```.

```php
public function addResourcePermission(string $resourcePermissionName, string $defaultExpression = 'false', string $info = ''): AuthorizationConfigDefinition
``` 
Appends a new node definition for the resource permission ```$resourcePermissionName```, with the default expression ```$defaultExpression```
(```'false'``` meaning that nobody is granted access) and the policy description ```$info```.

```php
public function addAttribute(string $attributeName, string $defaultExpression = 'false', string $info = ''): AuthorizationConfigDefinition
```

Appends a new node definition for the attribute ```$attributeName```, with the default expression ```$defaultExpression``` and
the attribute description ```$info```.

```php
public function getNodeDefinition(): NodeDefinition
```

Returns the ```authorization``` config node definition to append to the config tree's root node.

The config definition example above yields the following default config:

```yaml
my_app:
  authorization:
    resource_permissions:
       MAY_READ_BLOG_POST: 'false'
    roles:
       MAY_ADD_BLOG_POSTS: 'false'
    attributes:
       USER_GROUPS: '[]'
```

## Creating Your Authorization Service

To evaluate your policy and attribute expressions on client requests you need to create a service which derives from the 
```AbstractAuthorizationService``` class declared in the 
[Core Bundle](../../../components/api/core/README.md). Let's call it ```MyAuthorizationService```:

```php
class MyAuthorizationService extends AbstractAuthorizationService
{}
```

To set up policy and attribute configuration from your app's config, be sure to call the following lines of code
on service load:

```php
class MyAppExtension extends ConfigurableExtension
{
    public function loadInternal(array $mergedConfig, ContainerBuilder $container)
    {
        ...
        
        $definition = $container->getDefinition(MyAuthorizationService::class);
        $definition->addMethodCall('setConfig', [$mergedConfig]);
        
        ...
    } 
}       
```

And declare ```MyAuthorizationService``` as a service in your ```services.yaml``` file:

```yaml
  MyApp\Authorization\MyAuthorizationService:
    autowire: true
    autoconfigure: true
```

Now you are ready to use your access control policies and attributes at runtime, i.e. on client requests:

```php
class MyAppController
{
   public function __construct(
      private readonly MyAuthorizationService $authorizationService)
   {
   }
   
   /**
   * @throws ApiError throws a 403 'forbidden' exception if the current user is not authorized to add blog posts
   */
   public function addBlogPost(BlogPost $blogPost)
   {
      // if you just want to check without an exception being thrown,
      // use $this->authorizationService->isGrantedRole(...)
      $this->authorizationService->denyAccessUnlessIsGrantedRole(
         Configuration::MAY_ADD_BLOG_POSTS);
      
      // add the blog post
   }
   
   /**
   * @throws ApiError throws a 403 'forbidden' exception if the current user is not authorized to read $blogPost
   */
   public function getBlogPost(BlogPost $blogPost)
   {
      // if you just want to check without an exception being thrown,
      // use $this->authorizationService->denyAccessUnlessIsGrantedResourcePermission(...)
      $this->authorizationService->denyAccessUnlessIsGrantedResourcePermission(
         Configuration::MAY_READ_BLOG_POST, $blogPost);
      
      return $blogPost;
   }
   
   public function getUserGroups(): array
   {
      return $this->authorizationService->getAttribute(Configuration::USER_GROUPS);
   }
}
```

Note that the ```denyAccessUnlessIsGrantedResourcePermission``` method gets passed the blog post as a parameter.
It is available in your policy expression as ```resource``` variable
(see [The Resource Object](../admin/access_control.md#the-resource-object)). 

## Symfony Access Control (Deprecated)

Assuming you have a "my-scope" that gets somehow mapped into the access token
you want to restrict certain APIs and operations to only work if the token has
this special scope.

Your implementation can decide to map this to a specific role for the current
user, for example:

```
some-scope -> ROLE_SCOPE_SOME-SCOPE
```

You can now check for `ROLE_SCOPE_SOME-SCOPE` in your bundle.

By default, if no token is passed to the API then you get an anonymous user. To
prevent anonymous requests you need to check for a special "role" provided by Symfony:

```
IS_AUTHENTICATED_FULLY
```



To restrict the access to certain attributes, operations, entities see the
[API-Platform documentation](https://api-platform.com/docs/core/security/) and
the [Symfony documentation](https://symfony.com/doc/current/security.html#).

## Examples

Check roles in custom controllers or data providers/persisters:

```php
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

final class MySuperController extends AbstractController
{
    public function someFunctionsWhichAccessesTheData(...) {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $this->denyAccessUnlessGranted('ROLE_SCOPE_FOO');

        // ...
    }
}
```

In entity annotations:

Note that the security checks on the operations do not prevent data providers
from being called. The checks will be done after the requested objet has been
checked. If that is a problem you should check the roles in you data provider
as well (or only there, since that is enough)

```php
/**
 * Secured resource.
 *
 * @ApiResource(
 *     attributes={"security"="is_granted('IS_AUTHENTICATED_FULLY') and is_granted('ROLE_SCOPE_FOO')"},
 *     collectionOperations={
 *         "get",
 *         "post"={"security"="is_granted('IS_AUTHENTICATED_FULLY') and is_granted('ROLE_SCOPE_FOO')"}
 *     }
 */
class Book
{
    // ...
}
```