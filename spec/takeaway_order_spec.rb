require 'takeaway_order'

describe TakeawayOrder do
  let(:takeaway_order)  { TakeawayOrder.new(takeaway_menu) }
  let(:takeaway_menu) { double :TakeawayMenu }
  let(:szechuan_chilli_beef) { double :TakeawayDish }
  let(:szechuan_chilli_chicken) { double :TakeawayDish }
  let(:kung_po_chicken) { double :TakeawayDish }
  let(:vegetable_spring_rolls) { double :TakeawayDish }

  context "#initialize" do
    it 'successfully instantiates the TakeawayOrder class' do
      expect(takeaway_order).to be_instance_of(TakeawayOrder)
    end

    it "creates an empty hash to store the ordered takeaway dishes" do
      expect(takeaway_order.list_of_dishes).to be_empty
    end

    it "copies the menu so that all dishes are available" do
      expect(takeaway_order.stored_menu).to eq takeaway_menu
    end

    it "sets the cost of the order to zero" do
      expect(takeaway_order.current_order_cost).to be_zero
    end
  end
end
