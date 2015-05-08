require 'customer'
describe Customer do

  it {is_expected.to respond_to :view_menu}

  it 'can view menu' do
    customer = Customer.new
    expect(customer.view_menu).to_not be_empty
  end
end