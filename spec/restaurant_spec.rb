require 'restaurant'

describe Restaurant do
  context "placing an order" do
    let(:item) { double(:ItemClass, name: "Burger", price: 6) }
    let(:order) { double(:order, add: true, check_bill: item) }
    it "creates a new order" do
      # subject.add(item, 4)
      # expect(subject.check_bill).to include item
    end
  end
end
