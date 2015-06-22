require 'text_sender'

describe Textsender do
  it 'sends a text when the food will be ready' do
    expect(TextSender.new).to eq true
  end
end
