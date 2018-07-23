require "menu"
describe Menu do
  subject(:menu) { Menu.new }

  describe "#initialize" do
    it "creates an array of dishes" do
      expect(menu.menu).to be_an_instance_of(Array)
    end
  end

  describe "#menu" do
    it "contains objects when created" do
      expect(menu.menu).to_not be_empty
    end
  end

  describe "#print_menu" do
    it "prints array" do
      expect(menu.print_menu).to include({name: "prawns", price: 5})
    end  
  end 
end
