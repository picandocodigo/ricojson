Gem::Specification.new do |s|
  s.name = 'jsonx'
  s.version = '0.0.1'
  s.date = '2014-03-27'
  s.summary = 'A gem to prettify JSON files and open them in default app'
  s.description = 'Uses Ruby\'s JSON to parse and format json files and opens them in the system\'s default application.'
  s.authors = ['Fernando Briano']
  s.email = 'fernando@picandocodigo.net'
  s.files = ['lib/jsonx.rb']
  s.homepage = 'https://github.com/picandocodigo/jsonx'
  s.licenses = ['GPL-3']
  s.executables << 'jsonx'
  s.add_development_dependency 'minitest', '~> 5.3'
  s.add_development_dependency 'rubocop', '~> 0.19'
end
