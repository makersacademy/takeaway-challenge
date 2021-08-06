require 'confirmation'

describe Confirmation do
  it 'can provide a expected delivery time' do 
    expect(subject.expected_delivery_time).to_not be_nil
  end

  it 'sends a text to customer when order is placed'
end