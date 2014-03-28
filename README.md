# Rico JSON

![](http://i.imgur.com/D10XVTS.jpg)

A gem to open ugly one-line-not-indented JSON files in a way that you
can read them.

By default it the JSON (prettified with Ruby's JSON library)
to your stdoutput. You can also pass the `-o` parameter for it to open
the JSON file in your system's default application or text editor for
files with the `.json` extension.

It works only on **GNU/Linux** and **Mac OS X** (theoretically).

## Install

```bash
$ gem install rico-json
```

## Usage

You can just **display a JSON file** with it:
```bash
$ rico-json my-terrible-not-indented-json-file.json
```

Or **pipe a file's content**:
```bash
$ cat other-terrible-not-indented-file.json | rico-json
```

And **display an API's JSON return** value directly from your command line:
```bash
$ curl https://mnav.heroku.com/artworks/62 | rico-json
```

And if you want to see this in your default app/text editor use the
`-o` parameter:
```bash
$ rico-json -o my-terrible-not-indented-json-file.json
```

## TODO
 * Write the gorram tests

Thanks @dcadenas for pairing with me and helping me improve the code and
functionality.

Jason picture by
<small>[Robert Ball](https://secure.flickr.com/photos/robertball/) -
https://secure.flickr.com/photos/robertball/5588712222/ CC
License</small>

## LICENSE

Copyright © 2014 - Fernando Briano

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
