require "order"
require "menu"
require "interface"

describe Order do

  subject(:order) {described_class.new(Menu.new)}
  let(:food) {double(:dish, :dish_name => "Fish", :dish_price => 5.5)}

  before do
    order.menu.add_dish(food)
    order.menu.add_dish(food)
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "want to check the total of dishes is right" do
    order.ordering(1)
    order.ordering(1)
    expect(order.selection.count).to eq 2
    expect(order.selection.first).to eq food
  end

  it "want to check the total amount is right" do
    order.ordering(1)
    order.ordering(1)
    expect(order.total_amount).to eq 11
    order.ordering(1)
    expect(order.total_amount).to eq 16.5
  end

end
