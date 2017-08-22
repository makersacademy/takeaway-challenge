require "takeaway_app"
require "order_item"
require "order"

describe TakeawayApp do
  let(:order_class) { double :order_class }
  let(:takeaway_app) { described_class.new(order_class) }
  let(:order_item) { double "order_item" }
  let(:order_item2) { double "order_item2" }
  let(:order) { double "order" }
  let(:STDIN) { double "STDIN"}
  it "shows a list of dishes and prices" do
    expect { takeaway_app.show_dishes }.to output("1. Chicken Korma £8\n2. Lamb Balti £9\n").to_stdout
  end
  it "prompts user to make an order" do
    expect { takeaway_app.prompt_order }.to output("Please enter the dish number followed by a space followed by the quantity you would like to order. When you are finished please press enter twice.\n").to_stdout
  end
  it "can receive and store an order" do
    allow(STDIN).to receive(:gets).and_return("1 2\n","\n")
    allow(order_class).to receive(:new).and_return(order)
    takeaway_app.get_user_input
    expect(takeaway_app.user_input_array).to eq ["1 2"]
  end
  it "shows the order summary" do
    allow(STDIN).to receive(:gets).and_return("1 2\n","\n")
    allow(order_class).to receive(:new).and_return(order)
    takeaway_app.get_user_input
    expect(order).to receive(:show)
    takeaway_app.show_order
  end

  it "raises an error if the customer does not agree with the total" do
    allow(STDIN).to receive(:gets).and_return("1 2\n","\n","26")
    allow(order_class).to receive(:new).and_return(order)
    allow(order).to receive(:total).and_return(25)
    takeaway_app.get_user_input
    expect { takeaway_app.check_calculation }.to raise_error("Does not add up correctly")
  end

end
