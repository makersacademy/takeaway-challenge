require './lib/menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  context '#show_menu' do
    it "Should display the items of the menu" do
      expect(menu.show_menu.length).to eq 4
    end
  end

end
