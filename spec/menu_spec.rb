require 'menu'

describe Menu do

  subject(:menu) { described_class.new('/Users/malinnaleach/Programs/takeaway-challenge/lib/test.csv')}

  it 'should load dishes from a CSV' do
    expect(menu.dishes[0].name).to eq "Margherita"
  end

  it 'should load the correct number of dishes' do
    count = open(menu.filepath).readlines.size
    expect(menu.dishes.length).to eq count
  end

end
