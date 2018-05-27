require 'menu'

describe Menu do

  let(:menu) { described_class.new }
  let(:dish) { double :dish }
  let(:add_dish) { double :add_dish }
  let(:order_list) { double :order_list }
  let(:restaurant_app) { { dish: dish, add_dish: add_dish, order_list: order_list } }

  it '#print list of dishes and prices' do
    expect(menu.print_menu).to eq menu.list_of_dishes
  end

  it 'menu respond to #select_food' do
    expect(menu).to respond_to(:select_food)
  end

  it 'add selected dish on restaurant app' do
    expect(menu.select_food).to eq p restaurant_app.add_dish("Margherita")
  end
end
