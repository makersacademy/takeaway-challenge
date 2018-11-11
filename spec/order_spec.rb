require "order"
require "menu"

describe Order do
  # let(:order_selection) { 'order selection' }

  before do
    allow($stdout).to receive(:write)
  end

  describe "#order_number" do
    it "gives a random order number between 4563 and 4985" do
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      expect(subject.order_number).to be_between(4563,4985)
    end
  end

  describe "#order_selection" do
    it "allows the user to make their selection" do
      expect_any_instance_of(Order).to receive(:order_formatter) { "N/A" }
      expect_any_instance_of(Order).to receive(:gets) { "1 Garlic Bread, 1 Margherita, total: 12" }
      expect(subject.order_string).to eq("1 Garlic Bread, 1 Margherita, total: 12")
    end
  end

  describe "#order_formatter" do
    it "formats the order into a useable format" do
      expect_any_instance_of(Order).to receive(:order_calculation) { "N/A" }
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      order_string = "1 Garlic Bread, 1 Margherita, total: 12"
      subject.order_formatter(order_string)
      expect(subject.order_formatted).to eq([["1", "Garlic Bread"], ["1", "Margherita"], ["total:", "12"]])
    end
  end

  describe "#order_calculation" do
    it "calculates the total cost of the order" do
      expect_any_instance_of(Order).to receive(:customers_cost) { "N/A" }
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      order_formatted = [["1", "Garlic Bread"], ["1", "Margherita"], ["total:", "12"]]
      subject.order_calculation(order_formatted)
      expect(subject.actual_order_cost).to eq(12)
    end
  end

  describe "#customers_cost" do
    it "checks if the customers value of their order is correct" do
      expect_any_instance_of(Order).to receive(:order)
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      order_string = "1 Garlic Bread, 1 Margherita, total: 12"
      subject.customers_cost(order_string)
      expect(subject.customer_order_cost).to eq(12)
    end
    it "checks if the customers value of their order is correct" do
      expect_any_instance_of(Order).to receive(:order) { "N/A" }
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      order_string = "1 Garlic Bread, total: 4"
      subject.customers_cost(order_string)
      expect(subject.customer_order_cost).to eq(4)
    end
  end
  describe "#order" do
    it "compares auto cost and customer cost to be the same" do
      expect_any_instance_of(Order).to receive(:confirm_order) { :confirm_order }
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      customer_order_cost = 5
      actual_order_cost = 5
      expect(subject.order(customer_order_cost, actual_order_cost)).to be(:confirm_order)
    end
    it "compares auto cost and customer cost to be the same" do
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      customer_order_cost = 4
      actual_order_cost = 5
      expect { subject.order(customer_order_cost, actual_order_cost) }.to raise_error "Your total is different to the actual total, please try again"
    end
  end

  describe "#confirm_order" do
    it "Sends a text if the user confirms their order" do
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      expect_any_instance_of(Order).to receive(:gets) { "y" }
      expect_any_instance_of(Delivery).to receive(:send_message) { "message sent" }
      expect(subject.confirm_order).to eq("message sent")
    end
    it "cancels delivery if not confirmed" do
      expect_any_instance_of(Order).to receive(:order_selection) { "n" }
      expect_any_instance_of(Order).to receive(:gets) { "n" }
      expect(subject.confirm_order).to eq("cancelled delivery")
    end
  end
end
