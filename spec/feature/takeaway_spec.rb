require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe 'User Stories' do
  it 'displays a list of dishes with prices' do
    menu = Menu.new
    menu.add("Chicken", 15.50)
    takeaway = Takeaway.new(menu)
    expect(takeaway.list_menu).to eq ({"Chicken" => 15.50})
  end
end