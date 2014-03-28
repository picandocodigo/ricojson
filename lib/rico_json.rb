# -*- coding: utf-8 -*-
require 'json'
require 'tempfile'

module RicoJSON
  if RUBY_PLATFORM =~ /linux/
    def self.open(json)
      `xdg-open #{json.path}`
    end
  elsif RUBY_PLATFORM =~ /macos|darwin/
    def self.open(json)
      `open -t #{json.path}`
    end
  end

  def self.read_file(filename, open = false)
    read_string(File.read(filename), open)
  end

  def self.read_string(json_string, open = false)
    body = JSON.pretty_generate(JSON.parse(json_string))
    if open
      open_in_file(body)
    else
      puts body
    end
  end

  def self.open_in_file(body)
    fork do
      json = Tempfile.new(['json', '.json'])
      json.write(body)
      json.close
      open(json)
    end
  end
end
