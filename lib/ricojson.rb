require 'json'
require 'tempfile'

# Main RicoJSON functionality
module RicoJSON
  class << self
    # Define open_in_app method for GNU/Linux or Mac OS X platforms
    def open_in_app(json)
      if RUBY_PLATFORM =~ /linux/
        `xdg-open #{json.path}`
      elsif RUBY_PLATFORM =~ /macos|darwin/
        `open -t #{json.path}`
      end
    end

    # Method for reading a file as an input
    #
    # Example:
    #   $ ricojson -f comics.json
    #
    # Arguments:
    #   filename: Name of the input file
    #   open:     Open the file in the default app/text editor for ,json
    # files (optional)
    #
    # == Returns:
    #   JSON Rico y Suave
    def read_file(filename, open = false)
      read_string(File.read(filename), open)
    end

    # Method for reading a String as an input
    #
    # Example:
    #   $ cat comics.json | ricojson
    #
    # Arguments:
    #   json_string: Incoming String (could be piped from curl, cat,
    #   echo, etc)
    #   open:     Open the file in the default app/text editor for ,json
    # files (optional)
    #
    # == Returns:
    #   JSON Rico y Suave
    def read_string(json_string, open = false)
      body = JSON.pretty_generate(JSON.parse(json_string))
      if open
        open_in_file(body)
      else
        puts body
      end
    end

    # Used to open the prettified JSON in a text editor or other
    # system's app
    def open_in_file(body)
      fork do
        json = Tempfile.new(['json', '.json'])
        json.write(body)
        json.close
        open_in_app(json)
      end
    end
  end
end
