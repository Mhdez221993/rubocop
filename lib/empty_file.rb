class EmptyFile
  attr_accessor :file, :class_offense

  def initialize(file, class_offense)
    @file = file
    @class_offense = class_offense
    check_if_empty_file
    call_check_last_line
  end

  def check_if_empty_file
    if File.zero?(file)
      class_offense.push_offenses("#{file.colorize(:blue)}:1:1: w: Lint/EmtyFile: Empty file detected")
    end
  end

  def check_last_line
    message = 'C: Layout/TrailingEmptyLines: Final newline missing'
    f = File.readlines(file)
    line = f[f.size - 1]
    unless line =~ /\n$/
      class_offense.push_offenses("#{file.colorize(:blue)}:#{file.size + 1}:#{line.size + 1}: " + message)
    end
  end

  def call_check_last_line
    check_last_line unless File.zero?(file)
  end
end
