require './docs/takeaway.rb'

describe Takeaway do
  it 'prints the dishes and their prices' do
    takeaway = Takeaway.new

    expect(takeaway.dishes).to eq "beef_curry: £12"
  end
end