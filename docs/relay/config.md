# Gateway Configuration

The source of all configuration is the `.env` file in the root directory which
looks like this:

```bash
...
###> symfony/framework-bundle ###
APP_ENV=dev
APP_SECRET=
###< symfony/framework-bundle ###
...
```

It sets environment variables which are then used in the bundle configuration files under `config/packages`.

In addition you can create a `.env.local` file which the API gateway will
combine with the `.env`file. There you can include secrets which will not be
checked into source control.

For more details on the different `.env` files, see [
Configuring Symfony
](https://symfony.com/doc/current/configuration.html)

## The .env Syntax

The .env files syntax is a subset of POSIX SHELL syntax. Here are some tips and
tricks for how to handle value corner cases:

```bash
# In case there are no special characters this is fine
SOME_KEY=foobar

# Quote with " when the value includes spaces
SOME_KEY="foo bar"

# Escape " with \
SOME_KEY="foo\"bar"

# Escape $ with \ as well
SOME_KEY="foo\$bar"

# When credentials are part of an URL they need to be URL escaped
# For example "$secret" -> "%24ecret"
SOME_URL="mysql://username:%24ecret@hostname/dbname"

# A value that spans multiple lines
SOME_KEY="-----BEGIN RSA PRIVATE KEY-----
...
HkVN9...
...
-----END DSA PRIVATE KEY-----"
```

<script>
function _quote() {
    prompt('Quoted String', '"' + prompt('Input').replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\$/g, '\\$') + '"');
}

function _urlescape() {
    prompt('URL Encoded Result', encodeURIComponent(prompt('Input')));
}
</script>

To help with converting values to the right format, here are some Javascript helpers for

* converting any text to a quoted value suitable for a `.env` file: <a href="#" onclick="event.preventDefault(); _quote();">Quote Text</a>
* converting any text to a value suitable for including it in an URL: <a href="#" onclick="event.preventDefault(); _urlescape();">URL Escape</a>

For more info on the syntax see [.env File Syntax](https://symfony.com/doc/current/configuration.html#env-file-syntax)
