require 'menu'

describe Menu do
  subject(:menu){described_class.new}

  describe '#show_menu' do
   it {is_expected.to respond_to(:show_menu)}

   it 'returns list' do
    expect(menu.show_menu).to be_a Hash
   end
  end
end