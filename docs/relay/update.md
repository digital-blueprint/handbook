# Updating the Application

To receive bug fixes and security updates of all the components you regularly need to update the API gateway. Due to the modular nature of the API gateway, and it being based on Symfony this requires multiple steps.

## Use GIT (optional)

If you have created your project using the `composer create-project` command you will have a directory full of lose files. Ideally you would want to track changes in that directory to see what you have changed and to easily revert changes if needed.

We strongly recommend that you use the version control system "Git" for this.

To convert your project to a Git repository:

```shell
# After "composer create-project" has created the "relay-api" directory.
> git init . # Creates the .git directory
Initialized empty Git repository in /home/user/relay-api/.git/
> git add .  # Stages all files, excluding the ones matching patterns in .gitignore 
> git commit -m "Initial commit"  # Creates a commit of all the staged files
```

For more details on how to use Git see the [Pro Git Book](https://git-scm.com/book/en/v2).

## Updating Packages managed via Composer

Everything under `/vendor` is managed by composer. If you delete it and run `composer install` everything will be re-instated as before.

To see the all installed packages you can run `composer show`.

Which packages are required and with which version is specified through the `composer.json` file which includes the direct dependencies and their supported version ranges. The `composer.lock` file tracks the exact versions of all direct and indirect dependencies. The `composer.lock` is required so you will get the exact same files again if you install the app on a different machine.

With `composer outdated` you can see wich packages have newer versions available and with `composer update` you can update all packages to their newest version, assuming they fall into the version ranges allowed in `composer.json`.

If a package doesn't get updated despite a newer version being available you can run `composer why <package-name>` to see why the version can't be changed.

For more details on composer see the [composer book](https://getcomposer.org/doc/)

## Updating Symfony recipes

Some packages installed in `vendor` are connected to a so called "recipe". A recipe contains default configuration files, default environment variables, and even PHP files that are installed outside of `vendor` when the connected package is installed.

Some examples:

* `public/.htaccess` is part of the `symfony/apache-pack` package
* `src/Kernel.php` is part of the `symfony/framework-bundle` package

These files are not managed by composer and you can change/adjust them as needed. They will also never be updated via composer again once they are installed, so your changes to them persist.

It still makes sense to compare them to the newest available recipe and update them once in a while. For example the `/public/.htaccess` might gain some new commands which are required for running Symfony in combination with Apache. In other cases only the default configuration might have changed which you don't need anyway and thus can be ignored. Either way, every potential update should be reviewed.

To see the list of installed recipes run:

```shell
> composer recipes
 * symfony/requirements-checker 
 * symfony/routing 
 * symfony/security-bundle (update available)
...
```

The "`(update available)`" marker will show you that a new version of the recipe is available.

To update recipes one by one you can run:

```shell
# this requires the application to be a git repository!
> composer recipes:update
  [0] doctrine/doctrine-bundle
  [1] symfony/framework-bundle
  [2] symfony/security-bundle
  [3] symfony/twig-bundle
 >
```

Symfony tracks the versions of all installed/updated recipes in the `symfony.lock` file.

For more details see https://symfony.com/doc/5.4/setup/upgrade_minor.html#3-updating-recipes

## Tips & Tricks

* Always commit your changes after you are done so you can easily revert back if something went wrong.
* Run the ['Health Checks'](./debugging.md#health-checks) after an update to see if the basics are still working.
* Test the update in a staging environment before deploying it to production.

See the [FAQs](./faq.md#installation-updates) for common related problems & solutions.
