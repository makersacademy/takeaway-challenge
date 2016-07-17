require 'takeaway'

describe Takeaway do

  subject {described_class.new}

  describe '.initialize' do
    it 'initializes with an empty order' do
      expect(subject.basket).to eq {}
    end
  end

  describe '.menu' do

    it 'prints out the list of dishes'
  end

  describe '.order' do

    it 'adds the dish to the order' do
      subject.order("Fried Rice", 1)
      expect(subject.basket).to include "Fried Rice"
    end

    it 'should fail if order is less than 1' do
      message = "Order value must be more than 0"
      expect{subject.order("Fried Rice", 0)}.to raise_error message
    end

    it 'should fail if dish is not on the menu' do
      message = "Carbonara is not on the menu. Sorry!"
      expect{subject.order("Carbonara", 1)}.to raise_error message
    end

    it 'should update quantity if dish already ordered' do

    end
  end

  describe '.checkout' do
    it 'should fail if the order is less than 1' do

    end
  end

end
