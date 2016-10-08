require 'order'

describe Order do
  #subject(:order) {described_class.new}
  let(:order) {double :order}

  before :each do
    allow(order).to receive(:list_of_dishes)
    allow(order).to receive(:ask_if_want_to_order)
    allow(order).to receive(:ask_for_order)
    allow(order).to receive(:ask_for_further_dish)
    allow(order).to receive(:see_menu)
    #allow(order).to receive(:send_sms)
    allow(order).to receive(:ordered_dish_number).with(111)
    allow(order).to receive(:name).with('tart')
    allow(order).to receive(:price).with(7)
    allow(order).to receive(:quantity).with(2)
    allow(order).to receive(:dish_number).with(111)
  end

  describe "#see_menu" do
    it "asks the customer if they want to see the menu" do
    order.see_menu
    expect(STDOUT).to_not receive(:puts).with("Would you like to look at the menu?")
    end
  end

  describe "#ask_if_want_to_order" do
    it "asks the customer wants to order " do
    order.ask_if_want_to_order
    expect(STDOUT).to_not receive(:puts).with("Would you like to order a dish?")
    end
  end

  describe "#ask_for_order" do
    it "ask the customer for the order details" do
      order.ask_for_order
      expect(STDOUT).to_not receive(:puts).with("Please enter the dish number you wish to order")
    end
  end

  describe "#ask_for_further_dish" do
    it "asks the customer if they want to order further dishes" do
      order.ask_for_further_dish
      expect(STDOUT).to_not receive(:puts).with("Would you like to order an other dish?")
    end
  end

  describe "#confirm" do
    it "asks the customer to confim the order" do
    expect(STDOUT).to_not receive(:puts).with("Would you like to confirm this order?")
    end
  end

end
