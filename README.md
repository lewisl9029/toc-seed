# Seed Server for [Toc Messenger](http://toc.im)

To host, simply install Docker and pull the lewisl9029/toc-seed container.

To specify a bootstrapping seed server, simply create a file config/seeds.json and populate it with the seed info object you will see in docker logs when starting up a seed server, and mount the config/ directory with the -v flag to /toc-seed/config when using Docker run. For instance, to use the official seed server, add the following into your seeds.json:

```json
{
  "ddb8f07845edf86420a080e8ffe5a91a420a376047c450b034969f3f4f57def5": {
    "paths": [
      {
        "type": "http",
        "http": "http://seed.toc.im:42424"
      }
    ],
    "parts": {
      "2a": "a4494cb4d121fa6c11f2357bf903d61b08d3c7d907cc3a89da6c1a7af9d0e3aa",
      "1a": "3fbf2edf3fea007ae9ef37c345119676a813c4ca1746c6d3c8af930f6da75399"
    },
    "keys": {
      "2a": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAli3oIbh8Bq3YAEzPNVHYm6cSfE7StY/JIDjSCK8dCpAc5nkR2q5seeKJE8W8gcsIgW+oIURWrrK/8ATdCNE7OGhcPSLzrQKrH2lY/JKlFp9kFSNvlDxP2/0u/TafB/haOugiu8Zoi46ILuXwnEte2mEJ05PxBDV+QlYwjF56PoVPhvTPTuVUg5uKRs1HMEpt6W8yb/l3hpRk0y7oh3xGj+P1DV0SeTR4mcUJrSMKmy3ESx2hWJ7M69FKkKsrNGYQXT0i8OGpGLCLoIl0iyIWKQyzwCaU4ow3wQGx/qHHbaf7AForf3CcYioWhZ8Xtj0saTd960O4q6ESsoDTO/CEmwIDAQAB",
      "1a": "hbBceV7i3kJVwyMbCBB1IbXSKwr82ML9cR1AtWphFE1qtK/fOJ7ycQ=="
    }
  }
}
```

See [toc-setup-seed.sh](toc-setup-seed.sh) for an example setup script.
