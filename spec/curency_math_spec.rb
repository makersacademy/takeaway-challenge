require './lib/currency_math'

describe 'Currency Math' do
  class Test
    include CurrencyMath
  end

  subject { Test.new }

  describe '#multiply' do
    it 'should multiply two numbers' do
      expect(subject.multiply(3.55, 2)).to eq '7.10'
    end

    it 'should accept a string as arguments' do
      expect(subject.multiply('3.55', '2')).to eq '7.10'
    end
  end

  describe '#add' do
    it 'should add two numbers' do
      expect(subject.add(3.29, 1.20)).to eq '4.49'
    end

    it 'should take a string as arguments' do
      expect(subject.add('3.29', '1.20')).to eq '4.49'
    end
  end

  describe '#subtract' do
    it 'should subtract two numbers' do
      expect(subject.subtract(3.29, 1.20)).to eq '2.09'
    end

    it 'should take a string as arguments' do
      expect(subject.subtract('3.29', '1.20')).to eq '2.09'
    end
  end
end