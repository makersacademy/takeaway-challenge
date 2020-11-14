require 'order'
require 'menu'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new(menu) }
  it "can calculate the total cost of the order" do
    expect(order).to respond_to(:total)
  end

  it "records the quantity of each dish ordered" do
    expect(order).to respond_to(:total_quantity)
  end

  it "returns a list of dishes in the order" do
    expect(order).to respond_to(:list_dishes)
  end

  describe "#total" do
    let(:dish) { double :dish, price: 5 }
    let(:menu) { double :menu }
    it "returns an order total of 10 for two 5 pound dishes ordered" do
      test_order = Order.new
      test_order.add(dish, 2)
      expect(test_order.total).to eq 10
    end
  end

  describe "#add" do
    it "adds dishes to the order" do
      expect(order).to respond_to :add
    end
  end

  def confirm_order(time = calculate_time)
    message = "Thank you! Your order was placed and will be delivered before #{time}"
    return message if @confirmation == "Confirm"
  end 

end
