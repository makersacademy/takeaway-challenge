require 'restaurant'

describe Restaurant do


  context "#take_away service" do
    let(:sendtext) { double(:sendtext) }
    let(:total)    { 5 }
    let (:subject) { Restaurant.new(sendtext) }


    before(:each) do
      allow(sendtext).to receive(:send_message).and_return("Order confirmed")
    end

    it "shows menu when requested" do
      txt = ["Chips - £0.89", "Chicken Tikka - £3.99", "Burger - £2.99"]
      expect(subject.read_menu).to eq txt
    end

    it "sends text message with confirmation" do
      expect(subject.complete_order(total, 10.30)).to eq("Order confirmed")
    end
  end

end
