require 'list'

describe 'User stories' do
  let(:dishes) do { lasagna: 4.50, pizza: 7.50, steak: 17.50 } end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'shows a list of dishes with prices' do
    list = List.new(dishes)
    expect(list.show_dishes).to eq "lasagna £4.5 | pizza £7.5 | steak £17.5"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "select a number of dishes" do
    order = Order.new(dishes)
    order.select_dish(:pizza, 1)
    order.select_dish(:lasagna, 3)
    expect(order.current_order).to include(:pizza, :lasagna)
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "confirms that the total of the order is correct" do
    order = Order.new(dishes)
    order.select_dish(:pizza, 1)
    order.select_dish(:lasagna, 3)
    expect(order.confirm_total(21)).to eq true

  end
end
