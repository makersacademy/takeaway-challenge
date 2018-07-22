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

    it "contains dish objects" do
      expect(menu.menu[0]).to be_an_instance_of(Dish)
    end
  end

  describe "#print_menu" do
    it "prints array" do
      expect{ menu.print_menu }.to output("meat ------ 10\n").to_stdout
    end  
  end 
end
