require 'dishes'
require 'takeaway'

describe Dishes do
  it 'see a list of dishes with prices' do
    dishes = subject.dishes
    expect(Takeaway.menu).to eq(dishes)
  end
end