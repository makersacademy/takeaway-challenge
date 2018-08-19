require 'text_message'

describe TextMessage do

  it 'sends confirmation text message' do
    expect(subject.send_confirmation.body).to include 'Thank you! Your order was placed and will be delivered'
  end

end
