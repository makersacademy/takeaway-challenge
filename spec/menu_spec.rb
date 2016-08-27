require 'menu'

describe Menu do
  before [:each] do
    subject.load_list('menu.csv')
  end
  it 'prints out a list of available items' do
    expect(subject.print_list).to include({"Miso Soup" => 3.50})
  end

  it 'returns price for selected item' do
    expect(subject.get_item("Miso Soup")).to eq(3.50)
  end

  it 'reads a csv file with a menu' do
    expect(subject.print_list).to include("Miso Soup" => 3.50)
  end

end
