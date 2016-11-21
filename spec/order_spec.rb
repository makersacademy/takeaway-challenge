require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }

  before do
    allow(menu).to receive(:new).and_return menu
    allow(order).to receive(:text_message).and_return ("Thank you for your order. A text message confirming the order is on its way.")
    allow(menu).to receive(:list_of_dishes).and_return ({ "margherita" => 9, "pepperoni" => 10, "americano" => 11 })
  end

  context '#initialize' do

    it "current_order_price should return 0 at start" do
      expect(subject.current_order_price).to eq 0
    end

    it { is_expected.to respond_to :menu }

    it { is_expected.to respond_to :message }

    it 'shoudld respond to #items with an empty hash' do
      expect(subject.items).to eq Hash.new
    end

  end

  context 'tests #order is working' do

    it 'should return the pizza and the amount ordered when 1 pizza is ordered' do
      # allow(order).to receive(:menu_check).and_return({ "margherita" => 9, "pepperoni" => 10, "americano" => 11 })
      expect(subject.order("margherita", 1)).to eq "You have ordered 1 margherita(s)."
    end

    it 'should store items and their quantity in #items' do
      subject.order("margherita", 1)
      expect(subject.items.has_value?(1)).to eq true
    end

  end

  context "eliminating edge cases in #order" do

    it "should return an error when less than 1 item is ordered" do
      expect{subject.order("margherita", 0)}.to raise_error "Cannot add item(s): quantity is less than one."
    end

    it "should return an error when item is not entered correctly" do
      # allow(order).to receive(:menu_check).and_return({ "margherita" => 9, "pepperoni" => 10, "americano" => 11 })
      expect{subject.order("marg", 9)}.to raise_error "Cannot store order: no such item exists."
    end

  end

  context "tests #bill is working" do

    before do
    # allow(order).to receive(:menu_check).and_return({ "margherita" => 9, "pepperoni" => 10, "americano" => 11 })
      subject.order("margherita", 1)
    end

      it "should return 9 when 1 margherita is ordered" do
        expect(subject.current_order_price).to eq 9
      end

      it "should return 19 when 1 pizza and 1 pepperoni are ordered" do
        subject.order("pepperoni", 1)
        expect(subject.current_order_price).to eq 19
      end

      it "should work when more than 1 item is ordered" do
        subject.order("pepperoni", 2)
        expect(subject.current_order_price).to eq 29
      end

  end

  context "#expected_total" do



    it "should return confirmation message when text sent" do
      expect(subject.expected_total(0)).to eq "Thank you for your order. A text message confirming the order is on its way."
    end

    it "should show other message if total is incorrect" do
      expect(subject.expected_total(10)).to eq "Your total is wrong: please enter the correct total."
    end

  end

end
