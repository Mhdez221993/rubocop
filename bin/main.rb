#!/usr/bin/env ruby
require 'find'
require 'colorize'
require_relative '../lib/offenses'
require_relative '../lib/empty_file'
require_relative '../lib/trailing_space'
require_relative '../lib/indentation'

class_offense = Offenses.new
def ignore_git_file(str)
  str.index('.rb')
end

num_of_files = Dir["**/*\.rb"].length
puts "Inspecting #{num_of_files} files"
puts "\n"
puts 'Offenses:'
Find.find('.') do |file|
  EmptyFile.new(file, class_offense) if ignore_git_file(file)
  # TrailingSpace.new(file, class_offense) if ignore_git_file(file)
  # Indentation.new(file, class_offense) if ignore_git_file(file)
end

puts "\n"
num = class_offense.count_offenses
class_offense.print_offenses
puts "\n"
puts "#{num_of_files} files inspected, #{num.positive? ? num.to_s + ' offense'.red : 'no offense'.green} detected"
