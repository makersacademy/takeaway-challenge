require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, sms) }
  let(:menu) { double(:menu, dishes: { "pepperoni" => 7.50, "hawaiian" => 6.50, "vegetarian" => 5.50 }) }

# think about extracting Text/sms to its own class
  let(:sms) { double(:sms, send_text: nil) }


  describe "#view_menu" do
    it "shows a shows a list of dishes with prices" do
      allow(menu).to receive(:print_menu).and_return("Pepperoni £7.50")
      expect(takeaway.view_menu).to eq("Pepperoni £7.50")
    end
  end

  describe "#add_to_order" do

    it "can select some number of several available dishes" do
      takeaway.add_to_order("Pepperoni", 2)
      expect(takeaway.order).to eq({ "Pepperoni" => 2 })
    end

    it "will not allow items that are not on the menu to be added" do
      expect { takeaway.add_to_order("Burger", 1) }.to raise_error("Burger is not on the menu")
    end
  end

  describe "#total" do
    it "will calculate the total price of the order" do
      takeaway.add_to_order("Pepperoni", 2)
      takeaway.add_to_order("Hawaiian", 1)
      total = 21.50  # Thats the actual total
      expect(takeaway.total).to eq(total)
    end
  end

  describe "#place_order" do
    it "will place the order and confirm via text" do
      expect(takeaway).to respond_to(:place_order)
    end
    it "sends a text when place_order method called" do

    end
  end
end
