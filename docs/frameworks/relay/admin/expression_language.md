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
the Relay API Gateway offers the following functions, which can be used in all expressions. Note that all additional
functions are prefixed with ```relay.```

### PHP Array Functions

* ```relay.count```
* ```relay.empty```
* ```relay.implode```
* ```relay.explode```
* ```relay.array_key_exists```

### PHP Numeric Functions

* ```relay.ceil```
* ```relay.floor```
* ```relay.round```
* ```relay.max```
* ```relay.min```

### PHP String Functions

* ```relay.str_starts_with```
* ```relay.str_ends_with```
* ```relay.substr```
* ```relay.strpos```
* ```relay.strlen```
* ```relay.preg_match```
* ```relay.sprintf```
* ```relay.vsprintf```

### Custom functions

#### relay.ternaryOperator(bool $condition, $valueIfTrue, $valueIfFalse)

Implements the ternary operator, which is not available in the relay's current Symfony version:

```php
$condition ? $valueIfTrue : $valueIfFalse
```

#### relay.nullCoalescingOperator($value, $valueIfNull)

Implements the null coalescing operator, which is not available in the relay's current Symfony version:

```php
$value ?? $valueIfNull
```

#### relay.isNullOrEmptyArray(?array $array): bool

Returns ```true```, if ```$array``` is equal to ```null``` or has zero elements, ```false``` otherwise

#### relay.isNullOrEmptyString(?string $string): bool

Returns ```true```, if ```$string``` is equal to ```null``` or ```''``` (empty string), ```false``` otherwise

#### relay.map(array $array, string $expression): array

Applies the Symfony expression ```$expression``` to every array element in ```$array```,
passing it the element's key as ```key``` and the element's value as ```value``` parameter.

For example: 
```php
$array = [0, 1, 2, 3];
var_dump(relay.map($array, "value + 1")); // [1, 2, 3, 4]
```

#### relay.filter(array $array, string $expression, bool $preserveKeys = false): array

Calls the Symfony expression ```$expression``` for every array element in ```$array```, passing it the element's key
as ```key``` and the element's value as ```value``` variable. If and only if the expression evaluates to ```true``` for
an array element, the element is added to the result array.

If $preserveKeys is ```true```, the original array keys are preserved.

For example:
```php
$array = [0, 1, 2, 3];
var_dump(relay.filter($array, "value % 2 == 0")); // [0, 2] 
```

#### relay.regexFormat(string $pattern, string $subject, string $formatString, string $default = null): ?string

Performs a regular expression match using the regular expression```$pattern``` and the input string ```$subject``` 
(see PHP ```preg_match``` function) and returns a formatted string using```$formatString``` and the list of matches
captured during the regular expression search, i.e. the ```$matches``` parameter of ```preg_match```
(see PHP ```vsprintf``` function).

If ```$subject``` does not match ```$pattern```, ```$default``` is returned.
