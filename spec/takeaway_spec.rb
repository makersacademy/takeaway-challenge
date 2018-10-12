require 'takeaway'
require 'tokyo_menu'

describe Takeaway do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  subject(:takeaway) { described_class.new(TokyoMenu.new) }

  let(:valid_selection) { {
          dishes: [{ nickname: :miso, quantity: 1 }, { nickname: :tempura, quantity: 1 }, { nickname: :rice, quantity: 1 }],
          total: 6.00
        } }
  let(:empty_selection) { {} }
  let(:invalid_selection) { {
          dishes: [{ nickname: :miso, quantity: 1 }, { nickname: :tempura, quantity: 1 }, { nickname: :rice, quantity: 1 }],
          total: 0.00
        } }

  describe "#list_food" do
    it "should list food items with their menu number, name, and price" do
      # regex matcher for specific format
      # e.g. "1. Menu Item. (£0.00)"
      expect { takeaway.list_food }.to output(/\d.\s\w+(\s\w+)*.\s\(£\d.\d\d\)/).to_stdout
    end
    it "should raise error when no menu provided" do
      expect { described_class.new }.to raise_error ArgumentError
    end
  end

  describe "#order" do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it "should not raise error when I order correctly" do
      expect { takeaway.order(valid_selection) }.to_not raise_error
    end

    it "should raise error when I order with an empty selection" do
      expect { takeaway.order(empty_selection) }.to raise_error "ERROR: It looks like something went wrong with your order request."
    end

    it "should raise error when I order with an invalid selection" do
      expect { takeaway.order(invalid_selection) }.to raise_error "ERROR: It looks like something went wrong with your selection."
    end
  end

  describe "#check_total" do
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order
    it "should return true when I check a valid selection" do
      expect(takeaway.check_total(valid_selection)).to eq true
    end
    it "should return false when I check an invalid selection" do
      expect(takeaway.check_total(invalid_selection)).to eq false
    end
    it "should raise an error when I check an empty selection" do
      expect { takeaway.check_total(empty_selection) }.to raise_error "ERROR: It looks like something went wrong with your selection."
    end
  end

  describe "#confirm_order" do
    it "gives the takeaway the order" do
      takeaway.order(valid_selection)
      expect(takeaway.current_selection).to_not be_nil
    end
  end

  describe "#send_confirmation_text" do
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  end
end
