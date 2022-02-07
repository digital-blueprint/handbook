# Web Component Guidelines

A random selection of guidelines for how we write web components.

## Custom Elements

* All elements which use other custom elements should use `ScopedElementsMixin` from ['@open-wc/scoped-elements'](https://open-wc.org/docs/development/scoped-elements/) instead of requiring the used custom elements to be globally registered. This avoids the internally used elements to leak and avoids conflicts.

    ```js
    class MyElement extends ScopedElementsMixin(LitElement) {
        static get scopedElements() {
            return {
                'my-button': MyButton,
                'my-panel': MyPanel,
            };
        }
    }
    ```

Instead of `document.createElement()` when creating nested custom elements use `getShadowRootDocument()`

```js
import {getShadowRootDocument} from '@dbp-toolkit/common';

func() {
    let elm = getShadowRootDocument(this).createElement('dbp-my-tag');
}
```


## Internal State

Internal state should be prefixed with a `"_"` and not provide an attribute by setting `state: true`:

```js
    static get properties() {
        return {
            _internalThing: {state: true},
        }
    }
```
