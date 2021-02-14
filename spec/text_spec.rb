require 'text'

describe Text do
  it'creates message and returns true' do
    expect(Text.new.send_message).to eq true
  end
end
