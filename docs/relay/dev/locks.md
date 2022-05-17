# Locks

Locks are used to provide exclusive access to a shared resource.

```php
// Retrieve a LockFactory instance via dependency injection
public function __construct(LockFactory $lockFactory) {
    // Make sure to prefix the resource string to avoid conflicts with other bundles
    $lock = $lockFactory->createLock(/* ... */);
    // ...
}
```

For more information see
https://symfony.com/doc/current/components/lock.html#usage
