require 'order'
require 'takeaway'

describe Order do

  it "should have an order_name when created" do
    expect(subject.instance_variable_get(:@order_name)).to eq('patel')
  end

  it "should contain an empty array called @order_items" do
    expect(subject.instance_variable_get(:@order_items)).to eq([])
  end

  it "should contain an empty array called @order_items" do
    expect(subject.instance_variable_get(:@order_items)).to be_instance_of(Array)
  end

end
