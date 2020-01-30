[![Build Status](https://github.com/Meeshkan/http-types/workflows/CI/badge.svg)](https://github.com/Meeshkan/http-types/actions?query=workflow%3A%22CI%22)
[![MIT licensed](http://img.shields.io/:license-MIT-blue.svg)](LICENSE.txt)

Format for recorded HTTP exchanges and libraries for working with that format.

# Implementations
Don't see your language of choice here? If you write your own and [tell us about it](https://github.com/Meeshkan/http-types/issues/new) we'll add it to this list:

- [java-http-types](https://github.com/Meeshkan/java-http-types): Java implementation available on [Maven Central](https://search.maven.org/artifact/com.meeshkan/http-types).
- [py-http-types](https://github.com/Meeshkan/py-http-types): Python implementation available on [PyPi](https://pypi.org/project/http-types/).

# JSON representation
A single request and response pair is represented as shown in the below example:

```json
{
  "request": {
    "method": "get",
    "protocol": "http",
    "host": "example.com",
    "headers": {
      "accept": "*/*",
      "user-agent": "Mozilla/5.0 (pc-x86_64-linux-gnu) Siege/3.0.8"
    },
    "pathname": "/user/repos",
    "query": { "param": "value" },
    "timestamp": "2018-11-13T20:20:39+01:00"
  },
  "response": {
    "statusCode": 200,
    "body": "...",
    "headers": {
      "content-length": "1999",
      "content-type": "text/html; charset=utf-8"
    },
    "timestamp": "2018-11-13T20:20:39+02:00"
  }
}
```

The format is described in [http-types-schema.json](http-types-schema.json).

A series of request and responses should use the [JSON Lines](http://jsonlines.org/)
format, with each line being an object as defined by the schema above.

With the [jsonschema](https://python-jsonschema.readthedocs.io/) command-line validation
tool installed one can verify the first row of an input file with the command:

```sh
jsonschema -i <(head -n 1 resources/sample.jsonl) input-schema.json
```
