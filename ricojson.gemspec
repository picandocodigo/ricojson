Gem::Specification.new do |s|
  s.name = 'ricojson'
  s.version = '0.1.1'
  s.summary = 'A gem to prettify JSON files and (optionally) open them in default app'
  s.description = 'Uses Ruby\'s JSON to parse and format json files, includes an option to open them in the system\'s default application.'
  s.authors = ['Fernando Briano']
  s.email = 'fernando@picandocodigo.net'
  s.files = ['lib/ricojson.rb']
  s.homepage = 'https://github.com/picandocodigo/ricojson'
  s.licenses = ['LGPL-3.0']
  s.executables << 'ricojson'
  s.add_runtime_dependency('clap')
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rake'
end
