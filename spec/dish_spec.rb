require 'dish'

describe 'Dish' do 

  dish = Dish.new

  it 'should have name and price as instance variables' do
    expect(dish).to respond_to(:price, :name)
  end  
  
end  