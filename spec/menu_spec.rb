require 'menu'

describe Menu do

  subject(:menu) {Menu.new}

  context "creating a new instance of menu" do

     it "returns hash of menu with prices" do
       expect(menu).to respond_to(:see_menu)
     end

   end


 end
