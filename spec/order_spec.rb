require 'order'

describe Order do
  subject(:order) { described_class.new }
  describe '#initialize' do

    it "it initializes with an empty order" do
      expect(subject.my_order).to be_empty
    end

  end

  describe '#add(dish)' do
  
    let(:dish) { "Rice" }

    it "selects an item from the menu" do
      order.add(dish)
      expect(order.add(dish)).to include("Rice")
    end

    it "adds dishes to my order" do
      order.add(dish)
      expect(order.my_order).not_to be_nil
    end

      # it 'raises an error' do 
      #   expect { order.add("Beef") }.to raise_error "Item is not on the menu"
      # end
  end
end