require 'text_sender'

describe TextSender do

  # class verified manually in IRB
  it 'has send method' do
    expect(TextSender.new).to respond_to(:send)
  end
end
