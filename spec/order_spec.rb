require 'order'

describe Order do
  let(:order) { double :order }

  before :each do
    allow(order).to receive(:see_menu)
    allow(order).to receive(:add_dish_to_order)
    allow(order).to receive(:set_to_nil)
    allow(order).to receive(:confirm)
    allow(order).to receive (:retrieve_dish_from_menu)
    allow(order).to receive(:list_of_dishes)
    allow(order).to receive(:quantity)
    allow(order).to receive(:menu)
    allow(order).to receive(:order_amount)
    allow(order).to receive(:ordered_dish_number)
    allow(order).to receive(:ask_if_sms_order).and_return(:ask_for_order)
    allow(order).to receive(:ask_if_want_to_order).and_return(:ask_if_sms_order)
    allow(order).to receive(:see_menu).and_return(:ask_if_want_to_order)
    allow(order).to receive(:ask_for_order)
    allow(order).to receive(:ask_for_further_dish)
    allow(order).to receive(:send_sms)
    allow(order).to receive(:sms_order)
  end

  describe "#initialize" do
        it "starts with an empty list of dishes" do
          expect(order.list_of_dishes).to be nil
        end
        it "starts with an order amount equal to 0" do
          expect(order.order_amount).to eq nil
        end
        it "creates a new instance of Menu" do
          menu = Menu.new
          expect(menu).to be_a_kind_of Menu
        end
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

  describe "#set_to_nil" do
        it "set ordered_dish_number and quantity to nil" do
          order.set_to_nil
          expect(order.ordered_dish_number).to be nil
          expect(order.quantity).to be nil
        end
  end

end
