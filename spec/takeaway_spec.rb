require 'takeaway'
require 'menu'

describe Takeaway do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  subject(:takeaway) { described_class.new(Menu.new) }

  let(:valid_selection) { {
          dishes: [:miso, :tempura, :rice],
          quantities: [1, 1, 1],
          total: 6.00
        } }
  let(:empty_selection) { {} }

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
  end

  describe "#check_total" do
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order
    it "should check whether the total I specified matches the actual total of the menu items" do
      expect(takeaway.check_total(valid_selection)).to eq true
    end
  end

  describe "#send_confirmation" do
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  end
end
