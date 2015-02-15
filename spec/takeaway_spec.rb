require 'takeaway'

describe Takeaway do
  it 'should have a default list of dishes' do
    takeaway = Takeaway.new
    expect(takeaway.dish_list.keys).to eq [:sandwich, :pasta, :salad, :coke]
  end

  it 'should have prices for each dish' do
    takeaway = Takeaway.new
    expect(takeaway.dish_list[:sandwich]).to eq 5
    ##
    ##
    expect(takeaway.dish_list[:coke]).to eq 1
  end
end