require "menu"

describe Menu do
  # subject(:menu) { described_class.new }

  describe "#check" do
    it "should give a break down of a menu" do
      menu = Menu.new
      expect(menu.check).to eq( {"dish one" => 10, "dish two" => 10} )
    end
  end
end
