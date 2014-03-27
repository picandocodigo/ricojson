require 'json'
require 'tempfile'

module JSONX
  def self.run(filename)
    file = File.read(filename)
    json = Tempfile.new(["json", '.json'])

    body = JSON.pretty_generate(JSON.parse(file))

    json.write(body)
    json.close

    # Check Mac OS X / Linux
    `xdg-open #{json.path}`
  end
end
