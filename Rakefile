#!/usr/bin/env rake
require "rake/testtask"
require "sinatra/activerecord/rake"
require_relative "./app/request_sandbox"


task :default => :test

Rake::TestTask.new do |t|
  t.libs << "."
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end





