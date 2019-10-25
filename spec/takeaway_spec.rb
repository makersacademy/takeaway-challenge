require 'takeaway'

describe Takeaway do
  let(:takeaway) { Takeaway.new(args) }
  let(:takeaway_order_class) { class_double "takeawayOrder" }
  let(:args) { { :takeaway_menu => takeaway_menu, :takeaway_order_class => takeaway_order_class, :print_module => menu_printer, :total_checker => total_checker } }
  let(:takeaway_order) { double :TakeawayOrder }
  let(:takeaway_menu) { double :TakeawayMenu }
  let(:szechuan_chilli_beef) { double :TakeawayDish }
  let(:szechuan_chilli_chicken) { double :TakeawayDish }
  let(:kung_po_chicken) { double :TakeawayDish }
  let(:vegetable_spring_rolls) { double :TakeawayDish }
  let(:takeaway_dishes) { [szechuan_chilli_beef, szechuan_chilli_chicken, kung_po_chicken, vegetable_spring_rolls] }
  let(:menu_printer) { PrintMenu }
  let(:total_checker) { TotalChecker }
  
  before(:each) do
    allow(takeaway_order_class).to receive(:new) { takeaway_order }
    allow(menu_printer).to receive(:print_menu) { print "string" }
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

  describe "#display_menu" do
    it 'responds to display_menu' do
      expect(takeaway).to respond_to(:display_menu)
    end

    it "results in a string printed" do
      allow(takeaway_menu).to receive(:takeaway_dishes)
      expect { takeaway.display_menu }.to output("string").to_stdout
    end
  end

  describe "#place_takeaway_order" do
    before(:each) do
      allow(szechuan_chilli_beef).to receive(:price) { 6.50 }
      allow(szechuan_chilli_chicken).to receive(:price) { 6.50 }
      allow(kung_po_chicken).to receive(:price) { 5.50 }
      allow(vegetable_spring_rolls).to receive(:price) { 3 }
      allow(takeaway_order).to receive(:list_of_dishes) { { szechuan_chilli_beef => 3, szechuan_chilli_chicken => 2, kung_po_chicken => 1, vegetable_spring_rolls => 4 } }
    end

    it "gives an error message if the basket total is wrong" do
      allow(total_checker).to receive(:check_basket_total) { false }
      allow(takeaway_order).to receive(:current_order_cost) { 100 }
      expect { takeaway.place_order(takeaway_order) }.to raise_error(RuntimeError, "The cost of your basket is incorrect!")
    end

    it "prints a message if the order total is correct to confirm the order" do
      allow(total_checker).to receive(:check_basket_total) { true }
      allow(takeaway_order).to receive(:current_order_cost) { 40 }
      message = "Your order has been accepted, you will receive a text message confirmaton shortly!"
      expect { takeaway.place_order(takeaway_order) }.to output(message).to_stdout
    end
  end
end
