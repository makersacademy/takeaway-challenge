require "Ordering.rb"

describe Ordering do
  let(:menu){ double :Menu}
  menu_string = "Regular Burger, £5.95\nCheese Burger, £5.95\nBeer, £4.00"
  let(:cart){ double :Cart }
  let(:kitchen){ double :Kitchen}

  subject { described_class.new(menu, cart, kitchen)}

  before (:each) do
    allow(menu).to receive(:print).and_return(menu_string)
    allow(cart).to receive(:show_cart).and_return([])
    allow(cart).to receive(:new)
  end

  it "prints the menu" do
    expect(subject.menu).to eq menu_string
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

  context "#view_cart" do
    it "Ordering starts with empty cart" do
      order_string = "\nTotal: £0.00"
      allow(cart).to receive(:show_cart).and_return(order_string)
      expect(subject.view_cart).to eq order_string
    end

    it "returns items, prices, and totals" do
      order_string = "1x Regular Burger, £5.95\n2x Beer, £4.00\nTotal: £13.95"
      allow(cart).to receive(:show_cart).and_return(order_string)
      expect(subject.view_cart).to eq order_string
    end

  end

  context "#checkout" do
    order_hash = {Hamburger: 1, Beer: 2}
    before(:each) do
      bill = 13.95
      allow(cart).to receive(:total).and_return(bill)
      invoice = {Hamburger: {number: 1, price: 5.95}, Beer: {number: 2, price: 8}, Total: bill}
      allow(cart).to receive(:invoice).and_return(invoice)
      allow(kitchen).to receive(:order).with(order_hash).and_return(true)
    end

    # handling money wasn't actually requested in the user stories
    # it "raises error if amount is less than total" do
    #   expect{subject.checkout(bill / 2)}.to raise_error("Not enough funds: please give £#{bill - (bill/2).floor(2)} more")
    # end

    # it "sends payment and invoice to accounts" do
    #   subject.checkout(bill)
    #   expect(accounts).to receive(:order).with(bill, invoice).and_return("Order Processed")
    # end

    it "requests invoice" do
      expect(cart).to receive(:invoice)
      subject.checkout
    end

    it "sends order to the kitchen" do
      expect(kitchen).to receive(:order).with(order_hash)
      subject.checkout
    end
  end
end