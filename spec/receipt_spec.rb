require 'receipt'

RSpec.describe Receipt do

  context "use a fake order to print receipts" do
    it "returns order not yet submitted if order not completed" do
      order = double :order, completed?: false
      receipt = Receipt.new(order)
      expect(receipt.print).to eq "Order not yet submitted"
    end

    it "returns order not yet submitted if order not completed, with items on order" do
      order = double :order, check_dishes: "Fries: £3.99, Burger: £9.99", check_price: "£13.98", completed?: false
      receipt = Receipt.new(order)
      expect(receipt.print).to eq "Order not yet submitted"
    end

    it "prints the receipt when order complete" do
      order = double :order, check_dishes: ["Fries: £3.99", "Burger: £9.99"], join: "Fries: £3.99, Burger: £9.99", check_price: "£13.98", completed?: true
      receipt = Receipt.new(order)
      expect(receipt.print).to eq "Fries: £3.99, Burger: £9.99, Total: £13.98"
    end
  end
end