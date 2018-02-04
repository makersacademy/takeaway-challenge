require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:printed_menu) { "Prawn Crackers - £1.51, Prawn Gyoza - £3.51, Chicken Gyoza - £3.11, Spring Rolls - £3.15" }
  let(:dish_1)       { "Prawn Gyoza" }
  let(:quantity_1)   { 4 }
  let(:dish_2)       { "Chicken Gyoza" }
  let(:quantity_2)   { 1 }
  let(:confirmed_order) { double :confirmed_order }

  describe '#see_menu' do
    it "prints menu showing a list of dishes with prices" do
      expect(takeaway.see_menu).to eq(printed_menu)
    end
  end

  describe "#add_to_order" do
    it "confirms that customer has added selected dishes and quantities to order" do
      added_items = "#{dish_1} x#{quantity_1} added to your basket"
      expect(takeaway.add_to_order(dish_1, quantity_1)).to eq(added_items)
    end
  end

  describe "#remove_from_order" do
    it "confirms that the user has removed selected dishes and their quantities from order" do
      removal_confirmation = "x#{quantity_1} portions of #{dish_1} removed from order"
      takeaway.add_to_order(dish_1, quantity_1)
      expect(takeaway.remove_from_order(dish_1,quantity_1)).to eq(removal_confirmation)
    end
  end

  describe "#basket_summary" do
    it "prints a list of dishes in basket, quantity ordered and sub-total" do
      takeaway.add_to_order(dish_1, quantity_1)
      takeaway.add_to_order(dish_2, quantity_2)
      summary_message = "Prawn Gyoza x4 = £14.04, Chicken Gyoza x1 = £3.11"
      expect(takeaway.order_summary).to eq summary_message
    end

    it "raises an error if basket is empty" do
        no_dishes_error = "You haven't added any dishes to your order. Please add dishes"
        expect { takeaway.order_summary }.to raise_error(no_dishes_error)
    end
  end

  describe "#order_total" do
    it 'prints the total cost of dishes' do
      takeaway.add_to_order(dish_1, quantity_1)
      takeaway.add_to_order(dish_2, quantity_2)
      expect(takeaway.order_total).to eq("Total cost: £17.15")
    end

    it "raises an error if basket is empty" do
        no_dishes_error = "You haven't added any dishes to your order. Please add dishes"
        expect { takeaway.order_total }.to raise_error(no_dishes_error)
    end
  end

  describe "#confirm_order" do
    it "raises an error if user tries to confirm order without adding dishes to order" do
      no_dishes_error = "You haven't added any dishes to your order. Please add dishes"
      expect { takeaway.confirm_order }.to raise_error(no_dishes_error)
    end

    it "confirms that a text message confirming order has been sent" do
      takeaway.add_to_order(dish_1, quantity_1)
      # expect(confirmed_order).to receive(:send_text).and_return("Hello, your order will be with you in an hour")
      # takeaway.confirm_order
      # allow(airport).to receive(:stormy?).and_return(false)
      expect(takeaway.confirm_order).to eq "SMS sent"
    end
  end
end
