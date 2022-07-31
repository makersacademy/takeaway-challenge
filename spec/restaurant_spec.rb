require 'restaurant'
require 'customer'

describe Restaurant do 

  it 'creates a menu' do 
    restaurant = Restaurant.new
    expect(restaurant.menu.count).to eq 10
    expect(restaurant.menu[0]).to include "Breadsticks"
  end

end