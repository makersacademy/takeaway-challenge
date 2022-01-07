require 'resturant'

describe Resturant do 

  it 'should have a list of dishes' do
  resturant = Resturant.new 
  list = resturant.dish
  expect(resturant.dish).to eq list
  end 
end 