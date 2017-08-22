require 'messager'

describe Messager do
  let(:messager) {described_class.new}
  let(:time) { double "time" }
  let(:client) {double "client"}
  it "calculates the time an hour from now" do
    t = Time.new + 3600
    expect(messager.time_in_an_hour).to eq t.strftime("%H:%M")
  end

  it "creates a message" do
    t = Time.new + 3600
    expect(messager.create_message).to eq "Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}"
  end

  # it "sends a message" do
  #   messager.create_message
  #   expect(client).to receive(:new).with('AC297b79f096953ffb25e6c7a7554798b9','c3fce4179277f9e78c5c5897cb1448aa')
  #   expect(client).to receive_message_chain(:api, :account, :messages, :create)
  #   messager.send_message(client)
  # end
end
