require 'user_menu'

describe UserMenu do
  it 'shows options to customer' do
    expect(subject.print_options).to include "1. Show Menu"
  end

  it 'returns the correct option' do
    expect(subject.process_menu_selection(1)).to eq "Showing Menu"
  end

end
