require 'order'

describe Order do
  let(:dishlist) { [{:dish=>:v, :price=>4},
                      {:dish=>:v, :price=>3}] }
  subject(:order) { described_class.new(dishlist) }

  context "initialization" do
    it "has an empty array of ordered dishes at initialization" do
      expect(order.ordered_dishes).to eq []
    end

    it "initializes with total equaling to 0" do
      expect(order.total).to eq 0
    end
  end

  context "adding dish and quantity to order" do

    it "Raises error if dish not on the menu" do
      message = "Cannot add. No such dish on the menu."
      expect {order.add(3, 1)}.to raise_error(message)
    end

    it "Calculates the price" do
      expect(order.add(1, 2)).to eq 8
    end

    it "Updates total by calculated price" do
      order.add(1, 2)
      expect(order.total).to eq 8
    end

    it "Adds ordered dish and price to the array" do
      array = [{ :dish=>:v, :price=>4, :quantity=>3, :total=>12 }]
      expect { order.add(1, 3) }.to change { order.ordered_dishes }.by(array)
    end
  end

  context "order summary" do
    it "shows formatted order summary" do
      order.add(1, 3)
      table = "                        YOUR ORDER:                         \n\n1. v  £4 x 3                                           = £12\n                                                 TOTAL:  £12\n\n"
      expect {order.show_order}.to output(table).to_stdout
    end


    it "lets user check if total sum correct" do
      order.add(1, 3)
      order.add(2, 4)
      expect(order.correct?).to be true
    end
  end
end
