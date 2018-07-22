require "restaurant"
describe Restaurant do
  subject(:restaurant) { Restaurant.new }

  describe "#initialize" do
    it "creates a new menu object" do
      expect(subject.menu).to be_an_instance_of(Menu) 
    end
  end

  describe "#print_menu" do

    it "responds to print_menu" do
      expect(restaurant).to respond_to(:print_menu)
    end 

    it "returns a menu object" do
      expect(restaurant.print_menu).to be_an_instance_of(Menu)
    end 
  end 
end