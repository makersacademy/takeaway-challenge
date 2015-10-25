require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(restaurant) }
  let(:restaurant) { double() }

    it "until a new_order, menu is nil" do
      expect(subject.menu).to eq nil
    end

    it { is_expected.to respond_to(:available) }

  let(:cuisine) { double(menu: {item: 5}) }


    it "when new_order is started, menu is populated with a specific cuisine" do
      takeaway.new_order(cuisine)
      expect(takeaway.menu).to eq cuisine.menu
    end

  before do
    allow(restaurant).to receive(:new).and_return(cuisine)
    takeaway.new_order(cuisine)
    takeaway.add(:item, 5)
  end

  context "add item(s)" do

    it "with default quantity of 1" do
      expect { takeaway.add(:item) }.to change { takeaway.order[:item] }.by(1)
    end

    it "with explicit quantity" do
      expect { takeaway.add(:item, 2) }.to change { takeaway.order[:item] }.by(2)
    end

    it "but item does not exist" do
      expect(takeaway.add(:no_item)).to eq "Sorry, your selection is unavailable"
    end

  end

  context "delete item(s)" do

    it "with default quantity of 1" do
      expect { takeaway.delete(:item) }.to change { takeaway.order[:item] }.by(-1)
    end

    it "with explicit quantity" do
      expect { takeaway.delete(:item, 2) }.to change { takeaway.order[:item] }.by(-2)
    end

    it "but item does not exist" do
      expect(takeaway.delete(:no_item)).to eq "Sorry, your order does not contain that item"
    end

  end

  describe '#order_summary'do
    it "returns the order item(s), quantity, and cost" do
      expect(takeaway.order_summary).to eq "Your order: item x5 = £25.00"
    end
  end

  describe '#total'do
    it "returns interpolated total string message" do
      expect(takeaway.total).to eq "Your total: £25.00"
    end
  end


  describe '#cancel_order' do
      let(:ta) { Takeaway.new(restaurant) }
      let(:test1) { double(menu: {item: 5}) }

    before do
      allow(restaurant).to receive(:new).with(cuisine).and_return(test1)
      ta.new_order(cuisine)
      ta.add(:item, 5)
    end

    it "has item in order hash" do
      expect(ta.order).to_not be_empty
    end

    it "and then cancel_order empties order hash" do
      ta.cancel_order
      expect(ta.order).to be_empty
    end

    it "returns cancellation message" do
      expect(ta.cancel_order).to eq("Order cancelled.")
    end
  end

  describe '#place_order' do
    let(:ta) { Takeaway.new(restaurant) }
    let(:test1) { double(menu: {item: 5}) }

    before do
      allow(ta).to receive(:send_sms)
      ta.new_order(cuisine)
      ta.add(:item, 5)
    end

    it "if confirmed, give conf message" do
      allow(ta).to receive(:confirmed?).and_return(true)
      expect(ta.place_order).to eq "Your order has been confirmed! A confirmation text will be sent to your mobile. See you next time!"
    end

    it "& reset order hash" do
      allow(ta).to receive(:confirmed?).and_return(true)
      ta.place_order
      expect(ta.order).to be_empty
    end

    it "otherwise, give message string" do
      allow(ta).to receive(:confirmed?).and_return(false)
      expect(ta.place_order).to eq "Please try again"
    end

  end


end
