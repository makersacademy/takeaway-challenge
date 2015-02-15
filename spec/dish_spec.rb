require 'dish'

  describe Dish do
    
  it 'has a menu' do
    dish = Dish.new
    expect(dish.menu).to eq ({pizza: 4, burger:2})
  end

end