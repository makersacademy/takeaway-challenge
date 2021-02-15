require "takeaway.rb"

describe Ordering do
  menu_string = "Regular Burger, £5.00\nstandard hamburger\n\n"\
    "Special Burger, £5.95\nmarinated in orphen's tears\n\n"\
    "Cheese Burger, £5.50\nregular burger with cheese\n\n"\
    "Fries, £2.00\nskinny fries\n\n"\
    "Side Salad, £2.50\nlittle gem lettuce and baby spinich, with a ceaser dressing\n\n"\
    "Soft Drink, £2.00\ncoke, fanta, tango\n\n"\
    "Beer, £4.00\nHobgoblin Ruby or Dead Pony IPA\n\n"
  let(:kitchen){ double :Kitchen}
  subject { described_class.new(Menu.new, ShoppingCart.new, kitchen)}

  it "prints the menu" do
    expect(subject.menu).to eq menu_string
  end

  context "#add_to_order" do

    it "adds item to cart" do
      order_string = "1x Cheese Burger, £5.50\nTotal: £5.50"
      subject.add_to_order("Cheese Burger")
      expect(subject.view_cart).to eq order_string
    end

    it "adds 2 identical items to cart" do
      order_string = "2x Cheese Burger, £11.00\nTotal: £11.00"
      2.times{subject.add_to_order("Cheese Burger")}
      expect(subject.view_cart).to eq order_string
    end

    it "adds different items to cart" do
      order_string = "1x Cheese Burger, £5.50\n2x Soft Drink, £4.00\nTotal: £9.50"
      subject.add_to_order("Cheese Burger")
      2.times{subject.add_to_order("Soft Drink")}
      expect(subject.view_cart).to eq order_string
    end

    it "adding unavailable item to cart throws error" do
      expect { subject.add_to_order("Special Burger") }.to raise_error("Special Burger not available")
    end
  end

  context "#view_cart" do
    it "Ordering starts with empty cart" do
      order_string = "Total: £0.00"
      expect(subject.view_cart).to eq order_string
    end

  end

  context "#checkout" do
    order_hash = {"Fries" => 1, "Beer" => 2}
    before(:each) do
      allow(kitchen).to receive(:order).with(order_hash).and_return(true)
    end

    it "sends order to the kitchen" do
      subject.add_to_order("Fries")
      2.times{subject.add_to_order("Beer")}
      expect(kitchen).to receive(:order).with(order_hash)
      subject.checkout
    end
  end
end