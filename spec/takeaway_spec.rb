require "takeaway"

describe Takeaway do
  it "can make a new instance of Takeaway" do
    expect(Takeaway.new).to be_an_instance_of(Takeaway)
  end

  it "can respond to Takeaway_dishes method" do
    takeaway = Takeaway.new
    expect(takeaway).to respond_to(:order_dishes).with(2).arguments
  end

  it "can record an order" do
    takeaway = Takeaway.new
    takeaway.order_dishes("Avocado On Toast", 2)
    expect(takeaway.show_order).to eq([{ name: "Avocado On Toast", price: 5.50 }, { name: "Avocado On Toast", price: 5.50 }])
  end

  it "checks order total" do
    takeaway = Takeaway.new
    takeaway.order_dishes("Avocado On Toast", 2)
    takeaway.order_dishes("Jam On Toast")
    expect(takeaway.order_total).to eq(15.5)
  end

  it "sends text after placing order" do
    takeaway = Takeaway.new
    takeaway.order_dishes("Avocado On Toast", 2)
    takeaway.stub(:place_order) { "Order placed. Text sent." }
    expect(takeaway.place_order).to eq "Order placed. Text sent."
  end

  it "fails to place order if nothing is ordered" do
    takeaway = Takeaway.new
    expect { takeaway.place_order }.to raise_error("Cannot complete order. Nothing has been ordered.")
  end
end
