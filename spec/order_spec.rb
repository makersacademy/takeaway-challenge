require 'order'

describe Order do
  let(:description) {"Cheeseburger"}
  let(:price) {4.99}
  let(:burger_to_s) {"#{description}\t#{price}"}
  let(:burger) {double :dish, :description => description,
                              :price => price,
                              :to_s => burger_to_s }
  let(:menu) {double :menu}
  let(:menu_klass) {double :menu_klass, new: menu}
  subject(:order) {described_class.new(menu_klass: menu_klass)}

  context 'Order Lines' do
    it {is_expected.to respond_to(:order_lines)}
  end

  context 'Initialization' do
    it 'starts with an empty order' do
      expect(order.order_lines).to be_empty
    end
  end
  context 'Pick item from menu' do
    it {is_expected.to respond_to(:pick).with(1).argument}

    it 'returns a dish from the menu' do
      allow(menu).to receive(:choose).with(description).and_return(burger)
      expect(order.pick(description)).to eq burger
    end
  end
  context 'Add an item to the order' do
    it {is_expected.to respond_to(:add).with(2).arguments}

    it 'Adds an item to the order' do
      order.add(burger, 1)
      expect(order.order_lines).not_to be_empty
    end
  end
  context 'Print an order' do
    it 'prints the order' do
      order.add(burger,1)
      expect(order.to_s).to eq "1\t#{burger_to_s}\n"
    end
  end
end
