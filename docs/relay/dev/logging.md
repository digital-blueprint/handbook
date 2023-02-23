# Logging

For logging simply inject the logging service via the `LoggerInterface`
interface and start using it.

See https://symfony.com/doc/current/logging.html#logging-a-message for details.

## Log Context & Masking

By default the core bundle injects a global logging processor that:

* Adds various helpful context to each logging record, like the session id, the request id, the route etc.
* Masks certain values that should not end up in the logs, like the currently logged in user.

## Registering a new Logging Channel

In case you want to log data that should be handled differently compared to all
other logs, like filtering at a different logging level, or the logs should be
written to different backend you can register a new logging channel in your
bundle.

Use `registerLoggingChannel()` to register a new logging channel:

```php
// In *Extension.php, using the ExtensionTrait
public function prepend(ContainerBuilder $container)
{
    $this->registerLoggingChannel($container, 'mychannel', /* $mask= */ true);
    // ...
```

The second parameter allows you to disable log masking for that channel, in case
you want to make sure that the logs don't get altered/cleaned up in any way.

To use the new channel in your service you can then inject it via auto wiring, a
method, or the constructor for example:

```yaml
MyNamespace\MyService:
  tags:
    - { name: monolog.logger, channel: 'mychannel' }

MyNamespace\MyOtherService:
  calls:
    - setAuditLogger: ['@monolog.logger.mychannel']

MyNamespace\AnotherService:
  arguments:
    $auditLogger: '@monolog.logger.mychannel'
```
