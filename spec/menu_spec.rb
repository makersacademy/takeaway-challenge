require 'menu'

describe Menu do

  let(:menu_list) {Menu::MENU_LIST}
  subject(:menu_class) {described_class.new}

    # it 'has menu' do
    #   expect(menu_class.menu).to eq menu_list
    # end

    it "has 14 items on the menu" do
      expect(menu_list.size).to eq(14)
    end
end
