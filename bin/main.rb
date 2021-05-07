#!/usr/bin/env ruby
require_relative '../lib/indentation'
require_relative '../lib/white_space'
require_relative '../lib/missing_tags'
require_relative '../lib/missing_end'
require_relative '../lib/empty_line'


for arg in ARGV
    TicTacToe::Indentation.new(arg)
    TicTacToe::Missing_tags.new(arg)
    TicTacToe::White_space.new(arg)
    TicTacToe::Missing_end.new(arg)
    TicTacToe::Empty_line.new(arg)
    puts arg
end
