class TrailingSpace
  attr_accessor :file, :class_offense

  def initialize(file, class_offense)
    @file = file
    @class_offense = class_offense
    trailing_white_space
  end

  def trailing_white_space
    trailing = ' Layout/TrailingWhitespace: Trailing whitespace detected'
    empty = ' Layout/EmptyLineBetweenDefs: Expected 1 empty line between method definitions; found 0'
    end_keyword = false
    File.readlines(file, chomp: true).each_with_index do |line, index|
      offenses = "#{file.colorize(:blue)}: #{index + 1}:#{line.size}"
      class_offense.push_offenses(offenses + trailing) if line[line.size - 1] == ' '
      class_offense.push_offenses(offenses + empty) if end_keyword && !end_empty_keyword(line)
      end_keyword = find_end_keyword(line) ? true : false
    end
  end

  def find_end_keyword(str)
    str =~ /(end$)/
  end

  def end_empty_keyword(str)
    str =~ /(end$)|(^$)/
  end
end
