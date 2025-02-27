package holos

// Focus in on the slice transformer

holos: {
  "spec": {
    "artifacts": [
      {
        // TODO(jjm): model a directory artifact.
        "artifact": "slice/components/slice",
        "transformers": [
          {
            "kind": "Kustomize",
            "inputs": [
              "resources.gen.yaml"
            ],
            "output": "slice.gen.yaml",
            "kustomize": {
              "kustomization": {
                "apiVersion": "kustomize.config.k8s.io/v1beta1",
                "kind": "Kustomization",
                "resources": [
                  "resources.gen.yaml"
                ]
              }
            }
          },
          // TODO(jjm): make this work - https://discord.com/channels/1299051862418395216/1344665754657751090
          {
            "kind": "Slice",
            "inputs": ["slice.gen.yaml"],
            "output": "slice/components/slice",
            // TODO(jjm): have a think about fields needed for arbitrary commands for this same use case.
          }
        ]
      }
    ]
  }
}
