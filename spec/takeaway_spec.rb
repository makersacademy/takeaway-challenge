require 'takeaway.rb'

describe Takeaway do

  it 'allows customers to see the menu' do
    subject.menu
    expect(subject.menu).to eq Menu::TODAYS_MENU
  end

end
