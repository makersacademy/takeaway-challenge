require 'customer'
describe Customer do

  it {is_expected.to respond_to :view_menu}

  it 'can view menu' do
    customer = Customer.new
    expect(customer.view_menu).to_not be_empty
  end
  it 'can select dishes' do
    customer = Customer.new
    restaurant = Restaurant.new
    customer.select_dishes :Beef_BBQ, 1
    customer.select_dishes :Vegetable, 2
    expect(customer.restaurant.order).to eq [{:Beef_BBQ => 15}, {:Vegetable => 16}, {:Vegetable => 16}]
  end
end