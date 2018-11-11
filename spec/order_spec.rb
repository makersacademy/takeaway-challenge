require "order"
require "menu"

describe Order do

  before do
    allow($stdout).to receive(:write)
  end

  describe "#order_process" do
    it "goes through the whole order_process" do
      expect_any_instance_of(Order).to receive(:order_selection)
      expect_any_instance_of(Order).to receive(:confirm_order)
      subject.instance_variable_set("@order_string", "5 Americana, total: 50")
      subject.order_process
      expect(subject.actual_order_cost).to eq(50)
    end
  end

  describe "#order_number" do
    it "gives a random order number between 4563 and 4985" do
      expect(subject.order_number).to be_between(4563, 4985)
    end
  end

  describe "#order_selection" do
    it "allows the user to make their selection" do
      expect_any_instance_of(Order).to receive(:gets) { "1 Garlic Bread, 1 Margherita, total: 12" }
      subject.order_selection
      expect(subject.order_string).to eq("1 Garlic Bread, 1 Margherita, total: 12")
    end
  end

  describe "#order_formatter" do
    it "formats the order into a useable format" do
      subject.instance_variable_set("@order_string", "1 Garlic Bread, 1 Margherita, total: 12")
      subject.order_formatter
      expect(subject.order_formatted).to eq([["1", "Garlic Bread"], ["1", "Margherita"], ["total:", "12"]])
    end
  end

  describe "#order_calculation" do
    it "calculates the total cost of the order" do
      subject.instance_variable_set("@order_formatted", [["1", "Garlic Bread"], ["1", "Margherita"], ["total:", "12"]])
      subject.order_calculation
      expect(subject.actual_order_cost).to eq(12)
    end
  end

  describe "#customers_cost" do
    it "checks if the customers value of their order is correct" do
      subject.instance_variable_set("@order_string", "1 Garlic Bread, 1 Margherita, total: 12")
      subject.customers_cost
      expect(subject.customer_order_cost).to eq(12)
    end
    it "checks if the customers value of their order is correct" do
      subject.instance_variable_set("@order_string", "1 Garlic Bread, total: 4")
      subject.customers_cost
      expect(subject.customer_order_cost).to eq(4)
    end
  end

  describe "#order" do
    it "compares auto cost and customer cost to be the same" do
      subject.instance_variable_set("@customer_order_cost", 5)
      subject.instance_variable_set("@actual_order_cost", 5)
      expect(subject.order_errors).to be(nil)
    end
    it "compares auto cost and customer cost to be the same" do
      subject.instance_variable_set("@customer_order_cost", 5)
      subject.instance_variable_set("@actual_order_cost", 4)
      expect { subject.order_errors }.to raise_error "Your total is different to the actual total, please try again"
    end
  end

  describe "#confirm_order" do
    it "Sends a text if the user confirms their order" do
      expect_any_instance_of(Order).to receive(:gets) { "y" }
      expect_any_instance_of(Delivery).to receive(:send_message) { "message sent" }
      expect(subject.confirm_order).to eq("message sent")
    end
    it "cancels delivery if not confirmed" do
      expect_any_instance_of(Order).to receive(:gets) { "n" }
      expect(subject.confirm_order).to eq("cancelled delivery")
    end
  end
end
