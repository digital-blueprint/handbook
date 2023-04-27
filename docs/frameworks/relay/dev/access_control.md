# Access Control

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