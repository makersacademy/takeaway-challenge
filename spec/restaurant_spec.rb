require 'restaurant'

describe Restaurant do

subject(:restaurant) { described_class.new }

x = "Welcome to Vietnoms!\n1 Beef Dipped in Vinegar - £5\n2 Classic Silky Vietnamese Sausage - £6\n3 Fermented Pork Sausage - £4\n4 Fried Spring (Imperial) Rolls - £5\n5 Grilled Sugarcane Shrimp - £7\n6 Shredded Pork Salad Rolls - £8\n7 Toasted Dried Squid - £9\n8 Salad Rolls Rice Paper - £3\n"
y = "Your order is:\n1 Beef Dipped in Vinegar - £5\n2 Classic Silky Vietnamese Sausage - £6\nYour order total comes to £11\n"

context "initialising the class"

  it "is initialised with a new empty order that is a hash" do
    expect(described_class.new.takeaway_order).to eq []
  end

  it "is initialised with a menu with items" do
    expect(restaurant.menu_items.length).to be > 1
  end

  it "is initialised with a menu with items with prices" do
    expect(restaurant.menu_items.sample[:price]).not_to be nil
  end

context "Print the menu"

  it "can print the menu" do
    expect{restaurant.print_menu}.to output(x).to_stdout
  end

context "Printing, calculating, completing and verifying order"

  before do
    restaurant.add_item_number_to_order(1)
    restaurant.add_item_number_to_order(2)
  end

  it "adds items to the order - expects takeaway_order length to be 2" do
    expect(restaurant.takeaway_order.length).to eq 2
  end

  it "fails if the verifying number of dishes is incorrect" do
    expect{restaurant.complete_order(3)}.to raise_error("We do not appear to have the correct number of dishes.")
  end

  it "succeeds if the verifying number of dishes is correct" do
    expect(restaurant.complete_order(2)).to eq("You order has been completed and should be with you shortly")
  end

  it "can print my order" do
   expect{restaurant.print_order}.to output(y).to_stdout
  end

end
