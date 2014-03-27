# Rico JSON

![](http://i.imgur.com/D10XVTS.jpg)

A gem to open your one-line-not-indented JSON files in a way that you
can read them. It uses your system's default application for files
with the `.json` extension, and prettifies it with Ruby's JSON
library.

It works only on **GNU/Linux** and **Mac OS X** (theoretically).

## Install

```bash
$ gem install rico-json
```

## Usage

```bash
$ rico-json my-terrible-not-indented-json-file.json
$ cat other-terrible-not-indented-file.json | rico-json
```

## TODO
 * Write the gorram tests
 * Allow the output to an application to be optional (other option
   being STDOUT for instance).

Thanks @dcadenas for pairing with me and helping me improve the code and
functionality.

Jason picture by
<small>[Robert Ball](https://secure.flickr.com/photos/robertball/) - https://secure.flickr.com/photos/robertball/5588712222/</small
