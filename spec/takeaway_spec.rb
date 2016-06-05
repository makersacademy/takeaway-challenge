require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order) }
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
  let(:order) { double(:order) }
  let(:dishes) { {pizza: 9.99, burger: 2.99} }

  it "displays menu with the dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "can order some number of serveral available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end
