require 'order'
require 'takeaway'
require 'menu'

describe Order do

  it "should make a list and calculate the total amount" do
    takeaway = Takeaway.new
    takeaway.make_a_new_order
    takeaway.select_dish(1)
    takeaway.select_dish(2)
    expect(takeaway.order.calculate_total).to eq 6.5
  end

  it "should add dishes to a list" do
    takeaway = Takeaway.new
    takeaway.make_a_new_order
    takeaway.select_dish(1)
    takeaway.select_dish(2)
    expect(takeaway.order.order).to eq [{ :dish => "Olives and sun-dried tomatos", :price => 2 },
    { :dish => "Soup of the day", :price => 4.5 }]
  end


end
