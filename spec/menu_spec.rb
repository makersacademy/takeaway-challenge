require 'menu'

describe Menu do
  
  let(:menu) { {fish: 6, chips: 2, sausage: 2.50, mushy_peas: 2} }

  it 'displays a menu when initiated' do
    expect(subject.menu).to include menu
  end

  describe '#show_menu' do
    it 'displays the menu' do
      expect(subject.show_menu).to include menu
    end
  end
end