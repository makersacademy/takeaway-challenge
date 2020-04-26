require './lib/order'

describe Order do

  let(:configured) { "order" }
  let(:quantity) { double :order }

  
  describe "#add_item" do
    it "adds an to empty hash" do 
      subject.add_item(configured, quantity)
      expect(subject.current_items).to eq(:order => [quantity])
    end

    it "adds another quantity to hash of arrays" do 
      subject.add_item(configured, quantity)
      subject.add_item(configured, quantity)
      expect(subject.current_items).to eq(:order => [quantity, quantity])
    end

  end 
end