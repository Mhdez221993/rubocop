require_relative '../lib/empty_file'
require_relative '../lib/offenses'

describe EmptyFile do
  let(:offense) { Offenses.new }
  before { File.write('mock.rb', '') && File.write('mock_line.rb', 'Hello World!') }
  after { File.delete('mock.rb') && File.delete('mock_line.rb') }

  describe '.initialize' do
    it 'raise error if there is no argument' do
      expect { EmptyFile.new }.to raise_error(ArgumentError)
    end

    it 'shold not rise error with a strin an  a class as arguments' do
      expect { EmptyFile.new('bin', offense) }.to_not raise_error(ArgumentError)
    end
  end

  describe '#check_if_empty_file' do
    it 'return return an array with the error message' do
      empty = EmptyFile.new('mock.rb', offense)
      empty.check_if_empty_file
      expect(offense.count_offenses).to eq 2
    end
  end

  describe '#check_last_line' do
    it 'return return an array with the error message' do
      empty = EmptyFile.new('mock_line.rb', offense)
      empty.check_last_line
      expect(offense.count_offenses).to eq 2
    end

    it 'raise error if the file is empty' do
      empty = EmptyFile.new('mock.rb', offense)
      expect { empty.check_last_line }.to raise_error(NoMethodError)
    end
  end

  describe '#call_check_last_line' do
    it 'return nil if the file is empty' do
      empty = EmptyFile.new('mock.rb', offense)
      expect(empty.call_check_last_line).to eq nil
    end

    it 'call check_last_line if file is not empty' do
      empty = EmptyFile.new('mock_line.rb', offense)
      empty.call_check_last_line
      expect(offense.count_offenses).to eq 2
    end
  end
end
