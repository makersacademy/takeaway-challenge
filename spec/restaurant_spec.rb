require 'restaurant'

describe Restaurant do

  let(:order) { double :order }
  let(:message) { double :message }
  let(:account) { double :account, messages: message }
  let(:client)  { double :client, account: account }
  
  subject { Restaurant.new(client)}

  it 'sends a message via the client' do
    expect(message).to receive(:create).with(
      { from: "+441773252056",
        to: "+447729835662",
        body: "This is your confirmation message!"
        })

    subject.send_confirmation_message("This is your confirmation message!")
  end

end

