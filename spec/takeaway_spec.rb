require 'takeaway'
require 'order'

describe Takeaway do

  it "exists" do
    expect(subject).to be_instance_of(Takeaway) # this test passes without takeaway.rb
  end

  it "responds to menu method" do
    expect(subject).to respond_to(:menu)
  end

  it "responds to create_order" do
    expect(subject).to respond_to(:create_order)
  end

  it "create_order creates an instance of Order class" do
    order = subject.create_order("patel")
    expect(order).to be_instance_of(Order)
  end

  it "can add items to the active_order" do
    order = subject.create_order("patel")
    order.order_items << "test"
    expect(order.order_items).to include("test")
  end

  it "can find a menu item by dish_id" do

    subject.create_order("patel")
    subject.test_method(1)
    expect(subject.active_order.order_items).to include({:id=>1, :name=>"Dish 1", :price=>6.5})
  end

  it "can send the active order to the kitchen" do
    subject.create_order("name")
    subject.test_method(1)
    subject.submit_order
    expect(subject.kitchen.cooking.length).to eq(1)
  end

end
