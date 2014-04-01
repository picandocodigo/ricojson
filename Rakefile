require 'rake/testtask'
require 'ricojson'

Rake::TestTask.new("test") do |t|
  t.pattern = "test/**/*_test.rb"
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'ricojson'
  ARGV.clear
  IRB.start
end

task :default => 'test'
