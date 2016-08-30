require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }
  # The subject is the test subject.  Here we define subject as a newly
  # instantiated instance of the class under test, in this case the Takeaway
  # class.  Our test subject here takes ONE parameter, a menu double.  This is
  # because we want the application code to 'inject' a menu object (which will
  # take care of the menu) into the takeaway object.

  let(:menu) { double(:menu, print: printed_menu) }
  # Let is a way to define all DEPENDENT objects for test examples.  Essentially
  # if you need to reference the same "thing" in more than one example, and it
  # cannot be made a subject, then we use let.  Here we create a double called
  # 'menu' and we specify that the print method for 'menu' should return
  # "printed_menu", which is defined below as the specific string output we
  # would like to see the print method return.
  let(:printed_menu) { "Pizza: 9.99" }
  let(:order) { instance_double("Order", total: 12.98) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:dishes) { {pizza: 9.99, burger: 2.99} }

  before do
    allow(order).to receive(:add)
  end

  describe "#print_menu" do
    it "displays menu with the dishes and prices" do
      expect(takeaway.print_menu).to eq(printed_menu)
    end
  # Tests that the "print_menu" instance method of the Menu class prints the
  # dishes stored in the dishes variable (i.e. the menu itmes for a particular
  # takeaway restaurant).
  end

  describe "#place_order" do
    it "can order some number of serveral available dishes" do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
  # Tests that when we order 2 dishes that the order object's add method is
  # called twice.  The set-up for this test is as follows:
  #
  # 1) We create a dishes object on line 21 above and set its value to a hash
  #   with the key value pairs set out therein.
  # 2) We then use expect(order).to receive(:add).twice to check that when
  #   we call "place_order" method with dishes as the argument (i.e. the items
  #   in the hash that represent the ordered dishes) on a takeaway object that
  #   the order object receives 2 calls to its "add" method
  #
    end
  end

  describe "#total" do
    it "knows the order total" do
      total = takeaway.place_order(dishes)
      expect(total).to eq(12.98)
    end
  end

  it "sends an SMS when the order has been placed" do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end
