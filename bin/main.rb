#!/usr/bin/env ruby
require_relative '../lib/indentation'
require_relative '../lib/white_space'
require_relative '../lib/missing_tags'
require_relative '../lib/missing_end'
require_relative '../lib/empty_line'

ARGV.each do |arg|
  Indentation.new(arg)
  Missing_tags.new(arg)
  White_space.new(arg)
  Missing_end.new(arg)
  Empty_line.new(arg)
end
