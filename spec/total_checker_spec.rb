require "total_checker"

describe TotalChecker do

  let(:total_checker) { TotalChecker }
  let(:takeaway_order)  { double :TakeawayOrder }
  let(:szechuan_chilli_beef) { double :TakeawayDish }
  let(:szechuan_chilli_chicken) { double :TakeawayDish }
  let(:kung_po_chicken) { double :TakeawayDish }
  let(:vegetable_spring_rolls) { double :TakeawayDish }

  describe "#check_basket_total" do
    it "returns true if expected_order_total is correct" do
      allow(szechuan_chilli_beef).to receive(:price) { 6.50 }
      allow(szechuan_chilli_chicken).to receive(:price) { 6.50 }
      allow(kung_po_chicken).to receive(:price) { 5.50 }
      allow(vegetable_spring_rolls).to receive(:price) { 3 }
      allow(takeaway_order).to receive(:list_of_dishes) { { szechuan_chilli_beef => 3, szechuan_chilli_chicken => 1, kung_po_chicken => 2, vegetable_spring_rolls => 1 } }
      allow(takeaway_order).to receive(:current_order_cost) { 40 }
      expect(total_checker.check_basket_total(takeaway_order)).to eq(true)
    end
  end
end
