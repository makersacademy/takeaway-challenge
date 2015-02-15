require 'takeaway'

describe Takeaway do
  it 'should have a standard list of dishes' do
    takeaway = Takeaway.new
    expect(takeaway.dish_list.keys).to eq [:sandwich, :pasta, :salad, :coke]
  end
end