require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  # it 'can show an empty basked' do
  #   expect(order.basket).to eq({})
  # end

  it 'is able to show the menu to the customer in the order' do
    expect(menu.show).to eq({ "Tom Yum" => 9.90, "Pad Thai" => 10.00, "Green Curry" => 6.99, "Red Curry" => 6.00, "Aloe Drink" => 2.00, "Chocolate Ice Cream" => 4.00, "California Roll" => 12.00 })
  end

end
