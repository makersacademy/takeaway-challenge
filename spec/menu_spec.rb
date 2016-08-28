require 'menu'

describe Menu do
  let(:CSV) {double :CSV}
  subject(:menu) {described_class.new}

  describe "#get_menu" do
    it "returns a copy of the original menu" do
      menu_copy = menu.menu
      expect(menu.instance_variable_get(:@menu_content)).to eq menu_copy
    end
  end
end
