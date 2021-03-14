require './lib/takeaway'

describe Takeaway do

  describe 'takeaway_menu' do
    it 'prints a default list of dishes with prices' do
      takeaway_menu = { quesidilla: 5,
                        burrito: 7,
                        taco: 3,
                        churros: 2 }
      expect(Takeaway::TAKEAWAY_MENU).to eq takeaway_menu
    end
  end

  describe '#list_menu' do
    it 'prints list of dishes and their prices' do
      expect(subject.list_menu).to include Takeaway::TAKEAWAY_MENU
    end
  end
end
