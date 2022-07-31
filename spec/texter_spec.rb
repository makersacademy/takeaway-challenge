require 'texter'

describe Texter do
  let(:texter) { double :texter, :send_text => "Text message sent" }  
  it 'sends a text message' do
    expect(texter.send_text).to eq("Text message sent")
  end
end