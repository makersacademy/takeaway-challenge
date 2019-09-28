require 'order_list'

describe OrderList do

  let(:item) { double :item }

  describe "#initialize" do
    it "initializes with an empty list to store user order" do
      expect(subject.order_list).to be_empty
    end
  end

  describe "#add_to_order" do
    it "adds selected item and quantity to order_list" do
      subject.add_to_hash(item, 4)
      expect(subject.order_list).to include({ item => 4 })
    end
  end

  # describe "#order_summary" do
  #
  #   let(:summary) { ("2 x calzone = 25.0""\n""2 x diavola = 21.0")}
  #   it "returns a string of 'quantity x dish = total item price'" do
  #     subject.add_to_hash('calzone', 2)
  #     subject.add_to_hash('diavola', 2)
  #     expect(subject.order_summary).to eq summary
  #   end
  # end

  describe "#order_total" do
    it "returns total price of order" do
      subject.add_to_hash('calzone', 3)
      subject.add_to_hash('diavola', 2)
      expect(subject.total).to eq 58.50
    end
  end
end

  # describe "#order_list_summary"
  #   it "return string of order list" do
  #
