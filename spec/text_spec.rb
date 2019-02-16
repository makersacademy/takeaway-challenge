describe Text do

  let(:time) { double :time }

  it "generates a text message with the time" do
    expect(Text.new.generate).to eq("Your order has been placed. Your dins will be with you at #{time}")
  end
end
