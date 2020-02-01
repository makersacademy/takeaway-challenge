require 'restaurant'

describe Restaurant do
  let(:dish) { double("Chicken Burger") }
  describe "#add_to_order" do
    before(:example) do
      allow(dish).to receive(:name).and_return("Chicken Burger")
    end
    it "should add an order to the current order list" do
      subject.add_to_order(dish.name)
      expect(subject.current_order.length).to eq 1
    end
  end
end
