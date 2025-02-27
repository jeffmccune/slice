package holos

// Focus in on the slice transformer

holos: {
  "spec": {
    "artifacts": [
      {
        "artifact": "slice/components/slice/slice.gen.yaml",
        "transformers": [
          {
            "kind": "Kustomize",
            "inputs": [
              "resources.gen.yaml"
            ],
            "output": "slice/components/slice/slice.gen.yaml",
            "kustomize": {
              "kustomization": {
                "apiVersion": "kustomize.config.k8s.io/v1beta1",
                "kind": "Kustomization",
                "resources": [
                  "resources.gen.yaml"
                ]
              }
            },
            "join": {}
          }
        ]
      }
    ]
  }
}
