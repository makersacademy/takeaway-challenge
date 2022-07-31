require 'food_connect'
require 'customer'
require 'twilio-ruby'

describe FoodConnect do 
  let(:to) {+447247147113}
  let(:from) {+44724711343}
  let(:body) {"Order received at #{Time.now}"}

  # end
  it 'has a auth token and account sid' do
    food_connect = FoodConnect.new
    expect(food_connect.auth_token).to be_an_instance_of String
    expect(food_connect.account_sid).to be_an_instance_of String
  end

  it 'sends a text' do 
    client = double()
    message_ready = double()
    allow(client).to receive(:messages).and_return(message_ready)
    allow(message_ready).to receive(:create).and_return([to, body])
    expect(subject.send_text(client)).to eq [to, body]
  end
  
end