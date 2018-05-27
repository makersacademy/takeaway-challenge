require 'menu'

describe Menu do

let(:menu) { described_class.new }
let(:dish) { double :dish }
let(:add_dish) { double :add_dish }
let(:order_list) { double :order_list }
let(:restaurant_app){{ dish: dish, add_dish: add_dish, order_list: order_list }}
#let(:list_of_dishes) { double :list_of_dishes }

  it '#print list of dishes and prices' do
    expect(menu.print_menu).to eq menu.list_of_dishes
  end

  it 'respond to #select_food' do
    expect(menu).to respond_to(:select_food)
  end

  it 'add selected dish on restaurant_app' do
    expect(menu.select_food).to eq p restaurant_app.add_dish("Margherita")
  end
end
