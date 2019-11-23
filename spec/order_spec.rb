require 'customer'
require 'menu'
require 'order'

describe Order do

  let(:subject) {
    menu = Menu.new({ "kimchi" => 5, "fried rice" => 7, "salmon" => 10} )
    customer = Customer.new("1234")
    Order.new(menu, customer) 
  }
  
  it "should have a total of 0 when empty" do 
    expect(subject.total).to eq 0
  end

  it "should add a dish from the menu" do
    subject.add_dish("kimchi")
  end

  it "should not allow dishes that are not on the menu" do
    expect{ subject.add_dish("chicken") }.to raise_error { "Item not on the menu."}
  end

  it "should return total for one item" do
    subject.add_dish("kimchi")
    expect(subject.total).to eq 5
  end

  it "should return the total for multiple items" do
    subject.add_dish("kimchi")
    subject.add_dish("fried rice")
    expect(subject.total).to eq 12
  end

  it "should return a summary of the order" do
    
  end



end
