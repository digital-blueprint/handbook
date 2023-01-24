# Coding Standard & Linters

We currently use three separate linters to make sure your code stays in shape:

* [Psalm](https://psalm.dev/) - a static analysis tool for PHP
* [PHPStan](https://phpstan.org/) - PHP Static Analysis Tool
* [PHP CS Fixer](https://cs.symfony.com/) - PHP Coding Standards Fixer

To invoke the linters we provide the following commands in all our PHP projects:

* `composer cs` - will run CS Fixer and shows planned changes
* `composer cs-fix` - will apply the changes shown by `composer cs`
* `composer psalm` - run Psalm
* `composer phpstan` - run PHPStan
* `composer lint` - will run all linters (cs/psalm/phpstan)

In some cases we run the linters as a git pre-commit hook using
[brainmaestro/composer-git-hooks](https://github.com/BrainMaestro/composer-git-hooks)

You can see an example configuration for all the linters and the pre-commit hook
in our example bundle:

https://gitlab.tugraz.at/dbp/relay/dbp-relay-example-bundle