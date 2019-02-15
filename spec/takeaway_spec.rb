require 'takeaway'

describe Takeaway do
  it "gives a list of dishes" do
    takeaway = Takeaway.new
    msg = "You can order from:
burger - £10
chips - £4
salad - £5
lemonade - £2
"
    expect { takeaway.dishes }.to output(msg).to_stdout
  end

  it "accepts orders from customers" do
    takeaway = Takeaway.new
    expect(takeaway).to respond_to(:place_order)
  end

  it "gives an error if the order total does not match the customer's total" do
    takeaway = Takeaway.new
    expect { takeaway.place_order({ "burger" => 2, "chips" => 1 }, 20) }.to raise_error("incorrect total")
  end

  it "sends a text confirmation if the order total does match the customer's total" do
    takeaway = Takeaway.new
    expect(takeaway).to receive(:send_text)
    takeaway.place_order({ "burger" => 2, "chips" => 1 }, 24)
  end
end
