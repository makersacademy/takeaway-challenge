require 'menu'

describe Menu do

  it 'creates a new instance of menu' do
    expect(subject).to be_instance_of Menu
  end

  it 'provides a list of dishes and drinks' do
    expect(subject.menu).to include(
      'Salmon Poke Bowl' => 8,
      'Tuna Poke Bowl' => 8,
      'Tofu Poke Bowl' => 8,
      'Chicken Poke Bowl' => 8,

      'Blue Hawaii Cocktail' => 7,
      'Mai Tai Cocktail' => 7,
      'Hawaiian Margarita Cocktail' => 7,
      'Mango Martini Cocktail' => 7)
  end
end
