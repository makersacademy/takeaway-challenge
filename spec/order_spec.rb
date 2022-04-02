require 'order'

describe Order do

  describe "#add_to_order" do
    it 'should be able to add items to an order' do
      subject.add_to_order(1,1)
      expect(subject.order).to eq("Fried Rice x1")
    end
  end

  describe "#place_order" do
    it 'should be able to place a order of items from the menu' do
      subject.add_to_order(1,1)
      expect(subject.place_order).to include(subject.order)
    end
  end

  describe "#receipt" do
    it 'should give a receipt after a order has been placed' do
      subject.add_to_order(1,1)
      subject.place_order
      expect { subject.receipt }.to output(" ").to_stdout
    end
  end
end
