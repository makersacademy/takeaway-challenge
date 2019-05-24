
require './lib/order.rb'
require './lib/dish_list.rb'

describe Order do

  let(:order) { Order.new(menu) }
  let(:menu) { double(:dish_list, :menu => "Pizza - 6.5") }
  let(:dish_list_class) { double(:dish_list_class, :new => menu)}

  it 'can show all dishes with prices' do
    order
    expect(order.view_dishes).to eq("Pizza - 6.5")
  end




end
