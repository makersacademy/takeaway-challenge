require 'order'
describe Order do
  subject(:order){described_class.new}

  it "initializes empty basket" do
    expect(order.cart).to eq []
  end
  context "order methods" do

    before do
      order.add_order("chicken", 2, 2.99)
    end

    it "adds dishes into basket" do
      expect(order.cart).to include ({:dish => "chicken", :price => 2.99, :quantity => 2})
    end

    it "shows order summary" do
      order.add_order("pizza", 2, 2.99)
      expect(order.order_summary).to eq "2x chicken is 5.98, 2x pizza is 5.98."
    end

    it "shows total cost" do
      expect(order.total_price).to eq "Total cost is £5.98."
    end
  end
end
