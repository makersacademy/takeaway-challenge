require './lib/menu'

describe Menu do

  it 'read menu' do
    menu = {fish_burger: 2.0,
            beef_burger: 4.0,
            chicken_burger: 4.0,
            vege_burger: 2.5}

    expect(subject.read_menu).to eq menu
  end

  it 'select some number of several available dishes from the menu' do
    hash = {}
    hash[:beef_burger] = 2
    expect(subject.add_order(:beef_burger, 2)).to eq hash
  end
end
