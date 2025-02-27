package holos

// copied from holos show platform --format=json from another project for
// expedience.
holos: {
  "apiVersion": "v1alpha5",
  "kind": "Platform",
  "metadata": {
    "name": "slice"
  },
  "spec": {
    "components": [
      {
        "annotations": {
          "app.holos.run/description": "slice transformer"
        },
        "labels": {
          "holos.run/component.name": "slice",
        },
        "name": "slice",
        "parameters": {
          "outputBaseDir": "slice",
        },
        "path": "components/slice"
      }
    ]
  }
}
