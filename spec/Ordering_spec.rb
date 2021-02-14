require "Ordering.rb"

describe Ordering do
  let(:menu){ double :menu}
  menu_string = "Regular Burger, £5.95\nCheese Burger, £5.95\nBeer, £4.00"
  allow(menu).to_recieve(:print).and_return(menu_string)
  
  let(:cart){ double :cart }
  allow(cart).to recieve(:show_cart).and_return([])
  allow(cart).to recieve(:new)

  subject { described_class.new(Menu = menu, Cart = cart)}

  it "prints the menu" do
    expect(subject.menu).to eq menu_string
  end

  it "starts with empty cart" do
    expect(subject.view_cart).to be_empty
  end

  context "#order" do

    it "adds item to cart" do
      cheese_burger_hash = {item: "Cheese Burger", description: "A regular burger with cheese", price: "5.95", available: true}
      allow(menu).to recieve(:available?).with(arg1).and_return(cheese_burger_hash)
      allow(cart).to recieve(:add_to_order).with(arg1)
      subject.add_to_order(cheese_burger_hash)
      expect(cart.add_to_order).to recieve(cheese_burger_hash)
    end

    it "doesn't add unavailable item to cart" do
      cheese_burger_hash = {item: "Cheese Burger", description: "A regular burger with cheese", price: "5.95", available: false}
      allow(menu).to recieve(:available?).with(arg1).and_return(false)
      subject.add_to_order(cheese_burger_hash)
      expect(cart.add_to_order).not_to recieve(cheese_burger_hash)
    end
  end

end