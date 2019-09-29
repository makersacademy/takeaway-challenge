
require "order"

describe Order do
  subject(:my_order) { described_class.new }

  describe "#add" do
    it "takes the name and quantity of dish without an error" do
      expect { my_order.add("Lobster", 2) }.not_to raise_error
    end
  end
end
