describe "Feature Test" do

before(:all) do
  @dishes1 = Dishes.new
  @dishes1.add_dish("Pasta",3,true)
  @dishes1.add_dish("Pizza",6,true)
  @dishes1.add_dish("Fish and Chips", 4,false)
  @menu = Menu.new
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

  context "I would like to be able to select some number of several available dishes" do
    it "available dishes to be shown" do
      expect(@menu.output_dishes(@dishes1)).to eq ["Pasta - £3", "Pizza - £6"]
    end

    it "selected dishes to be shown" do
      expect(@menu.select_dish(@dishes1,1)).to eq([{:name => "Pasta", :price => 3, :availability => true}])
    end

    it "convert selected dishes to price" do
      
      expect(@menu.convert_selected_dishes_to_price).to eq [:price => 3]
    end
  end

end
