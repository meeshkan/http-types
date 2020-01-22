# HTTP Types
Format for HTTP requests and responses and libraries for representing them in different programming languages.

# Implementations
Don't see your language of choice here? If you write your own and [tell us about it](https://github.com/Meeshkan/http-types/issues/new) we'll add it to this list:

- [Java (and JVM-based languages)](https://github.com/Meeshkan/java-http-types): Available on [Maven Central](https://search.maven.org/artifact/com.meeshkan.http-types).
- [Python](https://github.com/Meeshkan/py-http-types): Available on [PyPi](https://pypi.org/project/http-types/).

# JSON representation
A single request and response pair is represented as shown in the below example:

```json
{
  "req": {
    "protocol": "http",
    "method": "get",
    "headers": {
      "accept": "*/*",
      "user-agent": "Mozilla/5.0 (pc-x86_64-linux-gnu) Siege/3.0.8"
    },
    "path": "/user/repos",
    "pathname": "/user/repos",
    "host": "example.com"
  },
  "res": {
    "statusCode": 200,
    "body": "...",
    "headers": {
      "content-length": "1999",
      "content-type": "text/html; charset=utf-8"
    }
  }
}
```

The format is described in the [schema.json](schema.json) file in this repository.

A series of request and responses should use the [JSON Lines](http://jsonlines.org/)
format, with each line being an object as defined by the schema above.

With the [jsonschema](https://python-jsonschema.readthedocs.io/) command-line validation
tool installed one can verify the first row of an input file with the command:

```sh
jsonschema -i <(head -n 1 resources/sample.jsonl) input-schema.json
```
