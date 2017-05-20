require 'takeaway'

describe 'User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'so that a customer can place an order he can read a list of dishes' do
    takeaway = Takeaway.new
    menu = Menu.new
    expect { takeaway.read_menu }.not_to raise_error
  end
end
