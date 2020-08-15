require "menu"

describe Menu do
   it "create list with stored hashes as menu" do 
      subject.menu << {"pizza" => 12}
      expect(subject.menu[-1].values).to eq [12]
   end

   describe "#find_in_menu" do 
      it "Search for item in the menu and return hash" do 
      expect(subject.find_in_menu("pasta").is_a?(Hash)).to be true
      end
   end

   describe "#get_price" do 
      it "Returns the name of single dish" do 
         expect(subject.get_price("salad").is_a?(Integer)).to be true
      end

      it "Give error if the dish is not in the menu" do 
         expect { subject.get_price("banana") }.to raise_error "Sorry we don't have that this please check your order"
      end

   end

end