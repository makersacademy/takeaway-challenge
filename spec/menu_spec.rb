require 'menu'

describe Menu do
  it 'returns the menu' do
    expect(subject.get_menu).to eq({ tuna: 4, frog: 1, lamb: 2, pork: 3 })
  end

  it 'can add a menu item' do
    subject.add_menu("fish", 9)
    expect(subject.get_menu).to eq({:tuna=>4, :frog=>1, :lamb=>2, :pork=>3, :fish =>9})
  end

end
