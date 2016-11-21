require "./lib/order"

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu) }
  let(:confirmation) { double{:confirmation} }

  before do
    order.select_items("burrito", 2)
  end

  it "should have a start method, that welcomes the customer and lists the menu" do
    allow(menu).to receive(:welcome) {"Welcome to Dan's Mexican Resturaunt."}
    allow(menu).to receive(:list_menu) {[nil, nil, nil, nil]}
    allow(order).to receive(:start) {[nil, nil, nil, nil]}
    expect(order.start).to eq([nil, nil, nil, nil])
  end

  it "should allow a customer to order a number of items" do
    expect(order.selection).to eq({ :burrito => 2 })
  end


  it "should add the selection to the order" do
    expect(order.shopping_cart).to eq ([{ :burrito => 2 }])
  end

  it "should get the price of each item in the order" do
    expect(order.get_price).to eq([{:burrito=>2}])
  end

  context "#price_calculation" do
    before do
      order.get_price
      order.calculate_total_price
    end

    it "should display to total price" do
      order.calculate_total_price
      expect(order.display_total_price).to eq "Your total is £12"
    end

    it "should raise an error if the total is incorrect" do
      order.calculate_total_price * 2
      expect{(order.display_total_price).to raise_error("An error has occurred. Please try again")}
    end

    it "should keep track of the prices" do
      expect(order.prices).to eq([12])
    end

    it "should sum the totals of the orders" do
      order.calculate_total_price
      expect(order.total).to eq 12
    end


    it "should give the user an option to confirm" do
      expect(order.confirm_message).to eq "Do you want to confirm this order?"
    end

    it "should cacel the order if the user does not confirm it" do
      expect{order.confirm("no").to raise_error "You have cancelled your order. Please try again"}
    end

  end
end
