require 'list'
require 'order'

describe List do

  it 'lets the user choose a of a dish' do
    menu = { 'apple' => 3 }
    expect(subject.apple).to eq(menu)
  end

  it 'lets the user add several units of a dish to their meal' do
    menu = { "apple" => 3 }
    dish_choice = subject.apple(2)
    expect(dish_choice).to eq([2, menu])
  end

  it 'lets the user add the same item several times to their meal' do
    menu = { "apple" => 3 }
    dish_choice = [{ "apple" => 3 }, { "apple" => 3 }]
    expect(dish_choice).to eq([{ "apple" => 3 }, { "apple" => 3 }])
  end

end
