require 'takeaway.rb'

describe Takeaway do

  it 'responds to create_bill method with an argument' do
    is_expected.to respond_to(:create_bill).with(1).argument
  end

  it 'should add up the total bill correctly' do
    t = Takeaway.new
    expect(t.create_bill [1, 2, 3]).to eq(6)
  end

end