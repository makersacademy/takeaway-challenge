require './lib/dish'


describe Dish do

  let(:dish) {Dish.new('Garden salad','Side dish',10)}

  it 'should have a name' do
    expect(dish.name).to eq('Garden salad')
  end

  it 'should be have a price' do
    expect(dish.price).to eq(10)
  end
  
  it 'should be assigned to a category' do
    expect(dish.category).to eq('Side dish')
  end

end