require 'menu'

describe Menu do
  let(:data) {"item,price\nMiso Soup,3.50"}

  before [:each] do
    allow(File).to receive(:open).with("menu.csv", {:universal_newline=>false, :headers=>true}) {StringIO.new(data)}
    subject.load_list
  end
  it 'prints out a list of available items' do
    expect(subject.return_list).to include({"Miso Soup" => 3.50})
  end

  it 'returns price for selected item' do
    expect(subject.get_price("Miso Soup")).to eq(3.50)
  end

  it 'reads a csv file with a menu' do
    expect(subject.return_list).to include("Miso Soup" => 3.50)
  end

end
