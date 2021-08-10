require "takeaway"
require "menu"
require "order"

describe Menu do
  describe "#dish_list" do
    it "initializes with an array of items as instance variable" do
      expect(subject.dish_list).to be_instance_of(Array)
    end

    it "initializes with an array that contains hashes" do
      expect(subject.dish_list[0]).to be_instance_of(Hash)
    end
    
    it "displays the list of dishes " do
      expect(subject.dish_list).to eql [{dish: "Margarita", price: 5},{dish: "Veggie", price: 6},{dish: "Hawaiian", price: 7},{dish: "Pepperoni", price: 8},{dish: "Calzone", price: 9}]
    end

    it "displays prices" do
      expect(subject.dish_list[2][:price]).to eql 7
    end  
  end
end  
