require "menu"
describe Menu do
  subject(:menu) { Menu.new }
  
  describe "#add_dish" do
    it "respond to add_dish" do
      expect(menu).to respond_to(:add_dish).with(1).argument
    end
  end 
end
