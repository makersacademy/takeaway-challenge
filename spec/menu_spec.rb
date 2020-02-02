require 'menu'

describe Menu do

  it 'prints the menu' do
    expect(subject.print_menu).to eq([["chocolate", 0.5], ["rasperries", 0.25], ["ice_cream", 3.72]])
  end

end