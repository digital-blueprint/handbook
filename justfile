# Use `just <recipe>` to run a recipe
# https://just.systems/man/en/

import ".shared/common.just"

# By default, run the `--list` command
default:
    @just --list

zellijSession := "dbp-handbook"

# Open a terminal with the project session
[group('dev')]
term-run:
    zellij --layout term.kdl attach {{ zellijSession }} -c

# Kill the project session
[group('dev')]
term-kill:
    -zellij delete-session {{ zellijSession }} -f

# Kill and run a terminal with the project session
[group('dev')]
term: term-kill term-run

# Open browser with the swagger API documentation
[group('browser')]
open:
    xdg-open http://127.0.0.1:8011
