require 'text_conf.rb'

describe TextConfirm do
  let(:text_confirm) { TextConfirm.new }

let(:client) { double :clinet }
let(:twilio) { double :twilio }
before(:each) do
  client.stub_chain(:account,:messages,:create)
  # allow(client).to receive(:account)
  # allow(client).to receive(:messages)
  # allow(client).to receive(:create)
  allow(twilio).to receive(:new).and_return(client)
end

  it 'can forward an order to a new twilio instance' do
    # allow(client).to receive(account.messages)
    expect(client.account.messages.create).to receive(:order)
    text_confirm.send_order(twilio, :order)
  end

  xit 'raises an error if the order is empty' do
  end

  xit 'it sends an expected delivery time' do
    # current time + 1 hourß
  end

  # xit 'confirms the order in client???' do
  # end

end

# let(:twilio) {double :twilio}

# let(:client) { double :client, :create }

# @client.account.messages.create
