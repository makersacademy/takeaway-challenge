require "text"
describe Text do
  it "sends a text" do
    client3 = double :client
    allow(client3).to receive(:create)
    client2 = double :client, messages: client3
    client1 = double :client
    allow(client1).to receive(:account) { client2 }
    allow(Twilio::REST::Client).to receive(:new) { client1 }

    expect( subject.send_text("example message") ).to eq "example message"
  end
end