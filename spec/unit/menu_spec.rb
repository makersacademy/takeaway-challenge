require 'menu'

RSpec.describe Menu do
  let(:menu_file) { 'menu.csv' }
  let(:new_menu) { described_class.new(menu_file) }

  it 'prints the menu in a nice format' do
    expect(new_menu.list).to eq "item                price\nVegetable pie       2\nLamb pie            3\nSteak pie           3\nKangaroo pie        4\nDog pie             1\nMonkey pie          5\nWhale pie           6\n"
  end

  it 'returns price of a dish' do
    expect(new_menu.price?('Monkey pie')).to eq 5
  end

end
