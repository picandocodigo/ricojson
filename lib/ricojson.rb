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
  def self.read_file(filename, open = false, colors = false)
    read_string(File.read(filename), open, colors)
  end

  def self.loop(json, level = 0)
    json.each do|k,v|
      #print "\033[1m#{k}\033[0m (#{v.class}) "
      print "  "*level
      #printf("\033[1m%-15s\033[0m ", k)
      print "\033[1m#{k}\033[0m: "
      #print v.class
      case v
      when String
        print "\033[31m\"#{v}\"\033[0m"
      when Array
        print "[\n"
        level += 1
        loopArray(v, level)
        print "]"
        level -= 1
      when NilClass
        print "\033[34m#{k}\033[0m"
      else
        print v
      end
      print "\n"
    end
  end

  def self.loopArray(json, level)
    json.each do|v|
      print "  "*level
      case v
      when String
        print "\033[31m\"#{v}\"\033[0m"
      when Array
        print "[\n"
        level += 1
        loop(v, level)
        print "]"
        level -= 1
      else
        print "\033[34m#{v}\033[0m"
      end
      print "\n"
    end
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
  def self.read_string(json_string, open = false, colors = false)
    json = JSON.parse(json_string)
    if open
      open_in_file(JSON.pretty_generate(json))
    elseif colors
      loop(json)
    else
      puts JSON.pretty_generate(json) 
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
