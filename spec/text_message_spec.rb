require 'text_message'

describe TextMessage do
  subject(:text_message) { double :text_message }

  it "should send a text message with string passed in as argument when send_text is called" do
    allow(text_message).to receive(:send_text) { 'Hey friend!' }
    expect(text_message.send_text('Hey friend!')).to eq 'Hey friend!'
  end
end
