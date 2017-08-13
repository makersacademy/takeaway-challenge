require "takeaway_app"
require "order_item"

describe TakeawayApp do
  let(:takeaway_app) { described_class.new }
  let(:order_item) { double "order_item" }
  let(:order_item2) { double "order_item2" }
  let(:order) { double "order" }
  let(:time) {double "time"}
  it "shows a list of dishes and prices" do
    expect { takeaway_app.show_dishes }.to output("1. Chicken Korma £8\n2. Lamb Balti £9\n").to_stdout
  end
  it "prompts user to make an order" do
    expect { takeaway_app.prompt_order }.to output("Please enter the dish number followed by a space followed by the quantity you would like to order. When you are finished please press enter twice.\n").to_stdout
  end
  it "can receive and store an order" do
    takeaway_app.receive_order(order)
    expect(takeaway_app.order).to eq order
  end
  # it "shows the order summary" do
  #   takeaway_app.receive_order(order)
  #   expect(takeaway_app.show_order).to eq order
  # end
  it "raises an error if the total and the sum of the item costs are different" do
    allow(order_item).to receive(:cost).and_return(16)
    allow(order_item2).to receive(:cost).and_return(9)
    allow(order).to receive(:contents).and_return([order_item, order_item2])
    allow(order).to receive(:total).and_return(26)
    takeaway_app.receive_order(order)
    expect { takeaway_app.check_calculation }.to raise_error("Does not add up correctly")
  end

  it "calculates the time an hour from now" do
    t = Time.new + 3600
    expect(takeaway_app.time_in_an_hour).to eq t.strftime("%H:%M")
  end
end
