require 'menu'

describe user-stories do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'shows main dishes' do
    menu = Menu.new
    expect (menu.mains).not_to raise_error
  end
  
end
