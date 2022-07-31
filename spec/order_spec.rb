require 'order'
describe Order do 

  describe '#initialize' do

    it "it initializes with an empty order" do
      expect(subject.order).to be_empty
    end

    it "customer can add items to their order" do
      subject.add_item("Corn ribs") 
      expect(subject.order).to eq(["Corn ribs"])
    end 

  end 
end 
