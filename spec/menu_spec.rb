require 'menu'

describe Menu do

  let(:menu) { described_class.new }

  context "menu_list" do
    let(:menu_list) { { :a => 6.95, :b => 8.95 } }
    it "provides a list of menu items and prices" do
      expect(menu.menu_list).to include( { :a => 6.95, :b => 8.95 } )
    end
  end

end
