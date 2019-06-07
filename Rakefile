# frozen_string_literal: true

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rdoc/task'
require 'devise-extensions/version'

desc 'Default: Run unit tests'
task default: :test

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.test_files = FileList['test/*test*.rb', 'test/**/*test*.rb']
  t.verbose = true
  t.warning = false
end

Rake::RDocTask.new do |rdoc|
  version = DeviseExtensions::VERSION.dup

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "devise-security #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
