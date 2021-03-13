require 'order'
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of 
# several available dishes
describe Order do 
    it "creates a new order" do 
        expect(subject.order).to eq([])
    end 
 

    describe "#add" do
        it "adds an item and price to the order" do 
            expect(subject.add("cheese")).to include(["cheese, 10"])
        end  
        it "adds more than one item to the order" do 
            subject.add("cheese")
            expect(subject.add("vegetarian")).to include(["cheese, 10", "vegetarian, 13"])
        end 

    end 
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given 
    # matches the sum of the various dishes in my order
    describe "# total" do 
        it "adds the total of all of the menu items" do 
            subject.add("cheese")
            subject.add("vegetarian")
            expect(subject.total).to eq("23")
        end 
    end 
end 