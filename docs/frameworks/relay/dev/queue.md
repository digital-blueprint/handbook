# Message Queue

See https://symfony.com/doc/current/messenger.html for details.

To queue a message to be handled later inject the `MessageBusInterface` into
your service and dispatch your message:

```php
$message = new GuestCheckOutMessage();
$bus->dispatch($message);
```

## Registering a Message Class for the Global Message Queue

Register a message class, so when it gets dispatched it gets handled by the
global async message queue.

```php
public function prepend(ContainerBuilder $container)
{
    $this->addQueueMessage($container, GuestCheckOutMessage::class);
    // ...
```

## Error Handling in the Message Handler

By default the worker queue will try to handle the message up to 3 times and will then drop it if it still throws an error. If you want to customize the retry behaviour you can either throw a `UnrecoverableMessageHandlingException` or a `RecoverableMessageHandlingException`, see https://symfony.com/doc/current/messenger.html#retries-failures for details.
