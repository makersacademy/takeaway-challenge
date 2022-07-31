require 'dish'

describe Dish do
  subject(:dish) { Dish.new('Lasagna', 8) }

  it "has a name of dish" do
    expect(dish.name).to eq('Lasagna')
  end

  it 'has a price of dish' do
    expect(dish.price).to eq 8 
  end
end