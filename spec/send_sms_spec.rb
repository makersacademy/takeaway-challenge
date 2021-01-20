require 'send_sms'

describe TextMessage do
  it 'should initialise a new TextMessage' do
    expect(TextMessage.new).to be_a TextMessage
  end

  it 'should calculate delivery time' do 
    expect(subject.delivery_time.min).to eq ((Time.now.min + 30) % 60)
  end

end
