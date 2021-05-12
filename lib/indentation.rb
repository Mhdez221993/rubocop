# frozen_string_literal: true

class Indentation
  attr_accessor :file, :class_offense

  def initialize(file, class_offense)
    @file = file
    @class_offense = class_offense
    check_indentation
  end

  def check_indentation
    outer = 0
    File.readlines(file, chomp: true).each_with_index do |line, index|
      space = line.index(/[^ ]/)
      offenses = "#{file.blue}:#{index + 1} Layout/IndentationWidth: use #{outer} (not #{space}) spaces for indentation"
      if find_method_or_class(line)
        class_offense.push_offenses(offenses) unless outer == space
        outer += 2
      elsif find_end_keyword(line)
        outer -= 2
        class_offense.push_offenses(offenses) if outer != space
      elsif find_else_keyword(line)
        class_offense.push_offenses(offenses) if outer - 2 != space
      elsif !line.split.empty?
        class_offense.push_offenses(offenses) if outer != space
      end
    end
  end

  def find_method_or_class(str)
    str =~ /(^\s*class\s)|(^\s*def\s)|(\sdo\s)|(^\s*if)|(\sdo$)/
  end

  def find_end_keyword(str)
    str =~ /(end$)/
  end

  def find_else_keyword(str)
    str =~ /(^\s*els)/
  end
end
