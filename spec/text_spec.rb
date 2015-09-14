require 'text.rb'

describe Text do
  let(:text) {described_class.new}
  let(:fake_client) {double :fake_client}
  let(:order_time) {(Time.new + 3600)}

before(:example) do
  fake_client.stub_chain("account.messages.create") { "Hi, your food will be with you before #{order_time}!" }
  allow(Twilio::REST::Client).to receive(:new).and_return(fake_client)
end

  it 'can confirm an order via text' do
    expect(text.send_text).to eq("Hi, your food will be with you before #{order_time}!")
  end

end
