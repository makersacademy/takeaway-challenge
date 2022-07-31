require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  it 'It is a object takeaway' do
    expect(takeaway).to be_an(Object)
  end
  it 'Should respond to #notificatione' do
    expect(takeaway).to respond_to(:notification).with(1).argument
  end
  
end
