require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double :menu }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  it { expect(order.order).to be_empty }

  describe '#add' do
    it "adds dishes to the order" do
      order.add(dish, quantity)
      expect(order.order).to have_key(dish)
      expect(order.order).to have_value(quantity)
    end
  end

end
