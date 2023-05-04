# FAQ

## Using Firefox I get automatically logged out again after 5 seconds

This happens if Firefox has "Total Cookie Protection" enabled (now the default) and you develop locally.
You can disable this behaviour in Firefox by setting `network.cookie.cookieBehavior` in <about:config> from `5` to `4`. This issue is currently tracked [here](https://github.com/digital-blueprint/toolkit/issues/25).
