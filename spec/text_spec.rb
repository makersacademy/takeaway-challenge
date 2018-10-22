require "text"

describe Text do

  let(:client) {double :client, :new => client_object}
  let(:client_object) {double :client_object, :messages => "Hello"}
  let(:messages) {double :messages, :create => true}

  it "Prints a string sent to it" do
    Text.new(client).send_text()
  end
end
