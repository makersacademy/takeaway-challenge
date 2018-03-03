require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(order_class) }
  let(:order_class) { double :order_class, new: order_obj }
  let(:order_obj) { double :order_obj, order_ref: 123 }

  describe "allows customers to see the menu deatils" do
    it "opens the menu" do
      expect { takeaway.show_menu }.to output(takeaway.menu).to_stdout
    end

    it "shows the menu dishes" do
      takeaway.show_menu
      expect(takeaway.menu[0][:dish]).to eq "Crispy Duck"
    end

    it "shows the dish prices" do
      takeaway.show_menu
      expect(takeaway.menu[0][:price]).to eq 14.00
    end
  end

  describe "allows customers to place an order" do

    it "starts an order" do
      expect(takeaway.start_order(123)).to eq order_obj
    end

    it "completes an order" do
      takeaway.start_order(123)
      expect(takeaway.complete_order(123)).to eq "Thank you! Your order #{order_obj.order_ref} was placed and will be delivered before 18:52"
    end

  end

end
