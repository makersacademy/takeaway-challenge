
require 'menu.rb'

describe Menu do
  let(:dishes) do [
    { name: 'Spaghetti', price: 10 },
    { name: 'Bolognese', price: 12 },
    { name: 'Pizza', price: 8 }]
  end

  subject(:menu) { described_class.new(dishes) }

  describe '#initialize' do
    it 'is initialized with a list of dishes' do
      expect(menu.dishes).to eq dishes
    end
  end

  describe '#show' do
    it 'outputs the list of dishes' do
      expect(subject.show).to eq "Spaghetti: £10\nBolognese: £12\nPizza: £8"
    end
  end
end
