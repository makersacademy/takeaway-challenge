require 'order'
require 'menu'

describe Order do

  subject(:order) { described_class.new(menu) }
  # Defines test subject as newly instantiated instance of Order class that
  # takes one parameter, a menu object.

  let(:menu) { instance_double("Menu") }
  # Creates a double of a menu object for use in testing.

  let(:dishes) do
    {
      pizza: 9.99,
      burger: 2.99,
      chips: 1.99
    }
  end
  # Lets helper defines all DEPENDENT objects for the below test examples.  Here
  # Lets mocks up a hash of items and their prices that represent the available
  # dishes at our takeaway restaurant.

  before do
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
    allow(menu).to receive(:has_dish?).with(:chips).and_return(true)
  end
  # Before block executes pre-determined code before and after each example
  # that follows after it.
  #
  # Inside the above Before block are METHOD STUBS.  A method stub simulates the
  # implementation of a method and specifies the return value you wish to be
  # returned when calling that method.
  #
  # So in the above we are saying, "allow the menu object to receive the method
  # has_dish?" with the argument "pizza" and return "true".  This is because we
  # want the "has_dish?" method to return true for any items requested by a
  # customer that are actually included in the menu for our takeaway restaurant.

  it "selects several dishes from the menu" do
    order.add(:pizza, 9.99)
    order.add(:burger, 2.99)
    order.add(:chips, 1.99)
  # The above simulates calling the "add" method three times on an instance of
  # the order class with the given arguments.
    expect(order.dishes).to eq(dishes)
  # This tests the expectation that after the above calls to "add" that the
  # dishes variable (a hash used to store orders) will contain each ordered
  # dish with its corresponding price
  end

  it "doesn't allow items to be added that are not on menu" do
    allow(menu).to receive(:has_dish?).with(:chowmein).and_return(false)
  # Method stub.  In the above we are saying, "allow the menu object to receive
  # the method "has_dish?" with the argument "chowmein, 2" and return false
  # because we want our method "has_dish?" to return false in this scenario as
  # chowmein is NOT on the menu.
    expect { order.add(:chowmein, 1.99) }.to raise_error NoItemERROR, "Chowmein is not on the menu!"
  end

end
