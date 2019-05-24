
require './lib/order.rb'
require './lib/dish_list.rb'

describe Order do

  let(:order) { Order.new(menu) }
  let(:menu) { double(:dish_list, :menu => "Pizza - 6.5") }
  let(:dish_list_class) { double(:dish_list_class, :new => menu)}

  it 'can show all dishes with prices in a nice format' do
    order
    expect(order.view_dishes).to eq("Pizza - 6.5")
  end

  it 'can select a specific dish and display price' do
    o = Order.new
    expect(o.dish_list.dish_list_prices[:chicken_pesto]).to eq(44)
  end

  it 'can record the price of multiples of an item' do
    o = Order.new
    o.food_selection(:chilli_chicken, 2)
    expect(o.price_tracker).to eq([45, 45])
  end

  it 'can select multiple items and quantities and store these' do
    o = Order.new
    o.food_selection(:chilli_chicken, 2)
    o.food_selection(:chicken_pesto)
    expect(o.price_tracker).to eq([45, 45, 44])
  end




end
