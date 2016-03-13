require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it {is_expected.to respond_to :view_contents}
  it {is_expected.to respond_to(:add_dish).with(2).arguments}

  describe '#view_contents' do
    a_menu = {
      'Meat Biriyani' => 8,
      'Ocotopus Vindaye' => 5,
      'Broad beans curry and dal pouri' => 5,
      'Rougaye eggs' => 6,
      'Gateau Pima' => 3,
      'Chicken noodles' => 7
    }

    it 'shows the contents of the menus' do
      expect(menu.view_contents).to eq a_menu
    end
  end

  describe '#add' do
    it 'to the contents' do
      menu.add_dish('Aubergine badja', 3)
      expect(menu.view_contents ).to include('Aubergine badja' => 3)
    end
  end

  describe '#contains?' do
    it 'returns true if dish is on menu' do
      expect(menu.contains?('Gateau Pima')).to be true
    end

    it 'returns false if dish is not on menu' do
      expect(menu.contains?('chips')).to be false
    end
  end
end
