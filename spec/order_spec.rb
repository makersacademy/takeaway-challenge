require 'order'

describe Order do
  let(:order001) { Order.new }
  let(:cheeseBurger) { ["Cheese Burger", 10]}
  let(:fries) { ["Fries", 6] }

  it "initializes with an order number" do
    expect(order001.number).to eq(1)
  end

  it "initializes with an empty basket" do
    expect(order001.basket).to be_kind_of(Array)
  end

  describe "#add_to_basket" do
    it "adds a dish name to the basket array" do
      order001.add_to_basket(cheeseBurger)
      expect(order001.basket).to eq([["Cheese Burger", 10]])
    end

    it "adds more than one dish name to the array" do
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      expect(order001.basket).to eq([["Cheese Burger", 10], ["Fries", 6]])
    end
  end

  describe "#total_so_far" do
    let(:order002) { Order.new }
    it "let's the customer know the total cost of the order so far" do
    order002.add_to_basket(cheeseBurger)
    order002.add_to_basket(fries)
    expect(order002.pending_total).to eq(16)
    end
  end


  describe "#view_basket" do
    it "can view the basket" do
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      expect(order001.view_basket).to eq("Viewing basket for order number 1:\n, Cheese Burger £10\n, Fries £6\n, Total cost of order: 16")
    end
  end

  describe "#calculate_total" do
    it "calculates the total of the order" do
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      expect(order001.total_due).to eq(16)
    end
  end


  describe "#total_correct?" do
    it "double checks the total is correct against the menu" do
    expect(order001.total_correct?).to be(true)
    end
  end

end
