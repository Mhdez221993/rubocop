# frozen_string_literal: true

require_relative '../lib/indentation'
require_relative '../lib/offenses'
require 'colorize'

describe Indentation do
  let(:offense) { Offenses.new }
  before { File.write('mock.rb', '') && File.write('mock_line.rb', ' Hello World!') }
  let(:indentation) { Indentation.new('mock_line.rb', offense) }
  after { File.delete('mock.rb') && File.delete('mock_line.rb') }

  describe '.initialize' do
    it 'raise error' do
      expect { Indentation.new }.to raise_error(ArgumentError)
    end

    it 'shold not rise error' do
      expect { EmptyFile.new('mock.rb', offense) }.to_not raise_error(ArgumentError)
    end
  end

  describe '#check_indentation' do
    it 'return the content of the file' do
      expect(indentation.check_indentation).to eq [' Hello World!']
    end

    it 'count the numbers of errors' do
      indentation.check_indentation
      expect(offense.count_offenses).to eq 2
    end
  end

  describe '#find_method_or_class' do
    it 'return the index of the mached regex' do
      str = 'def something'
      expect(indentation.find_method_or_class(str)).to eq 0
    end

    it 'return nil if no match the string' do
      str = 'something'
      expect(indentation.find_method_or_class(str)).to eq nil
    end
  end

  describe '#find_end_keyword' do
    it 'rreturn the index of the mached regex' do
      str = '    end'
      expect(indentation.find_end_keyword(str)).to eq 4
    end

    it 'return nil when no match the regex' do
      str = 'somethind'
      expect(indentation.find_end_keyword(str)).to eq nil
    end
  end

  describe '#find_else_keyword' do
    it 'return the index of the mached regex' do
      str = 'else'
      expect(indentation.find_else_keyword(str)).to eq 0
    end

    it 'return nil when no match the regex' do
      str = 'somethind'
      expect(indentation.find_else_keyword(str)).to eq nil
    end
  end
end
