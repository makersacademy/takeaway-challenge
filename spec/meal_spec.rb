require 'meal'

describe Meal do
  it 'creates a meal with a name and price' do
    beans = Meal.new('beans', 3)
    expect(beans.name).to eq 'beans'
    expect(beans.price).to eq 3
  end
end