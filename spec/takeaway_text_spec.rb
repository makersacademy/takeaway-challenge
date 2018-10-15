require 'takeaway_text'

describe TextMessage do

  it 'returns a text message to a customer' do
    expect(subject.receive_text.body).to include "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
