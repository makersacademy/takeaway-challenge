require './lib/order'

describe Order do

  let(:item) { double :order }
  let(:quantity) { double :order }

  
  describe "#add_item" do
    it "adds an to empty hash" do 
      subject.add_item(item, quantity)
      expect(subject.current_items).to eq(:item => quantity)
    end
  end 
end