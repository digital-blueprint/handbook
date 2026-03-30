import mermaid from './mermaid/mermaid.esm.min.mjs';

mermaid.initialize({
    theme:'neutral',
    startOnLoad: false,
});

document$.subscribe(function() {
    mermaid.run();
});
