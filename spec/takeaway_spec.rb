require 'takeaway'

describe Takeaway do
  let(:takeaway) { Takeaway.new(args) }
  let(:takeaway_order_class) { class_double "takeawayOrder" }
  let(:args) { { :takeaway_menu => takeaway_menu, :takeaway_order_class => takeaway_order_class } }
  let(:takeaway_order) { double :TakeawayOrder }
  let(:takeaway_menu) { double :TakeawayMenu }
  let(:szechuan_chilli_beef) { double :TakeawayDish }
  let(:szechuan_chilli_chicken) { double :TakeawayDish }
  let(:kung_po_chicken) { double :TakeawayDish }
  let(:vegetable_spring_rolls) { double :TakeawayDish }
  
  before(:each) do
    allow(takeaway_order_class).to receive(:new) { takeaway_order }
  end

  describe '#initialize' do
    it 'responds to takeaway_menu' do
      expect(takeaway).to respond_to(:takeaway_menu)
    end
  end

  describe "#new_order" do
    it "returns a new order object" do
      expect(takeaway.start_new_order).to eq takeaway_order
    end

    it "passes the takeaway_menu object to the order's :stored_menu" do
      allow(takeaway_order).to receive(:takeaway_menu) { TakeawayMenu }
      takeaway.start_new_order
      expect(takeaway_order.takeaway_menu).to eq TakeawayMenu
    end
  end
end
