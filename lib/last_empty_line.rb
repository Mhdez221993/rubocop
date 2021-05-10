class LastEmptyLine
  attr_accessor :file, :class_offense

  def initialize(file, class_offense)
    @file = file
    @class_offense = class_offense
    last_empty_line
  end

  def last_empty_line
    # p  File.readlines(file).scan(/$|\Z/)
    # File.readlines(file) { |line| puts line }
    # File.foreach(file).with_index { |line, index| puts "#{index}: #{line}" }
    # p File.readlines(file).count
    # p File.readlines(file.scan(/$|\Z/))
  end
end
