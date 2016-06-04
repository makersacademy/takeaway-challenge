require 'order'
require 'dish'
require 'menu'


describe 'Feature Test' do
  it 'works' do
    chinese = Menu.new
    chinese.list
    order = Order.new
    order.add_item("item")
    order.view_order
    order.check_total
    order.place_order
  end
end