require 'takeaway'

describe Menu do
  it 'shows list of dishes' do
  end
end

describe Meal do

  it 'can make a meal' do
  meal1 = Meal.new("kfc", 2)
  expect(meal1).to respond_to(:list_price)
  end

  it 'can show name of meal' do
  meal1 = Meal.new("kfc", 2)
  expect(meal1.list_name).to eq("kfc")
  end

  it 'can show price of meal' do
  meal1 = Meal.new("kfc", 2)
  expect(meal1.list_price).to eq(2)
  end

end

describe "make order" do
  it 'meals can be added to the order list' do
    m = Menu.new
    meal1 = Meal.new("kfc", 2)
    m.list_of_dishes << meal1
    expect(m.list_of_dishes.count).to eq(1)
  end
end
