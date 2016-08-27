require 'menu'

describe Menu do

  it 'prints out a list of available items' do
    expect(subject.print_list).to include("miso soup" => 3.50)
  end

  it 'returns price for selected item' do
    expect(subject.get_item("miso soup")).to eq(3.50)
  end

  it 'reads a csv file with a menu' do
    subject.load_list('menu.csv')
    expect(subject.print_list).to include("miso soup" => 3.50)
  end

end
