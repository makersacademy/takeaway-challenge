require "order"

describe Order do

  let(:order) { described_class.new }
  let(:pizza) { double "Dish.new", name: "Pizza", price: 8.5 }
  let(:pasta) { double "Dish.new", name: "Pasta", price: 7.5 }

  it "initializes with an empty array" do
    expect(order.review).to eq []
  end

  context "when the customer adds one or more dishes to the order" do

    before(:each) do
      order.add(pizza, 2)
      order.add(pasta, 1)
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes

    describe "#add" do
      it "adds a selected quantity of a selected dish to customer's order" do
        expected_review_output = [
          "#{pizza.name} #{"%.2f" % pizza.price}",
          "#{pizza.name} #{"%.2f" % pizza.price}",
          "#{pasta.name} #{"%.2f" % pasta.price}"
        ]
        expect(order.review).to eq expected_review_output
      end
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order

    describe "#total" do
      it "returns the total price for the order" do
        expected_total = (2 * pizza.price) + (1 * pasta.price)
        expect(order.total).to eq "%.2f" % expected_total
      end
    end
  end

end
