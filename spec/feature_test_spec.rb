describe "Feature Test" do

before(:all) do
  @dishes1 = Dishes.new
  @dishes1.add_dish("Curry",3)
  @dishes1.add_dish("Steak & Chips",25)
  @dishes1.add_dish("Chicken Dippers", 4)
  dishes121 = @dishes1
  @menu = Menu.new(dishes121)
  menu121 = @menu
  @order = Order.new(menu121)
end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

   context "I would like to see a list of dishes with prices" do
     it "expects all dishes to be shown" do
       expect(@dishes1.all_dishes).to eq({"Pizza" => 5,
       "Pasta" => 3,
       "Macaroni and Cheese" => 2,
       "Curry" => 3,
       "Steak & Chips" => 25,
       "Chicken Dippers" => 4})
     end
   end



# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  context "I would like to be able to select some number of several available dishes" do
    it "expects store all valid dishes" do
      expect(@order.add_to_order("Curry")).to eq(["Curry",3])
    end
  end

end
