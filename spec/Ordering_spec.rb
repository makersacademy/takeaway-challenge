require "Ordering.rb"

describe Ordering do
  let(:menu){ double :menu}
  menu_string = "Regular Burger, £5.95\nCheese Burger, £5.95\nBeer, £4.00"
  
  let(:cart){ double :cart }

  subject { described_class.new(menu, cart)}

  before (:each) do
    allow(menu).to receive(:print).and_return(menu_string)
    allow(cart).to receive(:show_cart).and_return([])
    allow(cart).to receive(:new)
  end

  it "prints the menu" do
    expect(subject.menu).to eq menu_string
  end

  it "starts with empty cart" do
    expect(subject.view_cart).to be_empty
  end

  context "#add_to_order" do

    it "adds item to cart" do
      original_burger_hash = {item: "Burger", description: "A regular burger without cheese", price: "5.95", available: true}
      allow(menu).to receive(:available?).with("Burger").and_return(original_burger_hash)
      expect(cart).to receive(:add_to_order).with(original_burger_hash)
      subject.add_to_order("Burger")
      # expect(cart).to receive(:add_to_order).with(original_burger_hash)
    end

    it "adding unavailable item to cart throws error" do
      cheese_burger_hash = {item: "Cheese Burger", description: "A regular burger with cheese", price: "5.95", available: false}
      allow(menu).to receive(:available?).with("Cheese Burger").and_return(false)
      expect(cart).not_to receive(:add_to_order)
      expect { subject.add_to_order("Cheese Burger") }.to raise_error("Cheese Burger not available")
    end
  end

end