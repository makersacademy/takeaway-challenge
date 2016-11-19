require 'takeaway'

describe Takeaway do

  let( :menu ){ double :menu }

  it 'pulls a menu from the Menu class' do
    expect(subject.menu).to eq(menu.menu_list)
  end



end
