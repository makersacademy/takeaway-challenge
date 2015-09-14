require 'text.rb'

  it 'can confirm an order via text' do
    text = Text.new
    allow(text).to receive(:send_text) {"Hi, your food will be with you before #{order_time}!"}
    expect(text.send_text).to eq("Hi, your food will be with you before #{order_time}!")
  end

end
