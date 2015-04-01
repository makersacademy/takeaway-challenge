require 'menu'

describe Menu do
  dish_1 = { 'Cod' => 4 }
  let(:menu) { described_class.new.add dish_1 }
  # menu.add dish_1

  it 'has dishes' do
    expect(menu.items.keys).not_to be nil
  end

  it 'dishes have prices' do
    expect(menu.items.values).not_to be nil
  end

  it 'can be displayed' do
    menu_expect = "Cod £4\nSausage £3\nChips £2\n"
    expect(menu.view).to eq menu_expect
  end

  it 'can have dishes added to it' do
    new_dish = { "Beans" => 2 }
    menu.add new_dish
    expect(menu.items.key?("Beans")).to be true
  end

  it 'can have dishes removed from it' do
    menu.remove "Cod"
    expect(menu.items.key?("Cod")).to be false
  end
end
