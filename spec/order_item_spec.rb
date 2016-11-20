require "order_item.rb"

describe OrderItem do
  let(:dish) {double(:dish)}
  subject(:order_item) {described_class.new(dish)}

  describe "when instantiated" do
    it "should have a dish" do
      expect(order_item.dish).not_to be_nil
    end

    it "should have a default amount amount" do
      expect(order_item.amount).to eq 1
    end
  end
end
