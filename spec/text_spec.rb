require 'text'

describe Text do
  it "sends text a text message to customer" do
    allow(Text).to receive(:send_text_message).and_return(true)
  end
end
