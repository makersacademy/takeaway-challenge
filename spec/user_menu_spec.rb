require 'user_menu'

describe UserMenu do
  it 'shows options to customer' do
    expect(subject.options).to include "1. Show Menu"
  end

  describe '#menu options' do
    it 'returns the option 1' do
      #expect(subject.process_menu_selection("1")).to eq "Showing Menu"
    end
  end

end
