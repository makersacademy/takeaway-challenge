require './docs/takeaway'

describe Takeaway do
  it 'prints the dishes and their prices' do
    takeaway = Takeaway.new

    expect(takeaway.dishes).to eq "Beef curry: £12 Fish curry: £14 Lamb curry: £10"
  end
end
