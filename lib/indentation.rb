module TicTacToe
  class Indentation
    attr_accessor :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end
  end
end
