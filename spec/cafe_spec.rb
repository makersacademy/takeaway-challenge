require 'cafe'

describe Cafe do
  subject(:cafe) { described_class.new(menu, order) }
  let(:menu) { double :menu, show_menu: juices}
  let(:juices) { { "juice1" => 3.00, "juice2" => 2.00} }
  let(:order) { double :order }
  let(:juice1) { double :juice1 => 2.00 }
  let(:juice2) { double :juice2 => 3.00 }

  describe '#display' do
    it 'displays the menu' do
      allow(menu).to receive(:show_menu).and_return(juices)
      expect(cafe.display).to eq juices
    end
  end

  describe '#select_juices' do
    it 'allows the user to select juices' do
      allow(menu).to receive(:on_menu?)
      allow(order).to receive(:add_to_basket)
      expect { cafe.select_juices(juice1) }.not_to raise_error
    end

    it 'adds selected juices to basket' do
      allow(menu).to receive(:on_menu?)
      allow(order).to receive(:add_to_basket)
      allow(order).to receive(:basket)
      expect(cafe.select_juices(juice1)).to eq cafe.show_basket
    end
  end

  describe '#show_basket' do
    it 'displays the basket' do
      allow(menu).to receive(:on_menu?)
      allow(order).to receive(:add_to_basket)
      allow(order).to receive(:basket).and_return ([juice1, juice2])
      cafe.select_juices(juice1)
      cafe.select_juices(juice2)
      expect(cafe.show_basket).to eq [juice1, juice2]
    end
  end

  describe '#check_total' do
    it 'shows the total amount due' do
      allow(menu).to receive(:on_menu?)
      allow(order).to receive(:add_to_basket)
      allow(order).to receive(:total).and_return 5
      cafe.select_juices(juice1)
      cafe.select_juices(juice2)
      expect(cafe.check_total(5)).to eq order.total
    end
  end

end
