require "order"

describe Order do

  let(:order) { described_class.new }
  let(:pizza) { double "Dish.new", name: "Pizza", price: 8.5 }
  let(:pasta) { double "Dish.new", name: "Pasta", price: 7.5 }
  let(:pizza_qtty) { 2 }
  let(:pasta_qtty) { 1 }
  let(:expected_total) { (pizza_qtty * pizza.price) + (pasta_qtty * pasta.price) }
  let(:t) { Time.now }
  let(:eta) { "#{t.hour + 1}:#{t.min}" }
  let(:message) { "Thank you! You order was placed and will be delivered before #{eta}" }
  let(:error) { "Authorized amount is incorrect, please try again" }

  it "initializes with an empty array" do
    expect(order.review).to eq []
  end

  context "when the customer adds one or more dishes to the order" do

    before(:each) do
      order.add(pizza, pizza_qtty)
      order.add(pasta, pasta_qtty)
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
    # I would like to check that the total I have been given matches the sum
    #   of the various dishes in my order

    describe "#print_total" do
      it "returns the total price for the order" do
        expect(order.print_total).to eq "%.2f" % expected_total
      end
    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed
    #   and will be delivered before 18:52" after I have ordered

    describe "#place" do

      it "returns a confirmation message if order was placed giving the correct total" do
        expect(order.place(expected_total.to_f)).to eq message
      end

      it "returns an error if order was placed given the incorrect total" do
        expect(order.place(expected_total.to_f - 1)).to eq error
      end

    end

  end

end
