require 'menu'

describe Menu do
subject(:menu) { described_class.new }
  describe "#viewmenu" do
    it "customer can view menu" do
      expect(menu.show_menu).to eq ({ "Chicken" => 5, "Lamb" => 8, "Chips" => 2 })
    end
  end

end