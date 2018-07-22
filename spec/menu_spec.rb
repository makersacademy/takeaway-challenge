require "menu"
describe Menu do
  subject(:menu) { Menu.new }

  describe "#initialize" do
    it "initializes with an empty array" do
      expect(menu.menu).to be_empty
    end
  end
  
  describe "#add_dish" do
    it "respond to add_dish" do
      expect(menu).to respond_to(:add_dish).with(1).argument
    end
  end 
end
