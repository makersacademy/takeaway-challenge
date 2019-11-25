require 'take_away'

describe TakeAway do

  subject(:take_away) { described_class.new(menu, messenger_class) }
  let(:menu) { { "Tacos" => 4.95, "Scrambled Eggs" => 3.50 } }
  let(:messenger_class) { double :messenger_class, new: messenger }
  let(:messenger) { double :messenger }

  before do
    allow(menu).to receive(:display) { menu }
  end

  describe "#read_menu" do
    it "returns a menu with list of dishes and prices" do
      expect(subject.read_menu).to eq menu
    end
  end

  describe "#order(dish, quantity)" do
    context "when quantity is not specified" do
      it "returns a message confirming what you added to the basket" do
        message = "1x tacos(s) added to your basket"
        expect(subject.order("Tacos")).to eq message
      end
    end

    context "when quanity is specified" do
      it "returns a message confirming what you added to the basket" do
        message = "2x scrambled eggs(s) added to your basket"
        expect(subject.order("Scrambled Eggs", 2)).to eq message
      end
    end
  end

  describe "#basket_summary" do
    it "returns the contents of your basket when one item is ordered" do
      subject.order("Scrambled Eggs")
      message = "Scrambled Eggs x1 = £3.5"
      expect(subject.basket_summary).to eq message
    end

    it "returns the contents of your basket when multiple items are ordered" do
      subject.order("Scrambled Eggs", 3)
      subject.order("Tacos")
      message = "Scrambled Eggs x3 = £10.5, Tacos x1 = £4.95"
      expect(subject.basket_summary).to eq message
    end
  end

  describe "#total" do
    it "returns the total price of the order" do
      subject.order("Tacos", 3)
      subject.order("Scrambled Eggs")
      message = "Your total order is £18.35"
      expect(subject.total).to eq message
    end
  end

  describe "#checkout(amount)" do
    it "asks the user for their telephone number" do
      allow(subject).to receive(:gets) { "000 3333 4444" }
      expect(subject.checkout).to eq "000 3333 4444"
    end
  end

  describe "#complete_order(amount)" do

    it "raises an error if the amount given does not match the total price" do
      subject.order("Tacos", 3)
      message = "Incorrect checkout price given. Please recheck your order total"
      expect { subject.complete_order(6) }.to raise_error message
    end

    it 'sends an order confirmation text message' do
      time = Time.now.strftime('%H:%M')
      text = "Thank you for your order! It will be delivered within one hour from #{time}"
      expect(messenger).to receive(:send_text) { text }
      subject.complete_order(0)
    end
  end

end
