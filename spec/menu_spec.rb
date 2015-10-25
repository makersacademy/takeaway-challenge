require 'menu'

describe Menu do
  let(:menu_1)  { {icecream: 5,
                   dohnuts: 2,
                   potatoes: 1} }
  let(:menu_2)  { {depsair: true} }
  let(:subject2) { Menu.new(menu_2)}

  it 'has a default menu' do
    expect(subject.menu_list).to eq menu_1
  end

  it 'allows a new menu to be input' do
    expect(subject2.menu_list).to eq menu_2
  end

  it 'returns the price of a menu item' do
    expect(subject.price('icecream')).to eq 5
  end

end
