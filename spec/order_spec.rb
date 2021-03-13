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
    expect(order002.total).to eq(16)
    end
  end


  describe "#view_basket" do
    it "can view the basket" do
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      expect(order001.view_basket).to eq("Viewing basket for order number 1:\n, Cheese Burger £10\n, Fries £6\n, Total cost of order: £16")
    end
  end

  describe "#calculate_total" do
    it "calculates the total of the order" do
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      expect(order001.total).to eq(16)
    end
  end

  describe "#total_correct?" do
    let(:incorrect_total) { Order.new}
    before do
      allow(incorrect_total).to receive(:total_due).and_return(+5)
    end

    it "throws an error if the total is not correct" do
      incorrect_total.add_to_basket(cheeseBurger)
      incorrect_total.add_to_basket(fries)
    expect { incorrect_total.complete_order }.to raise_error "The total of this order is not correct!"
    end
  end

  describe "#complete_order" do
    it "confirms the order is complete and will be delivered an hour from now" do
      expect(order001.complete_order).to eq("Thank you! Your order was placed and will be delivered before #{Time.now + 60*60}")
    end

  end

end
