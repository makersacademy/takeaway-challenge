require 'cafe'

describe Cafe do
  subject(:cafe) { described_class.new }
  let(:menu) { double :menu }
  let(:juices) { double :juices }
  let(:order) { double :order }
  let(:dish) { double :dish }
  let(:basket) { double :basket }

  describe '#display' do
    it 'displays the menu' do
      allow(menu).to receive(:show_menu).and_return(juices)
      expect(cafe.display(menu)).to eq juices
    end
  end

  describe '#select_dishes' do
    it 'allows the user to select dishes' do
      expect { cafe.select_dishes(dish) }.not_to raise_error
    end

    it 'adds selected dishes to basket' do
      allow(order).to receive(:add_to_basket).and_return(basket)
      expect(cafe.select_dishes(dish)).to eq cafe.basket
    end

    it 'displays the basket' do
      allow(order).to receive(:add_to_basket).and_return(basket)
      cafe.select_dishes("chips")
      cafe.select_dishes("pizza")
      expect(cafe.basket).to eq ["chips", "pizza"]
    end
  end

end
