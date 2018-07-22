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

    # it "delegates printing of menu to menu class" do
    #   expect_any_instance_of
    # end 
  end 
end
