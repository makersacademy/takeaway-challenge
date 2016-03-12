require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it {is_expected.to respond_to :view}

  describe '#view' do
    it 'shows the contents of the menus' do
      expect(menu.view).to eq Menu::CONTENTS
    end
  end
end
