require 'shop'

describe Shop do

  it 'has a menu with all dishes available' do
    expect(subject.menu).not_to be_empty
  end

  describe 'show_menu' do

    it 'can shows the menu' do
      expect(subject.show_menu).to eq subject.menu
    end

  end

end