require 'order'
require 'menu'

describe Order do
  subject(:order) {Order.new}
  before(:each) do
  @menu = Menu.new.list
  end
  context "can take order" do
    it {is_expected.to respond_to :order_summary}

    it "takes order 'soup'" do
      order1 = order.make_order(:soup)
      expect(order.order_summary).to eq [:soup, 5]
    end
  end

end
