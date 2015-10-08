describe Text do

  it 'has "send_text_message" method with 1 argument' do
    expect(Text).to respond_to(:send_text_message).with(2).argument
  end
end
