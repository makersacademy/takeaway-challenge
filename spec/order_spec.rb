require 'order'
require 'takeaway'

describe Order do 
    it 'stores my selected dishes' do
    takeaway = Takeaway.new
    order = Order.new
    takeaway.add_to_order("Eggs Benedict")
    expect(takeaway.order.basket).to include ["Eggs Benedict", 8.5]
    end 
end 