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
      offenses = "#{file}: #{index + 1}: #{line}: #{outer}: #{line.index(/[^ ]/)}"
      if find_method_or_class(line)
        class_offense.push_offenses(offenses) unless outer == line.index(/[^ ]/)
        outer += 2
      elsif find_end_keyword(line)
        outer -= 2
        class_offense.push_offenses(offenses) if outer != line.index(/[^ ]/)
      end
    end
  end

  def find_method_or_class(str)
    return true if (str =~ /(^\s*if)/) == 0
    str =~ /(class\s)|(def\s)|(do\s)/
  end

  def find_end_keyword(str)
    str =~ /(end$)/
  end
end
