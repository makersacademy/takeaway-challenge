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

  it 'should be able to check if an order is incorrect' do
    takeaway = Takeaway.new
    expect{takeaway.check_order([:sandwich, :salad], 12)}.to raise_error "sum is incorrect"
  end

  it 'should be able to check if an order is correct' do
    takeaway = Takeaway.new
    expect(takeaway.check_order([:sandwich, :salad], 11)). to eq true
  end

end