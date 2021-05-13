class Offenses
  attr_accessor :arr

  def initialize(arr = [])
    @arr = arr
  end

  def push_offenses(offense)
    arr.push(offense)
  end

  def count_offenses
    arr.length
  end

  def print_offenses
    puts arr
  end
end
