require 'order'

describe Order do
  let(:dishlist) { [{:dish=>:v, :price=>4},
                      {:dish=>:v, :price=>3}] }
  subject(:order) { described_class.new(dishlist) }

  describe "#initialize" do
    it "has an empty array of ordered dishes at initialization" do
      expect(order.basket).to eq []
    end

    it "initializes with sum total equaling to 0" do
      expect(order.total).to eq 0
    end
  end

  describe "#add" do

    it "Raises error if dish not on the menu" do
      message = "Cannot add. No such dish on the menu."
      expect {order.add(3, 1)}.to raise_error(NoItemError, message)
    end

    it "Calculates the price" do
      expect(order.add(1, 2)).to eq 8
    end

    it "Updates total by calculated price" do
      order.add(1, 2)
      order.add(2, 2)
      expect(order.total).to eq 14
    end

    it "Adds ordered dish and price to the array" do
      array = [{ :dish=>:v, :price=>4, :quantity=>3, :total=>12 }]
      expect { order.add(1, 3) }.to change { order.basket }.by(array)
    end
  end

  context "order summary" do
    it "shows formatted order summary" do
      order.add(1, 3)
      table = "                        YOUR ORDER:                         \n\n1. v  £4 x 3                                           = £12\n                                                 TOTAL:  £12\n\n"
      expect(order.format_order).to eq(table)
    end


    it "lets user check if total sum correct" do
      order.add(1, 3)
      order.add(2, 4)
      expect(order.correct?).to be true
    end

    it "can check if empty" do
      expect(order.empty?).to eq true
    end
  end
  describe "#remove" do
    it "removes unwanted dishes from the order" do
      order.add(1, 3)
      order.remove_items(1)
      expect(order.basket).to eq ([])
    end

    it "raises error if no such dish in order" do
      message = "Cannot remove. No such dish in your order."
      expect { order.remove_items(1) }.to raise_error(NoItemError, message)
    end
  end
end
