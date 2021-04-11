require 'menu'

describe Menu do

  it 'lists the dishes and their prices' do
    expect(subject.menu).to have_key(:Biltong)
    expect(subject.menu).to have_value(5)
  end

  it 'passes through the method on_menu?' do
    expect(subject.on_menu?("Bunnychow")).to eq false
  end

  it 'gets the name and price of one item' do
    expect(subject.cost("Biltong")).to eq 5
  end

end
