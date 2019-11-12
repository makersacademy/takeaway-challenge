require 'meal'

describe Meal do
  it 'creates an instance of Meal' do
    meal = Meal.new
    expect(meal).to be_instance_of(Meal)
  end
end
