#!/usr/bin/env ruby
# frozen_string_literal: true

require 'find'
require 'colorize'
require_relative '../lib/offenses'
require_relative '../lib/empty_file'
require_relative '../lib/trailing_space'
require_relative '../lib/indentation'

class_offense = Offenses.new
files = ARGV.empty? ? Dir["**/*\.rb"] : ARGV
puts "Inspecting #{files.size} files"
puts "\n"
puts 'Offenses:'
files.each do |file|
  EmptyFile.new(file, class_offense)
  TrailingSpace.new(file, class_offense)
  Indentation.new(file, class_offense)
end

puts "\n"
num = class_offense.count_offenses
class_offense.print_offenses
puts "\n"
puts "#{files.size} files inspected, #{num.positive? ? num.to_s + ' offense'.red : 'no offense'.green} detected"
