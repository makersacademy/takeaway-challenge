require 'order'
require 'menu'
require 'dish'

describe Order do
  # let(:menu) {double(:menu)}
  # let(:dish) {double(:dish)}
  # let(:subject) {Order.new(Menu.new)}

  it 'selects a dish and adds it to the order list' do
    # allow(menu).to receive(:list).and_return([dish,2.5])
    dish = Dish.new("katsu",2.5)
    menu = Menu.new()
    menu.add_dish(dish)
    order = Order.new(menu)
    order.select("katsu",2)
    expect(order.list).to eq [["katsu",2.5],["katsu",2.5]]
  end

  xit 'confirms the order and returns the delivery time' do
    # WIP on how to double the Time class (is this even necessary?)
    Time = double(:time)
    allow(Time).to receive(:now).and_return("13:19")
    expect(subject.confirm). to eq "Thank you! Your order was placed and will be delivered before 14:19"
  end
end