require 'printer'

RSpec.describe Printer do
  it 'returns formatted output when passed an array of hashes' do
    expect(described_class.prettify_menu([{ item: "Vegetable pie", price: 1 }])).to eq "Item name\t\tPrice\nVegetable pie\t\t1\n"
  end
end
