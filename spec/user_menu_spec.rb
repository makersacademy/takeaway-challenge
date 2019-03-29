require 'user_menu'

describe UserMenu do
  it 'shows options to customer' do
    expect(subject.options).to include "1. Show Menu"
  end

end
