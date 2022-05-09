require 'menu'
describe Menu do
  subject(:menu) { Menu.new(dishes)}
  let(:dishes) do 
      { Sushi: 12.99, Pizza: 16.00, Curry: 8.50 }
  end
     it "should take a hash of dishes and their corresponding prices as an argument upon new instance" do
       puts dishes
       expect(menu.dishes).to be_an_instance_of(Hash)
     end
     it "should have a list of dishes and their prices when passed dishes upon initialization" do
         expect(menu.dishes).to eq(dishes)
     end
    describe "#print" do
      it "should print the dishes and their prices" do
          expect(menu.print).to eq("Sushi: £12.99, Pizza: £16.00, Curry: £8.50")
      end
    end
end
    
