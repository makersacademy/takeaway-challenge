require 'menu'

describe Menu do
  let(:pizza_double) { double(:dish_pizza, id: :Pizza, price: 2) }
  let(:lasagne_double) { double(:dish_lasagne, id: :Lasagne, price: 5) }

  describe '#initialize' do
    it 'is expected to be empty at creation' do
      expect(subject.items).to eq({}) 
    end
  end

  describe '#add' do
    it 'is expected to add item and price to the menu' do
      subject.add(:pizza, pizza_double)
      expect(subject.items).to eq({ pizza: pizza_double })
    end
  end

  describe '#remove' do
    it 'is expected to remove item and price from the menu' do
      subject.add(:pizza, pizza_double)
      subject.remove(:pizza)
      expect(subject.items).to eq({})
    end
  end

  describe '#print_menu' do
    it { is_expected.to respond_to(:print_menu) }

    it 'prints the menu for the user' do
      subject.add(:pizza, pizza_double)
      subject.add(:lasagne, lasagne_double)
      expect(subject.print_menu).to eq("Menu\nPizza £2\nLasagne £5")
    end
  end
end
