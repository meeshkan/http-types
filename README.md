[![Build Status](https://github.com/Meeshkan/http-types/workflows/CI/badge.svg)](https://github.com/Meeshkan/http-types/actions?query=workflow%3A%22CI%22)
[![MIT licensed](http://img.shields.io/:license-MIT-blue.svg)](LICENSE.txt)

HTTP Types is a format for HTTP exchanges and libraries for reading and writing that format.

Each HTTP exchange (request and response) is a JSON object, with multiple requests being represented with a object per line in the [JSON Lines](http://jsonlines.org/) format.

# Why?
At [Meeshkan](https://www.meeshkan.com/) we think that HTTP traffic is interesting and that much can be learned from it!

Having a simple format that can be created from and processed in a variety of programming languages helps out with that.

# Libraries
For most use cases you can use one of the below libraries to read and write HTTP exchanges in the HTTP Types format and do not need to about the details of the JSON format.

Don't see your language of choice here? If you write your own and [tell us about it](https://github.com/Meeshkan/http-types/issues/new) we'll add it to this list:

- [java-http-types](https://github.com/Meeshkan/java-http-types): Java library available on [Maven Central](https://search.maven.org/artifact/com.meeshkan/http-types).
- [py-http-types](https://github.com/Meeshkan/py-http-types): Python library available on [PyPi](https://pypi.org/project/http-types/).
- [ts-http-types](https://github.com/Meeshkan/ts-http-types): TypeScript library available on [npm](https://www.npmjs.com/package/http-types).

# Middlewares
HTTP Types middlewares are interceptors of traffic allowing HTTP Types output to be generated from intercepted traffic. Currently there is only one available:

- [Express.js middleware](https://github.com/Meeshkan/express-middleware/)


# JSON representation
While most use cases can be covered by using one of the above listed libraries, you may want to generated or process the JSON data directly.

The format is described in [http-types-schema.json](http-types-schema.json) and an example of a single HTTP exchange is given below.

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
    "body": "(response body string)",
    "headers": {
      "content-length": "1999",
      "content-type": "text/html; charset=utf-8"
    },
    "timestamp": "2018-11-13T20:20:39+02:00"
  }
}
```

As an alternative to providing `pathname` and `query` as separate properties, one can provide a single `path` property:

```js
  "request": {
    [...]
    "path": "/user/repos?param=value",
    [...]
  },

```

A series of request and responses uses the [JSON Lines](http://jsonlines.org/) format, with each line being an object as defined by the above mentioned schema.

With the [jsonschema](https://python-jsonschema.readthedocs.io/) command-line validation tool installed one can verify the first row of an input file with the command:

```sh
jsonschema -i <(head -n 1 resources/sample.jsonl) http-types-schema.json
```

# Binary content
Request or response bodies with binary content are currently out of scope - leave those out completely or remove the `body` field for these.

# Reporting issues
[Create an issue](https://github.com/Meeshkan/http-types/issues) if you encounter a problem, have a question or an idea.
