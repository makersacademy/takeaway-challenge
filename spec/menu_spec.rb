require "menu"
describe Menu do
  describe ".initialize" do
    it "should create a new Menu instance with a dishes array" do
      menu = Menu.new
      expected_result = []
      expect(menu.dishes).to eq([])
    end
  end
end