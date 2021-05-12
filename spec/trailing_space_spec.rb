require_relative '../lib/trailing_space'
require_relative '../lib/offenses'
require 'colorize'

describe TrailingSpace do
  let(:offense) { Offenses.new }
  before { File.write('mock.rb', '') && File.write('mock_line.rb', 'Hello World! ') }
  after { File.delete('mock.rb') && File.delete('mock_line.rb') }
  let(:trailing) { TrailingSpace.new('mock_line.rb', offense) }

  describe '.initialize' do
    it 'raise error if not argument is given' do
      expect { TrailingSpace.new }.to raise_error(ArgumentError)
    end

    it 'not raise error if argument is given' do
      expect { TrailingSpace.new('mock.rb', offense) }.not_to raise_error(ArgumentError)
    end
  end

  describe '#trailing_white_space' do
    it 'return the content of the file' do
      expect(trailing.trailing_white_space).to eq ['Hello World! ']
    end

    it 'push the error to the offenses array' do
      trailing.trailing_white_space
      expect(offense.count_offenses).to eq 2
    end
  end

  describe '#find_end_keyword' do
    it 'return the the index of the mached regex' do
      str = 'end'
      expect(trailing.find_end_keyword(str)).to eq 0
    end

    it 'return nil if no match the regex' do
      str = 'def'
      expect(trailing.find_end_keyword(str)).to eq nil
    end
  end

  describe '#end_empty_keyword' do
    it 'return the the index of the mached regex' do
      str = 'class def end'
      expect(trailing.end_empty_keyword(str)).to eq 10
    end

    it 'return nil if no match the regex' do
      str = 'def'
      expect(trailing.end_empty_keyword(str)).to eq nil
    end
  end
end
