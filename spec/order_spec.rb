require "order"

describe Order do
  let(:order) { described_class.new }
  let(:menu) { double :menu }

  it { expect(subject).to respond_to :show_menu }

  it { expect(subject).to respond_to :add_order }

  it { expect(subject).to respond_to :order_list }

  it { expect(subject).to respond_to :order_total }

  it { expect(subject).to respond_to :show_basket }

  it { expect(subject).to respond_to :complete_order }

  it "should print the menu" do
    expect(subject.show_menu).to eq Menu::DISHES
  end

  it "should allow the customer to select multiples of each item" do
    expect(subject.add_order("Pizza", 4)).to eq "You have ordered Pizza - x 4"
  end

  it "should have a default quantity of 1" do
    expect(subject.add_order("Pizza")).to eq "You have ordered Pizza - x 1"
  end

  it "should add the order to the order list" do
    subject.add_order("Lobster")
    expect(subject.order_list.length).to eq 1
  end

  context "multiple dishes ordered" do
    before(:each) do
      subject.add_order("Pizza", 4)
      subject.add_order("Lobster", 2)
    end

    it "should record multiple dishes" do
      expect(subject.order_list.length).to eq 2
    end

    it "should let you edit your selection" do
      subject.edit_selection("Pizza", 3)
      expect(subject.item_quantity("Pizza")). to eq 3
    end

    it "should let you remove a selection" do
      subject.remove_selection("Pizza")
      expect(subject.order_list.length).to eq 1
    end

    it "should show multiple items in the basket" do
      expect(subject.show_basket).to eq "Total: £40.0"
    end

  end

  context "Total" do
    before(:each) do
      subject.add_order("Pizza", 4)
      subject.add_order("Lobster", 2)
    end

    it "should match the sum of the selections ordered" do
      expect(subject.order_total).to eq 40.0
    end

    it "should change when selections are removed" do
      # subject.remove_selection("Lobster")
      expect { subject.remove_selection("Lobster") }.to change { subject.order_total }.by(-24.0)
      # expect(subject.order_total).to eq 16.0
    end

    it "should return true if order total is the same as price entered" do
      expect(subject.order_correct?(40)).to be true
    end

    it "should return false if order total is not the same as price entered" do
      expect(subject.order_correct?(30)).to be false
    end

  end

  context "Raises" do

    it "should not allow a quantity of 0" do
      expect { subject.add_order("Lobster", 0) }.to raise_error("Can not select a quantity of 0")
    end

    it "should only allow you to order items on the menu" do
      message = "That item is not on the menu"
      expect { subject.add_order("Bacon") }.to raise_error(message)
    end

  end

  context "complete_order" do
    before(:each) do
      allow(subject).to receive(:order_correct?).and_return(false)
    end

    it "should not allow order completion if the price entered is false" do
      price = double :price
      message = "The price does not match. Please review your order"
      expect(subject.complete_order(price)).to eq message
    end

  end

  # Not sure about these tests

  context "complete_order" do
    before(:each) do
      allow(order).to receive(:order_correct?).and_return(true)
    end

    it "it should allow order completion if the price entered is true" do
      expect(order).to receive(:complete_order).with(15.0)
      order.complete_order(15.0)
    end

    it "should allow order completion if the price entered is true" do
      price = 15
      msg = Message.new(price)
      expect(msg).to receive(:send_sms)
      msg.send_sms
    end
  end

end
