class EmptyFile
  attr_accessor :file, :class_offense

  def initialize(file, class_offense)
    @file = file
    @class_offense = class_offense
    check_if_empty_file
  end

  def check_if_empty_file
    class_offense.push_offenses("#{file.blue}:1:1: w: Lint/EmtyFile: Empty file detected") if File.zero?(file)
  end
end
