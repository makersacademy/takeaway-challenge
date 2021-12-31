require 'takeaway'

describe Takeaway do
  
  let(:takeaway) { Takeaway.new }
  
  it 'has a menu' do
    expect(takeaway).to respond_to(:menu)
  end
end