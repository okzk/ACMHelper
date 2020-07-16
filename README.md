# ACMHelper

Generate command to import a new server certificate to Amazon Certificate Manager.

# Usage

Import new server certificate:
```bash
$(docker run --rm -e SERVER_NAME=your-server-name okzk/acmhelper)
```

Reimport server certificate:
```bash
$(docker run --rm -e SERVER_NAME=your-server-name -e CERTIFICATE_ARN="..." okzk/acmhelper)
```

## License
MIT
