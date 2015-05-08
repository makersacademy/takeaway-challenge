require 'customer'

describe Customer do
  let(:customer) { Customer.new }
  let(:show_menu) { double :show_menu, :sloppy_sandwich => 2.00, :slimy_salami => 5.00 }
  
  it "can add item from menu to his basket" do
    expect(customer.view_menu).to eq show_menu
  end

  it "can specify quantity of each item to add ot basket" do
    
  end

  it "has a name" do
    
  end

  it "has a number" do
    
  end

  it "can make payment with order" do
    
  end

  it "can receive text from menu" do
    
  end
end