require 'restaurant'

describe Restaurant do

  subject(:restaurant) {Restaurant.new}

  context "has menu in it" do

     it "returns hash of menu with prices" do
       expect(restaurant).to respond_to(:menu)
     end

   end


 end
