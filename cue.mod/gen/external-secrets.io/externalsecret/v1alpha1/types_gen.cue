// Code generated by timoni. DO NOT EDIT.

//timoni:generate timoni vendor crd -f https://raw.githubusercontent.com/external-secrets/external-secrets/v0.10.5/deploy/crds/bundle.yaml

package v1alpha1

import (
	"strings"
	"struct"
)

// ExternalSecret is the Schema for the external-secrets API.
#ExternalSecret: {
	// APIVersion defines the versioned schema of this representation
	// of an object.
	// Servers should convert recognized schemas to the latest
	// internal value, and
	// may reject unrecognized values.
	// More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
	apiVersion: "external-secrets.io/v1alpha1"

	// Kind is a string value representing the REST resource this
	// object represents.
	// Servers may infer this from the endpoint the client submits
	// requests to.
	// Cannot be updated.
	// In CamelCase.
	// More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
	kind: "ExternalSecret"
	metadata!: {
		name!: strings.MaxRunes(253) & strings.MinRunes(1) & {
			string
		}
		namespace!: strings.MaxRunes(63) & strings.MinRunes(1) & {
			string
		}
		labels?: {
			[string]: string
		}
		annotations?: {
			[string]: string
		}
	}

	// ExternalSecretSpec defines the desired state of ExternalSecret.
	spec!: #ExternalSecretSpec
}

// ExternalSecretSpec defines the desired state of ExternalSecret.
#ExternalSecretSpec: {
	// Data defines the connection between the Kubernetes Secret keys
	// and the Provider data
	data?: [...{
		// ExternalSecretDataRemoteRef defines Provider data location.
		remoteRef: {
			// Used to define a conversion Strategy
			conversionStrategy?: "Default" | "Unicode" | *"Default"

			// Key is the key used in the Provider, mandatory
			key: string

			// Used to select a specific property of the Provider value (if a
			// map), if supported
			property?: string

			// Used to select a specific version of the Provider value, if
			// supported
			version?: string
		}
		secretKey: string
	}]

	// DataFrom is used to fetch all properties from a specific
	// Provider data
	// If multiple entries are specified, the Secret keys are merged
	// in the specified order
	dataFrom?: [...{
		// Used to define a conversion Strategy
		conversionStrategy?: "Default" | "Unicode" | *"Default"

		// Key is the key used in the Provider, mandatory
		key: string

		// Used to select a specific property of the Provider value (if a
		// map), if supported
		property?: string

		// Used to select a specific version of the Provider value, if
		// supported
		version?: string
	}]

	// RefreshInterval is the amount of time before the values are
	// read again from the SecretStore provider
	// Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h"
	// May be set to zero to fetch and create it once. Defaults to 1h.
	refreshInterval?: string | *"1h"

	// SecretStoreRef defines which SecretStore to fetch the
	// ExternalSecret data.
	secretStoreRef: {
		// Kind of the SecretStore resource (SecretStore or
		// ClusterSecretStore)
		// Defaults to `SecretStore`
		kind?: string

		// Name of the SecretStore resource
		name: string
	}

	// ExternalSecretTarget defines the Kubernetes Secret to be
	// created
	// There can be only one target per ExternalSecret.
	target: {
		// CreationPolicy defines rules on how to create the resulting
		// Secret
		// Defaults to 'Owner'
		creationPolicy?: "Owner" | "Merge" | "None" | *"Owner"

		// Immutable defines if the final secret will be immutable
		immutable?: bool

		// Name defines the name of the Secret resource to be managed
		// This field is immutable
		// Defaults to the .metadata.name of the ExternalSecret resource
		name?: string

		// Template defines a blueprint for the created Secret resource.
		template?: {
			data?: {
				[string]: string
			}

			// EngineVersion specifies the template engine version
			// that should be used to compile/execute the
			// template specified in .data and .templateFrom[].
			engineVersion?: "v1" | "v2" | *"v1"

			// ExternalSecretTemplateMetadata defines metadata fields for the
			// Secret blueprint.
			metadata?: {
				annotations?: {
					[string]: string
				}
				labels?: {
					[string]: string
				}
			}
			templateFrom?: [...struct.MaxFields(1) & {
				configMap?: {
					items: [...{
						key: string
					}]
					name: string
				}
				secret?: {
					items: [...{
						key: string
					}]
					name: string
				}
			}]
			type?: string
		}
	}
}
