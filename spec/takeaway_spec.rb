require 'take_away'

describe Takeaway do
  let(:dishes) { Takeaway.new('pasta', 6) }
  
  it 'to make a food item' do
    expect(dishes.name).to eq 'pasta'
  end
  
  it ' to set a price for an food item' do
    expect(dishes.price).to eq 6
  end
end
 
