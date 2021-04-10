require "order"

describe Order do
  #let(:menu) { [{ "Margherita pizza" => 9 }, { "Can of drink" => 1 }] }
  let(:subject) { Order.new({ "Margherita pizza" => 9 , "Can of drink" => 1 }) }

  describe "#order_list" do
    it "order_list is initally empty" do
      expect(subject.order_list).to be_empty
    end
  end

  describe "#add_to_order" do
    it "add to order adds 1 dish to order_list" do
      subject.add_to_order("Margherita pizza")
      expect(subject.order_list.last).to eq "Margherita pizza"
    end

    it "can add multiple of a dish to order_list" do
      subject.add_to_order("Margherita pizza", 2)
      expect(subject.order_list.last(2)).to eq ["Margherita pizza", "Margherita pizza"]
    end
  end

  describe "#total" do
    it "add to order adds price to total cost of order" do
      expect{ subject.add_to_order("Margherita pizza") }.to change{ subject.total }.by 9
    end
  end
end
