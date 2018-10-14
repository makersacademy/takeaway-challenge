require 'messenger'

describe Messenger do
  let(:client) { double :client }
  subject { described_class.new(client) }
  it "should send a text message" do
    client.stub_chain(:messages, :create).and_return("Thank you!")
    expect(subject.send_text("Thank you!")).to eq "Thank you!"
  end
end
