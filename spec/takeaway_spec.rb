require './lib/menu'
require './lib/order'


describe Order do
  subject(:order) { described_class.new }
  let(:menu) {double :menu}
  before do
    order.select_food("burger", 2)
  end
  it " checks order selection is put into shopping cart" do
    subject.select_food("peking duck", 3)
    expect(subject.shopping_cart.length).to eq (2)
  end

  it "should add the selection to the order" do
    expect(order.shopping_cart).to eq ([{ :burger => 2 }])
  end

  it "should display to total price" do
    order = Order.new
      order.select_food("fries", 2)
      order.select_food("burger", 4)
      order.get_price
      expect(order.calculate_total).to eq 20
    end

    it "should calculate total of each food_item for different quantities" do
        order = Order.new
        order.select_food("fries", 2)
        expect(order.shopping_cart).to eq [{:fries=>2}]
    end

    it "should have a greeting, that welcomes the customer and lists the food items" do
    allow(menu).to receive(:greeting) {"Welcome to McCampbell's"}
    allow(menu).to receive(:read_menu) {[nil, nil, nil, nil]}
    allow(order).to receive(:start) {[nil, nil, nil, nil]}
    expect(order.start).to eq([nil, nil, nil, nil])
  end

  it "should calculate total for that item" do
    order = Order.new
    order.select_food("fries", 2)
    order.get_price
    expect(order.final_item_price).to eq [8]
  end
end
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  # let(:dishes){ double :dishes}


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
