require 'text'

describe 'text' do
  it 'should send text' do
    text = Text.new
    allow(text).to receive(:send_text).and_return("thanks")
    expect(text.send_text).to eq("thanks")
  end
end
