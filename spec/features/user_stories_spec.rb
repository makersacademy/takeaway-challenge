require 'takeaway'
require 'menu'

describe 'User Stories' do
  
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'should print list of dishes' do
    takeaway = TakeAway.new
    expect(takeaway.menu).not_to be nil
  end

  it 'should respond to #mrnu' do
    menu = Menu.new
    expect(menu).to respond_to(:menu)
  end

end