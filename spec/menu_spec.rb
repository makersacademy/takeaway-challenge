require './lib/menu.rb'

describe Menu do
  context "#menu_view" do
    it "should display menu upon calling menu_view" do
      menu = {
       "Chicken" => 1.00,
       "Steak" => 1.50,
       "Bread" => 0.50,
       "Fish" => 2.00}
      expect(subject.menu_view).to eq menu
    end
  end
end