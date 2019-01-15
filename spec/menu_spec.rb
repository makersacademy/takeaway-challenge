require 'menu'

describe Menu do

  subject(:menu) { described_class.new(@list) }

  before(:each) do
    @list = {korma: 4, jalfrezi: 6, pilau: 2, naan: 2.5}
  end

  it 'should show a list of items and prices' do
    expect(menu.list).to eq(@list)
  end



end