require 'menu'

RSpec.describe Menu do
  let(:menu_file) { 'menu.csv' }
  let(:new_menu) { described_class.new(menu_file) }

  it 'prints the menu in a nice format' do
    p new_menu.list
    expect(new_menu.list).to eq "Item name\t\tPrice\nVegetable pie\t\t2\nLamb pie\t\t3\nSteak pie\t\t3\nKangaroo pie\t\t4\nDoggy pie\t\t1\nMonkey pie\t\t5\nWhale pie\t\t6\n"
  end

  it 'returns price of a dish' do
    expect(new_menu.price?('Monkey pie')).to eq 5
  end

end
