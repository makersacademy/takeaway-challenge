# # As a customer
# # So that I can check if I want to order something
# # I would like to see a list of dishes with prices
# ####################
# describe "User stories" do
#   it "can show the menu" do
#     restaurant = Restaurant.new
#     expect { restaurant.show_menu }.not_to raise_error
#   end
  
#   it "has a menu" do
#     restaurant = Restaurant.new
#     expect {restaurant.menu}.not_to raise_error
#   end

#   describe "#show_menu" do
#     it "shows menu" do
#       restaurant = Restaurant.new
#       expect(restaurant.show_menu).to be_kind_of(Hash)
#     end
#   end

# # As a customer
# # So that I can order the meal I want
# # I would like to be able to select some number of several available dishes
# ####################
#   it "allows the customer to select dishes" do
#     restaurant = Restaurant.new
#     expect {restaurant.select_items }.not_to raise_error
#   end
  
#   it "allows customer to order dishes" do
#     selection = CustomerSelection.new
#     selection.select
#     expect{selection.selection}.not_to raise_error
#   end
  
#   it "prints order" do
#     selection = CustomerSelection.new
#     selection.select
#     expect(selection.print_order).to be_kind_of(Hash)
#   end
# end

# # As a customer
# # So that I can verify that my order is correct
# # I would like to check that the total I have been given matches the sum of the various dishes in my order