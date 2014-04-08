# -*- coding: utf-8 -*-
require 'json'
require 'tempfile'

# Main RicoJSON functionality
module RicoJSON
  # Define open method for GNU/Linux or Mac OS X platforms
  if RUBY_PLATFORM =~ /linux/
    def self.open(json)
      `xdg-open #{json.path}`
    end
  elsif RUBY_PLATFORM =~ /macos|darwin/
    def self.open(json)
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
  def self.read_file(filename, open = false)
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
  def self.read_string(json_string, open = false)
    body = JSON.pretty_generate(JSON.parse(json_string))
    if open
      open_in_file(body)
    else
      puts body
    end
  end

  # Used to open the prettified JSON in a text editor or other
  # system's app
  def self.open_in_file(body)
    fork do
      json = Tempfile.new(['json', '.json'])
      json.write(body)
      json.close
      open(json)
    end
  end
end
