require 'menu'

describe Menu do

  before do
    @filepath = '/Users/malinnaleach/Programs/takeaway-challenge/lib/test.csv'
  end

  subject(:menu) { described_class.new(@filepath)}

  it 'should load dishes from a CSV' do
    expect(menu.dishes[0].name).to eq "Margherita"
  end

  it 'should load the correct number of dishes' do
    count = open(menu.filepath).readlines.size
    expect(menu.dishes.length).to eq count
  end

end
