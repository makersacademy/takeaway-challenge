require 'menu'

describe Menu do

  describe '#new' do
    subject(:menu_class) { described_class }

    it 'is created without a parameter' do
      expect(subject).to respond_to(:new).with(0).arguments
    end

    it 'attribute drinks is an empty array' do
      expect(subject.new.drinks.empty?).to eq(true)
    end

    it 'attribute sides is an empty array' do
      expect(subject.new.sides.empty?).to eq(true)
    end

    it 'attribute mains is an empty array' do
      expect(subject.new.mains.empty?).to eq(true)
    end

  end

  describe '#put' do
    subject(:menu) { described_class.new }
    let (:item_one) { double name: 'pizza', price: 8, tag: 'main' }
    let (:item_two) { double name: 'sushi', price: 8, tag: 'main' }
    let (:item_three) { double name: 'pepsi', price: 2, tag: 'drink' }
    let (:item_four) { double name: 'chicken wings', price: 2, tag: 'side' }
    let (:item_five) { double name: 'cheesy chips', price: 2, tag: 'side' }

    it 'adds a drink to drinks' do
      expect{ subject.put(item_three) }.to change{ subject.drinks }.from([]).to([item_three])
    end

    it 'adds a main to mains' do
      expect{ subject.put(item_one) }.to change{ subject.mains }.from([]).to([item_one])
    end

    it 'adds a side to sides' do
      expect{ subject.put(item_five) }.to change{ subject.sides }.from([]).to([item_five])
    end

  end

  describe '#view' do
    subject(:menu) { described_class.new }
    let (:item_one) { double name: 'pizza', price: 8, tag: 'main' }
    let (:item_two) { double name: 'sushi', price: 8, tag: 'main' }
    let (:item_three) { double name: 'pepsi', price: 2, tag: 'drink' }
    let (:item_four) { double name: 'chicken wings', price: 2, tag: 'side' }
    let (:item_five) { double name: 'cheesy chips', price: 2, tag: 'side' }

    it 'outputs to stdout' do
      subject.put(item_one)
      subject.put(item_two)
      subject.put(item_three)
      subject.put(item_four)
      expect{ subject.view }.to output.to_stdout
    end

  end

  describe '#get' do
    subject(:menu) { described_class.new }
    let (:item_one) { double name: 'pizza', price: 8, tag: 'main' }
    let (:item_two) { double name: 'sushi', price: 8, tag: 'main' }
    let (:item_three) { double name: 'pepsi', price: 2, tag: 'drink' }
    let (:item_four) { double name: 'chicken wings', price: 2, tag: 'side' }
    let (:item_five) { double name: 'cheesy chips', price: 2, tag: 'side' }

    it 'returns item using menu code' do
      subject.put(item_one)
      subject.put(item_two)
      subject.put(item_three)
      expect(subject.get('M2')).to eq(item_two)
    end

  end

end
