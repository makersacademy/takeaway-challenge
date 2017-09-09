require 'order.rb'

order = Order.new
menu = Menu.new
describe Order do

  it 'adds item to total order' do
    expect(order.add_item(1)).to eq menu[0]
   end
end
