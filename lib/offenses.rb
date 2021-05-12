# frozen_string_literal: true

class Offenses
  attr_accessor :arr, :offenses

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
