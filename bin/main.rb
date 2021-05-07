#!/usr/bin/env ruby
require 'find'
require 'colorize'
require_relative '../lib/offenses'
require_relative '../lib/empty_file'

class_offense = Offenses.new

def ignore_git_file(str)
  !str.index('./.git/')
end

num_of_files = Dir["**/*\.rb"].length
puts "Inspecting #{num_of_files} files"
puts "\n"
puts 'Offenses:'

Find.find('.') do |file|
  EmptyFile.new(file, class_offense) if ignore_git_file(file)
end

puts "\n"
num_offenses = if class_offense.count_offenses.positive?
                 class_offense.count_offenses.to_s.red + ' offense'.red
               else
                 'no offenses'.green
               end
class_offense.print_offenses
puts "\n"
puts "#{num_of_files} files inspected, #{num_offenses} detected"
