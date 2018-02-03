require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:printed_menu) { "Prawn Crackers - £1.51, Prawn Gyoza - £3.51, Chicken Gyoza - £3.11, Spring Rolls - £3.15" }
  let(:dish_1)       { "Prawn Gyoza" }
  let(:quantity_1)   { 4 }
  let(:dish_2)       { "Chicken Gyoza" }
  let(:quantity_2)   { 1 }

  describe '#see_menu' do
    it "allows the user to see a list of dishes with prices" do
      expect(takeaway.see_menu).to eq(printed_menu)
    end
  end

  describe "#add_to_order" do
    it "allows the user to select some number of several available dishes" do
      added_items = "#{dish_1} x#{quantity_1} added to your basket"
      expect(takeaway.add_to_order(dish_1, quantity_1)).to eq(added_items)
    end
  end

  describe "#basket_summary" do
    it "prints a list of dishes in basket, quantity ordered and sub-total" do
      takeaway.add_to_order(dish_1, quantity_1)
      takeaway.add_to_order(dish_2, quantity_2)
      summary_message = ("Prawn Gyoza x4 = £14.04, Chicken Gyoza x1 = £3.11")
      expect(takeaway.order_summary).to eq summary_message
      end
    end

  describe '#order_total' do
    it 'prints the total cost of dishes' do
      takeaway.add_to_order(dish_1, quantity_1)
      takeaway.add_to_order(dish_2, quantity_2)
      expect(takeaway.order_total).to eq("Total cost: £17.15")
    end
  end

end
