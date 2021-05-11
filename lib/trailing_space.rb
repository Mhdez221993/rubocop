class TrailingSpace
  attr_accessor :file, :class_offense

  def initialize(file, class_offense)
    @file = file
    @class_offense = class_offense
    trailing_white_space
  end

  def trailing_white_space
    File.readlines(file, chomp: true).each_with_index do |line, index|
      offenses = "#{file.blue}: #{index + 1}:#{line.size} Layout/TrailingWhitespace: Trailing whitespace detected"
      class_offense.push_offenses(offenses) if line[line.size - 1] == ' '
    end
  end
end
