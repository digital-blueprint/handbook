# Symfony Expression Language

The Symfony Expression Language provides an engine that can compile and evaluate expressions. An expression is one-line
code statement that returns a value (often Booleans). The language syntax is based on the expression syntax of 
Twig ([Epression Syntax](https://symfony.com/doc/current/reference/formats/expression_language.html)). It allows
administrators to customize the API behaviour by providing their own expressions in bundle configuration.

For further information, see the
[Symfony Expression Language documentation](https://symfony.com/doc/current/components/expression_language.html).

The Relay API Gateway currently uses configurable expressions for [Access Control](access_control.md), where
administrators can grant or deny access to API users by customizing conditional expressions (_Access Control Policies_).

The Symfony Expression Language can be extended by adding custom functions. To facilitate writing expressions,
the Relay API Gateway offers the following functions, which can be used in all expressions:

### PHP Array Functions

* ```count```
* ```empty```
* ```implode```
* ```explode```
* ```array_key_exists```

### PHP Numeric Functions

* ```ceil```
* ```floor```
* ```round```
* ```max```
* ```min```

### PHP String Functions

* ```str_starts_with```
* ```str_ends_with```
* ```substr```
* ```strpos```
* ```strlen```

### Custom functions

#### isNullOrEmpty(?string $string): bool

Returns ```true```, if ```$string``` is equal to ```null``` or ```''```, ```false``` otherwise

#### map(?string $expression, array $array): array

Applies the Symfony expression ```$expression``` to every array element in ```$array```,
passing it the element's key as ```key``` and the element's value as ```value``` variable. If ```$expression```
is ```null``` the input array is returned. (see the PHP ```array_map``` function). 

For example: 
```
$array = [0, 1, 2, 3];
var_dump(map("value + 1", $array)); // [1, 2, 3, 4]
```

#### filter(array $array, ?string $expression = null): array

Calls the Symfony expression ```$expression``` for every array element in ```$array```, passing it the element's key
as ```key``` and the element's value as ```value``` variable. If and only if the expression evaluates to ```true``` for an array element,
the element is added to the result array, where original array keys are preserved. If ```$expression``` is ```null```, the PHP ```empty```
function is evaluated instead of the expression. (see the PHP ```array_filter``` function).

For example:
```
$array = [0, 1, 2, 3];
var_dump(filter($array, "value % 2 == 0")); // [0, 2] 
```