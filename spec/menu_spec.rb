require 'menu'

describe Menu do

  describe '#display_menu method' do
    it 'responds to #display_menu' do
      expect(subject).to respond_to(:display_menu)
    end
    it 'should print out menu' do
      expect(subject.display_menu).to eq Menu::TAKEAWAY_MENU
    end
  end
end
