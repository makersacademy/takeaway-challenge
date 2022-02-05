require_relative '../lib/restaurant'

describe Restaurant do
    it 'shows the menu with prices' do 
      expect(subject.show_menu).to eq "Tiramisu: 3.65"
    end
end
