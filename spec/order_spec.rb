require 'order'

describe Order do

  let(:menu) { double :menu, food: {"Chips" => 1, "Burger" => 2}}

  describe '#make_order' do
    it 'takes the dish and quantity as arguments - quantity defaulted to one' do
    expect(subject).to respond_to(:make_order).with(2).arguments
    end

    it 'adds dish and quantity to the basket instance variable' do
      subject.make_order("Burger", 2)
      expect(subject.basket).to include :Burger => 2
    end

    it 'raises error if dish is not on the menu' do
      allow(menu).to receive(:dish_available?).and_return(true)
      expect { subject.make_order("Cheese") }.to raise_error "Sorry, that dish is not available"
    end
  end

  describe '#check_order' do
    it 'reads back order and gives the total price' do
      subject.make_order('Chips', 2)
      subject.make_order('Burger', 1)
      expect(subject.check_order).to eq 'Chips x 2 Burger x 1 Total: £4'
    end
  end
end
