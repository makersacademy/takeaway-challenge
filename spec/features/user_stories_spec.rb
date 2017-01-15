describe "User stories" do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it "so customers can view dishes, displays a menu showing available dishes and prices" do
  takeaway = TakeAway.new
  menu = Menu.new
  expect{ menu.view_menu }.not_to raise_error
  end
end
