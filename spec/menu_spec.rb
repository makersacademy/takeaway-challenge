require 'menu'

describe Menu do
  dishes = { "Cod" => 4, "Sausage" => 3, "Chips" => 2 }
  let(:menu) { described_class.new }

  before do
    menu.add dishes
  end

  it 'has dishes' do
    menu.add dishes
    expect(menu.items.keys).not_to be_empty
  end

  it 'dishes have prices' do
    expect(menu.items.values).not_to be_empty
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
