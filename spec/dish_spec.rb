require './lib/dish.rb'

describe Dish do

  before :each do
    @menu_num = 1
    @dish_nam = 'Chicken Tika'
    @dish_price = 5
    @dish = Dish.new(@menu_num, @dish_nam, @dish_price)
  end
  it 'should accept 3 arguments for creation' do
    expect(Dish).to respond_to(:new).with(3).arguments
  end

  it 'should store menu number when created' do
    expect(@dish.menu_number).to eq @menu_num
  end

  it 'should store dish name when created' do
    expect(@dish.dish_name).to eq @dish_nam
  end

  it 'should store dish cost when created' do
    expect(@dish.dish_cost).to eq @dish_price
  end
end
