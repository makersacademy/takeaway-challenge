require 'text'

describe 'text' do

  it 'should send text' do
    described_class = Text.new
  expect(described_class.send_text).to eq("Text sent")
  end

end
