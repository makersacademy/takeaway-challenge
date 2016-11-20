describe "Feature Test" do

before(:all) do
  @dishes1 = Dishes.new
  @dishes1.add_dish("Curry",3,true)
  @dishes1.add_dish("Steak & Chips",25,true)
  @dishes1.add_dish("Chicken Dippers", 4,false)
  @menu = Menu.new
end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

   context "I would like to see a list of dishes with prices" do
     it "expects all dishes to be shown" do
       expect(@dishes1.all_dishes).to eq [{"Pizza" => 5},
       {"Pasta" => 3},
       {"Macaroni and Cheese" => 2},
       {"Curry" => 3},{"Steak & Chips" => 25},
       {"Chicken Dippers" => 4}]
     end
   end



# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  #
  # context "I would like to be able to select some number of several available dishes" do
  #   it "available dishes to be shown" do
  #     expect(@menu.print_menu(@dishes1)).to eq ["Pizza - £5", "Pasta - £3", "Curry - £3", "Steak & Chips - £25"]
  #   end
  #
  #   xit "selected dishes to be shown" do
  #     expect(@menu.select_dish(@dishes1,1)).to eq([{:name => "Pasta", :price => 3, :availability => true}])
  #   end
  #
  #  xit "convert selected dishes to price" do
  #
  #     expect(@menu.convert_selected_dishes_to_price).to eq [:price => 3]
  #   end
  # end

end
