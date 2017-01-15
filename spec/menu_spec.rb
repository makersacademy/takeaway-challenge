require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe "#add_to_menu" do

    it {is_expected.to respond_to(:add_to_menu).with(2).arguments}

    it "adds the given arguments to @items" do
      menu.add_to_menu("Cheese Pizza", 5.99)
      expect(menu.items).to include({"Cheese Pizza" => 5.99})
    end
  end

  describe "#view_menu" do

    it { is_expected.to respond_to(:view_menu)}
    it "is expected to return a list containing the available dishes and the price" do
      menu.add_to_menu("Cheese Pizza", 5.99)
      expect(menu.view_menu).to include ({"Cheese Pizza" => 5.99})
    end
  end

end
