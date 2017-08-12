require "takeaway_app"

describe TakeawayApp do
  let(:takeaway_app) { described_class.new }
  let(:order_item) { double "order_item" }
  let(:order) { double "order" }

  it "shows a list of dishes and prices" do
    expect { takeaway_app.show_dishes }.to output("1. Chicken Korma £8.00\n2. Lamb Balti £9.00\n").to_stdout
  end
  it "prompts user to make an order" do
    expect { takeaway_app.prompt_order }.to output("Please enter the dish number followed by a space followed by the quantity you would like to order. When you are finished please press enter twice.\n").to_stdout
  end
  it "can receive and store an order of 1 item" do
    subject.receive_order(order)
    expect(subject.order).to eq order
  end
end
