require 'order'

describe Order do

  let(:order) { described_class.new }

  describe '#add' do
    it "adds to order" do
      order.add("pizza", 2)
      expect(order.basket).to eq({ "pizza" => 2 })
    end
  end

  describe '#summary' do
    it "pretty prints order summary" do
      order.add("pizza", 2)
      expect { order.summary }.to output("2x pizza(s) - £20\n").to_stdout
    end
  end

  describe '#total' do
    it "calculates order total" do
      order.add("pizza", 2)
      expect(order.total).to eq 20
    end
  end
end
