require 'basket'

describe Basket do
  let(:pizza) { double(:dish, price: 10, name: "Pizza") }
  let(:chips) { double(:chips, price: 2, name: "Chips") }

  describe '#store' do

    it 'should store dishes in the basket' do
      subject.add(pizza)
      expect(subject.basket).to include(pizza)
    end

    it 'should start with an empty basket' do
      expect(subject.basket).to be_empty
    end

  end

  describe '#total' do

    it 'should give me the total of what is in the basket' do
      subject.add(pizza)
      subject.add(chips)
      expect(subject.current_total).to eq 12
    end
  end

end
