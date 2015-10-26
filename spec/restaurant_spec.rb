require 'restaurant'

describe Restaurant do

  context "#take_away service" do
    let(:sendtext) { double(:sendtext) }
    let(:subject)  { Restaurant.new(sendtext) }
    let(:total)    { 10.35 }

    it "sends text message with confirmation" do
      allow(sendtext).to receive(:send_message).and_return("Order confirmed")
      expect(subject.complete_order(total)).to eq("Order confirmed")
    end
  end

end
