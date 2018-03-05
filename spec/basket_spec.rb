require 'basket'

describe Basket do

  describe '#new' do
    subject(:basket_class) { described_class }

    it 'is created without a parameter' do
      expect(subject).to respond_to(:new).with(0).arguments
    end

    it 'attribute basket is an empty array' do
      expect(subject.new.basket.empty?).to eq(true)
    end

    it 'total is 0' do
      expect(subject.new.total).to eq(0)
    end

  end

  describe '#add' do
    subject(:basket) { described_class.new }
    let (:item_one) { double name: 'pizza', price: 8 }
    let (:item_two) { double name: 'sushi', price: 8 }
    let (:item_three) { double name: 'pepsi', price: 2 }


    it 'adds an object to attribute items' do
      expect{ subject.add(:item_one) }.to change{ subject.basket }.from([]).to([[:item_one]])
    end

    it 'takes a second parameter to add multiple times' do
      expect{ subject.add(:item_two, 3) }.to change{ subject.basket }.from([]).to([[:item_two, :item_two, :item_two]])
    end

  end

  describe '#total' do
    subject(:basket) { described_class.new }
    let (:item_one) { double name: 'pizza', price: 8 }
    let (:item_two) { double name: 'sushi', price: 8 }
    let (:item_three) { double name: 'pepsi', price: 2 }

    it 'calculates the vale of items in basket' do
      subject.add(item_one,3)
      subject.add(item_three)
      expect(subject.total).to eq(26)
    end

    it 'calculates the vale of items in basket' do
      subject.add(item_one)
      subject.add(item_three,3)
      expect(subject.total).to eq(14)
    end

  end

  describe '#list' do
    subject(:menu) { described_class.new }
    let (:item_one) { double name: 'pizza', price: 8, tag: 'main' }
    let (:item_two) { double name: 'sushi', price: 8, tag: 'main' }
    let (:item_three) { double name: 'pepsi', price: 2, tag: 'drink' }
    let (:item_four) { double name: 'chicken wings', price: 2, tag: 'side' }
    let (:item_five) { double name: 'cheesy chips', price: 2, tag: 'side' }

    it 'outputs to stdout' do
      subject.add(item_one)
      subject.add(item_two)
      subject.add(item_three)
      subject.add(item_four)
      expect{ subject.list }.to output.to_stdout
    end


  end

end
