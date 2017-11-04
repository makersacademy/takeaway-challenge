require "order"

describe Order do

  subject(:order) { described_class.new }

  describe "#initialize" do
    it "ensures a new order gets initialized with an id number" do
      expect(subject.id).to be_kind_of(Numeric)
    end

    order1 = Order.new
    order2 = Order.new
    order3 = Order.new
    order4 = Order.new

    [order2.id - order1.id, order3.id - order2.id, order4.id - order3.id].each do |id_difference|
      it "ensures that order id's increase by one with each order being made" do
        expect(id_difference).to eq(1)
      end
    end
  end

  
end
