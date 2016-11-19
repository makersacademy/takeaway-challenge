describe "Feature Test" do

before(:all) do
  @dishes1 = Dishes.new
  @dishes1.add_dish("Pasta",3,true)
  @dishes1.add_dish("Pizza",6,true)
  @dishes1.add_dish("Fish and Chips", 4,false)
end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

   context "I would like to see a list of dishes with prices" do
     it "expects all dishes to be shown" do
       expect(@dishes1.all_dishes).to eq [{:name => "Pasta", :price => 3, :availability => true},{:name => "Pizza", :price => 6, :availability => true},{:name => "Fish and Chips", :price => 4,:availability => false}]
     end
   end



# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes





end
