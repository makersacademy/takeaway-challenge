require 'takeaway'

describe Takeaway do

  subject(:takeaway) { Takeaway.new }

  it 'displays the list of food dishes with prices' do
    expect(takeaway.see_dishes).to eq('Sweet and Sour Chicken: £4.00')
  end

end