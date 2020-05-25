require_relative '../lib/twilio.rb'

describe '#text_message' do
  it 'should return true if a text was sent' do
    expect(text_message("test")).to eq(true)
  end
end
