require 'menu'

describe Menu do
  subject(:menu) { described_class.new}
  #it { is_expected.to respond_to(:display_menu) }

  describe '#display_menu' do
    it "displays the menu" do
      allow(menu).to receive(:load_menu) {{"dish"=>"price"}}
      expect(menu.display_menu).to eq({"dish"=>"price"})
    end
  end
end