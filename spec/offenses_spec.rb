require_relative '../lib/offenses'
require 'colorize'

describe Offenses do
  let(:offense) { Offenses.new([1, 3]) }
  let(:colorize) { double }
  describe '.initialize' do
    it 'not raise error if no argument given' do
      expect { Offenses.new }.to_not raise_error
    end

    it 'if agument given will be assingned to arr variable' do
      expect(offense.arr).to eq [1, 3]
    end
  end

  describe '#push_offenses' do
    it 'push elements to the array' do
      offense.push_offenses(4)
      expect(offense.arr).to eq [1, 3, 4]
    end
  end

  describe '#count_offenses' do
    it 'return the size of the array' do
      expect(offense.count_offenses).to eq 2
    end
  end

  describe '#print_offenses' do
    it 'print the elemets of the array' do
      expect(offense.print_offenses).to eq nil
    end
  end
end
