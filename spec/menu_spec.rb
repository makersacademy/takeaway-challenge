require "menu"

RSpec.describe Menu do
  describe "view" do
    it "shows the restaurant's menu" do
      expect(self.view).to eq MENU
    end
  end
end
