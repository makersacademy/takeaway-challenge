require './lib/order'
require './lib/menuitems'

# bbq_chicken: 3, vegan: 2, hawaiian: 3

describe Order do
  subject(:order) { described_class.new(items) }

  # CREATE ALL REQUIRED FAKES HERE
  before do
    allow(items).to receive(:has_item?).with(:bbq_chicken).and_return(true)
    allow(items).to receive(:has_item?).with(:vegan).and_return(true)
    allow(items).to receive(:has_item?).with(:hawaiian).and_return(true)

    allow(items).to receive(:price).with(:bbq_chicken).and_return(12.99)
    allow(items).to receive(:price).with(:vegan).and_return(14.99)
    allow(items).to receive(:price).with(:hawaiian).and_return(18.99)
  end

  # Create the items list for use in tests, dont
  # want the Order class to depend on menuitems it for tests
  # we will test that class in a seperate file
  let(:items) { instance_double("MenuItems")}

  let(:customer_order) do
    {
        bbq_chicken: 3,
        vegan: 2,
        hawaiian: 3
    }
  end

  # END CREATED FAKES LIST

  describe "#add" do
    context "it totals up the cost" do
      it "places an order X amount of times " do
        order.add(:bbq_chicken, 3)
        order.add(:vegan, 2)
        order.add(:hawaiian, 3)
        expect(order.order).to eq(customer_order)
      end

      it "rejects items not in stock" do
        allow(items).to receive(:has_item?).with(:meat_feast).and_return(false)
        expect { order.add(:meat_feast, 1) }.to raise_error "Sorry meat_feast is out of stock"
      end
    end
  end

  describe "#basket" do
    context "it calls calculate_basket creates a key/value hash and returns the total" do
      it "returns the baskets total" do
        order.add(:bbq_chicken, 3)
        order.add(:vegan, 2)
        order.add(:hawaiian, 3)
        total = 125.92
        expect(order.basket).to eq(total)
      end
    end
  end
end
