require './lib/order'

describe Order do 
    it "responds to order" do
        expect(subject).to respond_to(:order)
    end 
    it "creates a new order" do 
        expect(subject.order).to eq([])
    end 
 
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of 
# several available dishes
    describe "#add" do 
        it "responds to add with one argument" do
            expect(subject).to respond_to(:add).with(1).argument
        end 
       it "adds a menu item to the list" do 
        expect(subject.add("cheese")).to eq([["cheese", 10]])
       end 
       it "adds several menu items to the list" do 
        subject.add("cheese")
        expect(subject.add("pepperoni")).to eq([["cheese", 10], ["pepperoni", 12]])
       end 
    end 
    # end 
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given 
    # matches the sum of the various dishes in my order
    describe "#order" do 
    it " prints the order and amonuts" do 
        subject.add("cheese")
        subject.add("vegetarian")
        expect(subject.order).to eq([["cheese", 10], 
        ["vegetarian", 13]])
        end 
    end 
    describe "# total" do 
        it "adds the total of all of the menu items" do 
            subject.add("cheese")
            subject.add("vegetarian")
            expect(subject.total).to eq(23)
        end 
    end 
    #As a customer
    #So that I am reassured that my order will be delivered on time
    #I would like to receive a text such as "Thank you! Your order 
    #was placed and will be delivered before 18:52" after I have ordered
    describe "# conrifm_order" do 
    it "confirms you've placed your order" do 
        expect(subject.confirm_order).to eq("Your order has been placed")
    end 
    end     
end 