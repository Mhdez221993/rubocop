class Indentation
  attr_accessor :file, :class_offense

  def initialize(file, class_offense)
    @file = file
    @class_offense = class_offense
    check_indentation
  end

  def check_indentation
    File.readlines(file, chomp: true).each_with_index do |line, index|
      # p line if typo_of_objec(line)
      if !typo_of_objec(line)
        p line
      end
    end
  end

  def typo_of_objec(str)
    str =~ /(class\s)| (def\s) | (do\s)/
  end
end
