require 'order'

describe Order do
subject(:order) { Order.new }
let(:menu)             { double :menu }
# before { expect(menu).to receive(:make_order).with('spring rolls', 2) }
let(:order_make_order)   { order.make_order('spring rolls', 2) }

  it "knows its basket" do
    expect(order.basket).to eq({})
  end

  describe '#make_order' do
    it { is_expected.to respond_to(:make_order).with(2).arguments }
    it 'shows items added to basket' do
      expect(order_make_order).to eq('added to basket: spring rolls x2')
    end
# should this be in basket spec? Seems tautological as its defined above
    it "adds to basket" do
      order_make_order
      expect(order.basket).to eq({'spring rolls' => 2})
      # what about cost?
    end
  end

  # describe "#check_order" do
  #   # context "when order added to basket" do
  #   it "shows order details" do
  #     menu.make_order
  #     expect(order.check_order).to eq("spring rolls x2: £7.98")
  #   end
  # end
end
