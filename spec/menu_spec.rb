require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe "#initialize" do
    it "holds an array of hashes with separate menu items" do
      expect(menu.menu_list).to eq([{item: "Chicken Katsu Curry", price: 8},
                                    {item: "Teriyaki chikenraisu", price: 7.5}])
    end
  end

end
