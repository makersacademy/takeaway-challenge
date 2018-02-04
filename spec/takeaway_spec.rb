require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:menu)         { double :menu }
  let(:order)        { double :order }
  let(:order)        { double :text_message }
  let(:printed_menu) { "Prawn Crackers - £1.51, Prawn Gyoza - £3.51, Chicken Gyoza - £3.11, Spring Rolls - £3.15" }
  let(:dish_1)       { "Prawn Gyoza" }
  let(:quantity_1)   { 4 }
  let(:dish_2)       { "Chicken Gyoza" }
  let(:quantity_2)   { 1 }

  describe '#see_menu' do
    it "returns menu showing a list of dishes with prices" do
      expect(takeaway.see_menu).to eq(printed_menu)
    end
  end

  describe "#add_to_order" do
    it "returns confirmation that selected dishes have been added to order" do
      added_items = "#{dish_1} x#{quantity_1} added to your order"
      expect(takeaway.add_to_order(dish_1, quantity_1)).to eq(added_items)
    end
  end

  describe "#remove_from_order" do
    it "returns confirmation that selected dishes have been removed from order" do
      removal_confirmation = "x#{quantity_1} portions of #{dish_1} removed from order"
      takeaway.add_to_order(dish_1, quantity_1)
      expect(takeaway.remove_from_order(dish_1, quantity_1)).to eq(removal_confirmation)
      # expect{ takeaway.remove_from_order(dish_1, quantity_1)).to output(removal_confirmation).to_stdout }
    end
  end

  describe "#basket_summary" do
    it "returns a list of dishes in basket, quantity ordered and sub-total" do
      takeaway.add_to_order(dish_1, quantity_1)
      takeaway.add_to_order(dish_2, quantity_2)
      summary_message = "Prawn Gyoza x4 = £14.04, Chicken Gyoza x1 = £3.11"
      expect(takeaway.order_summary).to eq summary_message
    end
  end

  describe "#order_total" do
    it 'returns the total cost of dishes' do
      takeaway.add_to_order(dish_1, quantity_1)
      takeaway.add_to_order(dish_2, quantity_2)
      expect(takeaway.order_total).to eq("Total cost: £17.15")
    end
  end

  describe "#confirm_order" do
    it "raises an error if user confirms order without adding dishes to order" do
      no_dishes_error = "Order empty: please add items to order"
      expect { takeaway.confirm_order }.to raise_error(no_dishes_error)
    end

    it "confirms receipt of order and sends text message confirming order" do
      takeaway.add_to_order(dish_1, quantity_1)
      allow(takeaway).to receive(:send_text)
      expect(takeaway).to receive(:send_text).and_return("Order received. Please await SMS for order confirmation")
      takeaway.confirm_order
    end
  end
end
