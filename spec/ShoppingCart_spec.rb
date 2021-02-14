require "ShoppingCart"

describe ShoppingCart do
  let(:cheese_burger){{name: "Cheese Burger", description: "regular burger with cheese", price: 5.50, available: true}}
  let(:soft_drink){{name: "Soft Drink", description: "coke, fanta, tango", price: 2.00, available: true}}

  it "show_cart is empty on creation" do
    order_string = "Total: £0.00"
    expect(subject.show_cart).to eq order_string
  end

  it "is open on creation" do
    expect(subject.open?).to eq true
  end

  context "#show_cart" do
    before(:each) do
      items_hash = {"Cheese Burger" => {number: 1, price: 5.50}, "Soft Drink" => {number: 2, price: 2.00}}
      subject.instance_variable_set(:@items, items_hash)
      subject.instance_variable_set(:@total, 9.50)
    end

    it "shows the cart" do
      order_string = "1x Cheese Burger, £5.50\n2x Soft Drink, £4.00\nTotal: £9.50"
      expect(subject.show_cart).to eq order_string
    end

  end

  context "#add_item" do
    it "adds the item to order" do
      order_string = "1x Cheese Burger, £5.50\nTotal: £5.50"
      subject.add_to_order(cheese_burger)
      expect(subject.show_cart).to eq order_string
    end

    it "adds two different items to order" do
      order_string = "1x Cheese Burger, £5.50\n1x Soft Drink, £2.00\nTotal: £7.50"
      subject.add_to_order(cheese_burger)
      subject.add_to_order(soft_drink)
      expect(subject.show_cart).to eq order_string
    end

    it "adds two identical items to order" do
      order_string = "2x Cheese Burger, £11.00\nTotal: £11.00"
      2.times{subject.add_to_order(cheese_burger)}
      expect(subject.show_cart).to eq order_string
    end
  end

  context "#total" do
    it "returns £0.00 when empty" do
      expect(subject.total).to eq 0.00
    end

    it "shows the correct total" do
      subject.instance_variable_set(:@total, 9.50)
      expect(subject.total).to eq 9.50
    end
  end

  # context "#invoice" do
  #   before(:each) do
  #     items_hash = {"Cheese Burger" => {number: 1, price: 5.50}, "Soft Drink" => {number: 2, price: 2.00}}
  #     invoice = {"Cheese Burger" => {number: 1, price: 5.50}, "Soft Drink" => {number: 2, price: 2.00}, Total: 9.50}
  #     subject.instance_variable_set(:@items, items_hash)
  #   end

  #   it "returns correct invoice for an order" do
  #     expect(subject.invoice).to eq invoice
  #   end

  #   it "sets open to false" do
  #     subject.invoice.should change {subject.open?}.from(true).to(false)
  #   end
  # end

  context "#open" do
    it "cannot be changed outside of invoice method" do
      open = subject.open?
      expect(subject.open?).to eq true
      open = false
      expect(subject.open?).to eq true
    end
  end
end