require "./lib/order"

describe Order do
  subject(:order) {described_class.new}

  before do
    order.select_items("burrito", 2)
  end

  it "should allow a customer to order a number of items" do
    expect(order.selection).to eq({ :burrito => 2 })
  end


  it "should add the selection to the order" do
    expect(order.shopping_cart).to eq ([{ :burrito => 2 }])
  end

  it "should get the price of each item in the order" do
    expect{order.get_price}.to output.to_stdout
  end

  context "#get_price" do
    before do
      order.get_price
    end

    it "should keep track of the prices" do
      expect(order.prices).to eq([12])
    end

    it "should sum the totals of the orders" do
      order.calculate_total_price
      expect(order.total).to eq 12
    end

    it "should display to total price" do
      order.calculate_total_price
      expect(order.display_total_price).to eq "Your total is £12"
    end

  end

end
