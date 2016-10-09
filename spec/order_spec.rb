require 'order'

describe Order do
  let(:order) { double :order }

  before :each do
    allow(order).to receive(:see_menu)
    allow(order).to receive(:confirm)
    allow(order).to receive (:retrieve_dish_from_menu)
    allow(order).to receive(:list_of_dishes)
    allow(order).to receive(:ask_if_sms_order).and_return(:ask_for_order)
    allow(order).to receive(:ask_if_want_to_order).and_return(:ask_if_sms_order)
    allow(order).to receive(:see_menu).and_return(:ask_if_want_to_order)
    allow(order).to receive(:ask_for_order)
    allow(order).to receive(:ask_for_further_dish)
    allow(order).to receive(:send_sms)
    allow(order).to receive(:sms_order)
  end

  describe "#see_menu" do
        it "asks the customer if they want to see the menu" do
          @input = StringIO.new("yes")
          @output = StringIO.new("Would you like to look at the menu?")
          order.see_menu
            expect(@output.string).to  eq("Would you like to look at the menu?")
        end
  end

  describe "#ask_if_want_to_order" do
        it "asks the customer wants to order " do
          @input = StringIO.new("yes")
          @output = StringIO.new("Would you like to order a dish?")
          order.ask_if_want_to_order
            expect(@output.string).to  eq("Would you like to order a dish?")
        end
  end

  describe "#ask_if_sms_order" do
        it "asks the customer if they want to order via sms" do
          @input = StringIO.new("yes")
          @output = StringIO.new("Would you like to order via sms?")
          order.ask_if_sms_order
            expect(@output.string).to eq("Would you like to order via sms?")
        end
  end

  describe "#sms_order" do
        it "gives instructions for ordering via sms" do
          @output = StringIO.new("Instructions for sms order")
          order.sms_order
            expect(@output.string).to eq("Instructions for sms order")
        end
  end

  describe "#ask_for_order" do
    before do
          @input = StringIO.new("111")
          @output = StringIO.new("Please enter the dish number you wish to order")
          order.ask_for_order
    end
        it "ask the customer for the order details" do
            expect(@output.string).to  eq("Please enter the dish number you wish to order")
        end
        it "get the dish number from the customer" do
            expect(@input.string).to eq("111")
        end
  end

  describe "#ask_for_further_dish" do
        it "asks the customer if they want to order further dishes" do
          @input = StringIO.new("yes")
          @output = StringIO.new("Would you like to order an other dish?")
          order.ask_for_further_dish
            expect(@output.string).to  eq("Would you like to order an other dish?")
        end
  end

  describe "#confirm" do
        it "asks the customer to confim the order" do
          @input = StringIO.new("yes")
          @output = StringIO.new("Would you like to confirm this order?")
          order.confirm
            expect(@output.string).to  eq("Would you like to confirm this order?")
        end
      end

  end
