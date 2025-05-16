# Rico JSON
[![Code Climate](https://codeclimate.com/github/picandocodigo/ricojson.png)](https://codeclimate.com/github/picandocodigo/ricojson)
[![Gem Version](https://badge.fury.io/rb/ricojson.svg)](http://badge.fury.io/rb/ricojson)


<div align="center">
    <img src="http://i.imgur.com/D10XVTS.jpg">
</div>

## Description

A simple command line tool to open ugly one-line-not-indented JSON files in a way that you can read them.

By default it the JSON (prettified with Ruby's JSON library) to your standard output. You can also pass the `-o` parameter for it to open the JSON file in your system's default application or text editor for files with the `.json` extension.

It works only on **GNU/Linux** and **Mac OS X** (theoretically).

## Install

```bash
$ gem install ricojson
```

## Usage

Flags:

```
  -f file       Read JSON from specified file.
  -o            Opens the resulting formatted JSON in your default
                text editor.
  -h            Prints help message.
```

### Examples

You can just **display a JSON file** with it:
```bash
$ ricojson -f my-terrible-not-indented-json-file.json
```

Or **pipe a file's content**:
```bash
$ cat other-terrible-not-indented-file.json | ricojson
```

And **display an API's JSON return** value directly from your command line:
```bash
$ curl https://mnav.heroku.com/artworks/62 | ricojson
```

And if you want to see this in your default app/text editor use the
`-o` parameter:
```bash
$ ricojson -o -f my-terrible-not-indented-json-file.json
```

## Acknowledgements
Thanks @dcadenas for pairing with me and helping me improve the code and
functionality. Thanks @poteland for improving the command line options
with [clap](https://github.com/soveran/clap).

Jason picture by
<small>[Robert Ball](https://secure.flickr.com/photos/robertball/) -
https://secure.flickr.com/photos/robertball/5588712222/ CC
License</small>

## LICENSE

Copyright © 2014 - Fernando Briano

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
