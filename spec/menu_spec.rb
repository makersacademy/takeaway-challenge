require 'menu'

describe Menu do
  
  let(:the_menu) { { fish: 6, chips: 2, sausage: 2.50, mushy_peas: 2 } }

  it 'has a menu when initiated' do
    expect(subject.menu).to include the_menu
  end

  describe '#show_menu' do
    it 'displays the menu' do
      expect(subject.show_menu).to include the_menu
    end
  end

  describe '#price' do
    it 'returns the price of a specific menu item' do
      expect(subject.price(:fish)).to eq 6
    end
  end
end
