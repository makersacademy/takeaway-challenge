require './docs/takeaway.rb'

describe Takeaway do
  it 'prints the dishes and their prices' do
    takeaway = Takeaway.new

    expect(takeaway.dishes).to eq "Curry - £15"
  end
end