require "order"

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }

  before do
    order.select_items("rice", 2)
  end

  it "should allow a customer to order a number of items" do
    expect(order.selection).to eq({ :rice => 2 })
  end

  it "should add the selection to the order" do
    expect(order.shopping_cart).to eq([{ :rice => 2 }])
  end

  it "should get the price of each item in the order" do
    expect(order.work_out_price).to eq([{ :rice => 2 }])
  end

  context "#price_calculation" do
    before do
      order.price_calculation
    end

    it "should display to total price" do
      order.calculate_total_price
      expect(order.display_total_price).to eq "Your total is £4"
    end

    it "should keep track of the prices" do
      expect(order.prices).to eq([4])
    end

    it "should sum the totals of the orders" do
      order.calculate_total_price
      expect(order.total).to eq 4
    end

  end
end
