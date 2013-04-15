require 'bacon'
require 'pry'

require_relative '../lib/latest_ruby'

puts "Ruby: #{ RUBY_VERSION }; Latest Ruby version: #{ Latest::VERSION }"
