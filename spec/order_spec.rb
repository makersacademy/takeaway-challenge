require 'order'

describe Order do
  subject(:order) { described_class.new(:menu)}
  let(:menu) { double :menu, show_menu: juices}
  let(:juices) { { "juice1" => 3.00, "juice2" => 2.00} }
  let(:juice1) { double (:juice1), :juice1 => 3.00 }
  let(:juice2) { double (:juice2), :juice2 => 2.00 }

  it 'initializes with an empty basket' do
    expect(order.basket).to eq []
  end

  describe '#add_to_basket' do
    it 'adds a juice to the basket' do
      order.add_to_basket(juice1)
      expect(order.basket).to eq [juice1]
    end
  end

  # describe '#total' do
  #   it 'calculates the total due for items in the basket' do
  #     allow(menu).to receive(:show_menu).and_return (juices)
  #     allow(order).to receive(:calculated_total).and_return 5
  #     order.add_to_basket(juice1)
  #     order.add_to_basket(juice2)
  #     expect(order.total(5)).to eq 5
  #   end
  # end

end
