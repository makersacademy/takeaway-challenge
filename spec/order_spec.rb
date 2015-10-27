require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:item) { 'kimchi' }
  let(:quantity) { 2 }
  let(:menu) { double(:menu, dishes: { "kimchi" => 2 }) }


  context '#initialize' do
    it 'has an empty basket' do
      expect(order.basket).to be_empty
    end
  end

  context '#add_basket' do
    it 'adds items to basket' do
      expect(order.add_basket(item, quantity)).to change{order.basket.length}.by(1)
    end
  end

  context '#basket_summary' do
    it 'creates an basket summary' do
      order.add_basket('kimchi', 2)
      order.add_basket('salmon maki', 3)
      expect(order.basket_summary).to eq("kimchi x2 = £6.00, salmon maki x3 = £16.50")
    end
  end

  context '#total' do
    it 'shows the total price' do
      order.add_basket('kimchi', 2)
      order.add_basket('salmon maki', 3)
      expect(order.total).to eq("Total: £22.50")
    end
  end
end