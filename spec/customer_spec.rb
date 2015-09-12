require './lib/customer.rb'
require './lib/menu.rb'

describe Customer do

  let(:customer) {Customer.new}

  it 'can check the menu' do
    expect(customer.check_menu).to include('pepperoni pizza' => 5.00, 'spaghetti pomodoro' => 6.00, 'spaghetti carbonara' => 7.50, 'chicken & mushroom risotto' => 8.50, 'garlic bread' => 3.50, 'spaghetti bolognese' => 7.00)
  end

  it 'responds to select_dishes with 2 arguments' do
    expect(customer).to respond_to(:select_dishes).with(2).arguments
  end

end
