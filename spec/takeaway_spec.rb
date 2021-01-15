require 'takeaway'

describe Takeaway do

  it 'shows the menu' do
    expect(subject.menu).to eq Takeaway::MENU 
  end
end
