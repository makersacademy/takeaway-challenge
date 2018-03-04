require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(order_class, menu_class) }
  let(:order_class) { double :order_class, new: order_obj }
  let(:order_obj) { double :order_obj, order_ref: 123, total: 13.10 }
  let(:menu_class) { double :menu_class, new: menu_obj }
  let(:menu_obj) { double :menu_obj, list: { "crispy duck" => 14.00, "sweet & sour chicken" => 5.50, "shredded chilli beef" => 6.00, "egg fried rice" => 2.10 } }

  describe "allows customers to see the menu deatils" do
    it "opens the menu" do
      menu_output = "{\"crispy duck\"=>14.0, \"sweet & sour chicken\"=>5.5, \"shredded chilli beef\"=>6.0, \"egg fried rice\"=>2.1}\n"
      expect { takeaway.show_menu }.to output(menu_output).to_stdout
    end

    it "shows the menu dishes" do
      takeaway.show_menu
      expect(menu_obj.list.has_key?("crispy duck")).to be_truthy
    end

    it "shows the dish prices" do
      takeaway.show_menu
      expect(menu_obj.list.has_value?(14.00)).to be_truthy
    end
  end

  describe "allows customers to place an order" do

    it "starts an order" do
      expect(takeaway.start_order(123)).to eq order_obj
    end

    it "raises an error when the total is not equal to the sum of the dish prices" do
      takeaway.start_order(123)
      expect { takeaway.complete_order(123, 12.00) }.to raise_error(StandardError, "You have not paid the correct total amount")
    end

    it "returns a message to say order is complete" do
      takeaway.start_order(123)
      expect(takeaway.complete_order(123, 13.10)).to eq "Thank you! Your order #{order_obj.order_ref} was placed and will be delivered before 18:52"
    end


  end

end
