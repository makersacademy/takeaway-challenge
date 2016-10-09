require 'takeaway'

describe Takeaway do
  subject(:takeaway){described_class.new (Menu.new)}

  it "is able to read the menu" do
    expect(takeaway.menu).to eq ({"Chicken Wing" => 1.99, "Pizza" => 10.99, "Burger" => 4.99, "Soft Drink" => 1.49, "Ice Cream" => 2.99})
  end

  it "is able to add dishes" do
    takeaway.add("Pizza", 2)
    expect(takeaway.basket.cart).to include ({:dish => "Pizza", :price => 10.99, :quantity => 2})
  end

  it "raises error if dish is not found in the menu" do
    expect{takeaway.add("funnydish", 2)}.to raise_error "Dish not found on menu, please try again."
  end

  it "shows total price of basket" do
    takeaway.add("Pizza", 2)
    expect(takeaway.total).to eq "Total cost is £21.98."
  end

  it "returns a message after checkout" do
    expect(takeaway.checkout(20)).to eq "Congragulations!, Your order has been confirmed! You will receive an sms shortly."

  end

  context "sends sms with twilio api" do

    before do
      allow(takeaway).to receive(:send_message)
    end

    it "sends a text message after checkout" do
      expect(takeaway).to receive(:send_message).with("Thank you! The total cost of your order is £21.98, it will be delivered in 1 hour.")
      takeaway.checkout(21.98)
    end

  end
end
