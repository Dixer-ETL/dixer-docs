# Generate a graph

Dixer supports generate a Graphviz compatible diagram of your PCF.

The output is a svg with the diagram embedded in a HTML file. Use option `--graph` or  `-g` and the file path of the diagram file.

## Events

Arrows has colors depending the event.

- **Green**: the workflow below this arrow is called when success event is triggered in the job that call it.
- **Blue**: the workflow below this arrow is called when completion event is triggered in the job that call it.
- **Red**: the workflow below this arrow is called when error event is triggered in the job that call it.