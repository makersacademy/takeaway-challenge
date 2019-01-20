require 'printer'

RSpec.describe Printer do
  it 'returns formatted output when passed an array of hashes' do
    expect(described_class.print_nicely([{ item: "Vegetable pie", price: 1 }])).to eq "item                price\nVegetable pie       1\n"
  end
end
