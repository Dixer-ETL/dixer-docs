# Generate a graph

Dixer supports generate a Graphviz compatible diagram of your PCF.

There are two outputs:

- **DOT**: a Graphviz compatible DOT diagram. Use option `--graph` or  `-g` and the file path of the diagram file.
- **HTML**: an image with the diagram embedded in an HTML file. Use option `--graphhtml` or  `-gh` and the file path of the diagram file.

At this moment, the workflow called by `jobsgroup`, `bucle` and For Each Row are not part of a subgraph, every job called is a node.

## Events

Arrows has colors depending the event.

- **Green**: the workflow below this arrow is called when success event is triggered in the job that call it.
- **Blue**: the workflow below this arrow is called when completion event is triggered in the job that call it.
- **Red**: the workflow below this arrow is called when error event is triggered in the job that call it.

## For Each Row worlflow

- **Pink**: the workflow below this arrow is called in every row processed in the job that call it.

## Bucle job worlflow

- **Yellow**: the workflow below this arrow is called while `bucle` is not ended. A node with the name or ID of `bucle` job is at start of this arrow only to document the workflow start.