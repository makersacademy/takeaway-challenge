require 'user_menu'

describe UserMenu do
  it 'shows options to customer' do
    expect(subject.options).to include "1. Show Menu"
  end
  
  describe '#menu options' do

    it 'returns option 1' do
      expect(subject.process_menu_selection("1")).to eq "menushown"
    end

    it 'returns option 3' do
      expect(subject.process_menu_selection("3")).to eq "option3"
    end

    it 'returns option 4' do
      expect(subject.process_menu_selection("4")).to eq "totalprinted"
    end

    it 'returns option 5' do
      expect(subject.process_menu_selection("5")).to eq "You haven't ordered anything"
    end

    it 'returns error when something wrong is put in' do
      expect(subject.process_menu_selection("J")).to eq "\nPlease select an option 1 - 5"
    end

  end

end
