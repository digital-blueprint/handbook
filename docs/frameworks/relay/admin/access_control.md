# Access Control

The access control system of the Relay API Gateway is based on the **Attribute-based access control** (ABAC) model,
where the authorization of API users to perform certain operations is determined by attributes of the user, requested 
resources, the performed action, and the environment. _Access control policies_ are conditional statements that grant or
deny access depending on those attributes. They can be customized by administrators and allow for a flexible and
fine-grained access control system without the risk of role explosion.

If you want to integrate Relay API access control into your own application, see the
[Access Control](../dev/access_control.md) developers guide.

## User Attributes

In the Relay API Gateway user attributes can be of primitive, array, or object type. The are provided by 
_Authorization Data Providers_, which can be installed and used by administrators to define which user
attributes are available and how to get their values for a specific user (e.g. organization, functions, skills, ...).
Currently, the following _Authorization Data Providers_ are available:

* **Textfile** (```dbp/relay-core-connector-textfile-bundle```) Retrieves user attributes from a simple Yaml text file
which allows the definition of users, user groups, attributes and mapping between users/groups and attrbute values
* **LDAP** ([Core Connector LDAP](../../../components/api/core-connector-ldap/README.md)) Retrieves user attributes from an LDAP service. It allows the
configuration of the mapping between LDAP and ABAC user attributes.  
* **OIDC Token** ([Auth Bundle](../../../components/api/auth/README.md)) Retrieves user attributes from the authenticated user's OpenID Connect 
token. It allows the configuration of the mapping between token scopes and user attributes.
* **CampusOnline** (```dbp/relay-core-connector-campusonline-bundle```) Retrieves user attributes from CampusOnline.

## Access Control Policies

In the Relay API Gateway the [Symfony Expression Language](./expression_language.md) is used to define access control
policies in the form of one-line conditional statements (like ```if``` statements), i.e. they always return ```true```
(usually means "access granted") or ```false``` (usually means "access denied).

Relay bundles that come with access control declare a predefined set of policies in their bundle configuration.
The policy's name and info describe the action and the resource it grants (or denies) access to.

The following variables can be addressed in policy statements:

* ```user``` The authenticated API user (see [The User Object](#the-user-object)).
* ```object``` The requested resource (may be ```null```) (see [The Resource Object](#the-resource-object))

## Access Control Attributes

Along the lines of [Access Control Policies](#access-control-policies), bundles may declare a set of access control
attributes in their configuration. As opposed to policies, which always return Booleans, those attributes can be of any
declared primitive, array, or object type. They allow access control relevant attributes depending on the API user 
to be used in the API code to be customized by administrators.

The following variables can be addressed in attribute statements:

* ```user``` The authenticated API user (see [The User Object](#the-user-object)).

### The User Object

The ```user``` object represents the authenticated API user and provides the following set of methods:

* ```getIdentifier(): ?string``` Returns the user identifier or ```null``` for system accounts.
* ```get(string $attributeName, $defaultValue = null): mixed|null``` Gets the value of a [user attribute](#user-attributes).
  Throws an exception, if the attribute is not declared. If no value is provided for the user, ```$defailtValue``` is
  returned.
* ```isGranted(string $policyName, $resource)``` Evaluates the access control policy ```$policyName```
  with the resource ```$resource``` for the current user. Allows the evaluation of policies within other policy or attribute
  statements of the same bundle. Throws an exception if the policy is not declared in the bundle or an infinite loop
  is detected.
* ```getAttribute(string $attributeName, $defaultValue = null): mixed|null``` Evaluates the access control attribute
  ```$attributeName``` for the current user and returns its return value. Allows the evaluation of attributes within
  other or attribute statements of the same bundle. Throws an exception if the attribute is not declared
  in the bundle or an infinite loop is detected.

### The Resource Object

The resource ```object``` represents one of possible many resources that the user requested access to. Its type depends
on the context and is part of the documentation of the respective [access control policy](#access-control-policies). It
may also be ```null```, in case it the policy is not associated with a resource (e.g. policies like 'MAY_USE_API')