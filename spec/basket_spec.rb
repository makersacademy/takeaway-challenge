require 'basket'

describe Basket do
  let(:pizza) { double(:dish, price: 10, name: "Pizza") }

  describe '#store' do

    it 'should store dishes in the basket' do
      subject.add(pizza)
      expect(subject.basket).to include(pizza)
    end

    it 'should start with an empty basket' do
      expect(subject.basket).to be_empty
    end

  end

end
