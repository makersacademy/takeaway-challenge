require './lib/customer.rb'
require './lib/menu.rb'

describe Customer do

  let(:customer) {Customer.new}

  it 'can check the menu' do
    expect(customer.check_menu).to include('pepperoni pizza' => 5.00, 'spaghetti pomodoro' => 6.00, 'spaghetti carbonara' => 7.50)
  end



end
