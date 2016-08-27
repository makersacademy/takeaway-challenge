require 'dishes'

describe Dishes do

  let(:order1) { double :order1, sum: 15, list: ["chicken", 1]}
  let(:order2) { double :order1, sum: 10, list: ["chicken", 1]}

  describe '#available_dishes' do

    it 'should return a list of only available dishes and prices' do
      expect(subject.available_dishes).to_not be nil
    end

  end

  describe 'check_sum' do

    before(:each) do
      @sum = 34
      @sum2 = 30
      @list = [[:chicken,1],[:spinach,3],[:potatoes,2]]
    end

    it 'should return true if the sum of requested dishes equals the sum in the order' do
      expect(subject.check_sum(@list, @sum)).to eq true
    end

    it 'should return false if the sum of requested dish prices does not equal sum in the order' do
      expect(subject.check_sum(@list, @sum2)).to eq false
    end
  end


end
