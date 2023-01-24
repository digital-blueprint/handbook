# IDE Integration

## PHPStorm

### PHPUnit Integration

Set up PHPUnit integration with `symfony/phpunit-bridge`. This allows you to run the test suite and specific tests directly from PHPStorm.

![](phpstorm-phpunit-setup.png)

-   Run `<project>/bin/phpunit` at least once
-   Under `Settings` search for `Test Frameworks` and add a new one on
    the right
-   Select `Path to phpunit.phar`
-   Set path to `<project>/bin/.phpunit/phpunit-X.X/phpunit`
-   Set `Default Configuration file` to `<project>/phpunit.xml.dist`

## VS Code 

For basic PHP support it's recommended to install `PHP Intelephense`:
https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client

Follow the "Quick Start" instructions for disabling the builtin support for best results
