require 'json'
require 'tempfile'


module RicoJSON
  if RUBY_PLATFORM =~ /linux/
    def self.open(json)
      `xdg-open #{json.path}`
    end
  elsif RUBY_PLATFORM =~ /macos|darwin/
    def self.open(json)
      `open #{json.path}`
    end
  end

  def self.read_file(filename)
    read_string File.read(filename)
  end

  def self.read_string(json_string)
    body = JSON.pretty_generate(JSON.parse(json_string))
    fork do
      json = Tempfile.new(["json", '.json'])
      json.write(body)
      json.close
      open(json)
    end
  end
end
