require 'menu'
describe Menu do

  describe "#list" do
    it "displays a list of dishes with price" do
      menu = Menu.new
      expect(menu).to respond_to(:list)
    end
  end
end
