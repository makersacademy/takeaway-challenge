require "takeaway"

describe TakeAway do

  let(:menu)  { double :menu, :list => VEGETARIAN_MENU}
  let(:order) { double :order }
  let(:text)  { double :text }
  subject(:takeaway) { described_class.new(menu, order, text) }

  it "preloads a chosen menu when instantiated" do
    expect(subject.menu).to be menu
  end

  it "has the order feature ready" do
    expect(subject.order).to eq order
  end

  it "initialize an empty text" do
    expect(subject.text).to eq text
  end

  describe "#view_menu" do
    it "shows the menu" do
      formatted_menu = "Thai_green_curry                      £9\nAubergine_teriyaki                    £9\nMushroom_risotto                      £8\nButternut_rotolo                      £9\nThali                                £11\nSmoky_bean_burger                     £7\n"
      allow(menu).to receive(:print_menu).and_return formatted_menu
      expect(subject.view_menu).to eq formatted_menu
    end
  end

  describe "#add" do
    it "add selection to basket" do
      allow(order).to receive(:add).and_return "4 x Thai_green_curry added to basket"
      expect(subject.add("Thai_green_curry", 4)).to eq "4 x Thai_green_curry added to basket"
    end
  end

  describe "#review" do
    it "allows customer to review order" do
      allow(order).to receive(:print_order).and_return "selections"
      expect(subject.review).to eq "selections"
    end
  end

  describe "#checkout" do
    it "raises error if sum entered by customer is incorrect" do
      allow(order).to receive(:sum).and_return 18
      expect{subject.checkout(10)}.to raise_error "Incorrect payment received"
    end
  end

  describe "#confirmation" do
    it "confirms the order has been completed" do
      allow(text).to receive(:send_message).with("Thank you! Your order was placed and will be delivered by #{(Time.new + 3600).strftime("%H:%M")}", '+44')
      expect(subject.confirmation('+44')).to eq "Order has been completed"
    end
  end

end
