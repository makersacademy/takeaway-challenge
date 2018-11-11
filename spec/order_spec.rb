require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  it { expect(order.order).to be_empty }

  describe '#add_dish' do
    it "adds dishes to the order" do
      order.add_dish(dish, quantity)
      expect(order.order).to have_key(dish)
      expect(order.order).to have_value(quantity)
    end
  end

  describe '#check' do
    it "checks the items in the basket" do
      order.add_dish("Ruby's Salad", 6)
      expect(order.check).to include("Ruby's Salad"=>6)
    end
  end

  

end
