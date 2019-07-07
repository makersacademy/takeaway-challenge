require 'menu'

describe Menu do
  # describe '#menu' do
  #   it 'Stores a list of items' do
  #     expect(subject.menu).to eq []
  #   end
  # end

  describe '#show_menu' do
    it 'Should display a list of food item' do
      subject.load_menu
      expect(subject.menu_loaded?).to eq false
    end
  end
end
