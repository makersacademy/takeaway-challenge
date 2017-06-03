require './lib/text_provider.rb'

describe TextProvider do

subject(:text) { described_class.new }

xdescribe '#send_text' do
  it 'delivers a text notification using Twilio' do
    fake_cost = double(:cost)
    allow(fake_cost).to receive(:send_text).and_return("Thank you! Your order was placed and will be delivered before 18:52. The total cost of your order is £12")
    expect(text.send_text(fake_cost)).to eq "Thank you! Your order was placed and will be delivered before 18:52. The total cost of your order is £12"
  end
end


# EXAMPLE 1
xdescribe '#send_text' do
  it 'tests text sending' do
    client  = double(:twilio_rest_client)
    messager = Messager.new(client)
    expect(client).to receive_message_chain(:account, :message, :create)
    messager.send_sms("woop")
  end
end

# EXAMPLE 2
xdescribe '#send_text' do
  it 'tests text sending' do
    messages = double(:twilio_thing)
    account = double(:twilio_thing_account, messages: messages)
    client  = double(:twilio_rest_client, account: account)
    messager = Messager.new(client)

    expect(messages).to receive(:create).with(body: "Woop", to: "8937278463287462", from: "873460823640832" )
    messager.send_sms("Woop")
  end
end

end
