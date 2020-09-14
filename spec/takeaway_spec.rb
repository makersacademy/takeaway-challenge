require 'takeaway'

RSpec.describe Takeaway do 

  let(:takeaway) { Takeaway.new }

  it 'intialises with menu hash' do 
    expect(takeaway.menu).to be_instance_of Hash
  end 

  it 'displays menu' do 
    expected = { chicken: 4.99, chips: 1.50 } 
    expect(takeaway.view).to eq(expected)
  end 

end
