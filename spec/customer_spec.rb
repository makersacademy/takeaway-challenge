require 'customer'

describe Customer do
  let(:customer) { Customer.new }
  let(:show_menu) { double :show_menu, :sloppy_sandwich => 2.00, :slimy_salami => 5.00 }
  
  it "can view menu" do
    expect(customer.view_menu).to eq show_menu
  end
end