require 'takeaway'

describe 'takeaway' do
  let(:takeaway) { Takeaway.new }

  it 'Returns a friendly message when ordering a pizza' do
    expect(takeaway.order("Pizza *1", 1.50)).to include('Thank you! Your order was placed and will be delivered before', 'You will also receive a text message with these details')
  end

end