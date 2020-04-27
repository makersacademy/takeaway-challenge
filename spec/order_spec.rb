require './lib/order'
require "./lib/menu"
require "./lib/user"

describe Order do

  let(:configured) { "order" }
  let(:quantity) { 1 }

  
  describe "#add_item" do
    it "adds an to empty hash" do 
      subject.add_item(configured, quantity)
      expect(subject.current_items).to eq("order" => 1)
    end

    it "adds another quantity to key" do 
      subject.add_item(configured, quantity)
      subject.add_item(configured, quantity)
      expect(subject.current_items).to eq("order" => 2)
    end
  end 

  describe "#basket_summary" do
    it"responds to baskey_summary" do 
      expect(subject).to respond_to(:basket_summary)
    end 

    it "adds the hash arrays up and assigns value " do 
      subject.add_item("tofu curry", 5)
      subject.add_item("tofu curry", 6)
      
      expect(subject.basket_summary).to eq("tofu curry, x11, £61.6")
    end 
  end 
end