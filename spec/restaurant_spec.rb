require 'restaurant'

describe Restaurant do
  let(:restaurant){described_class.new}
  let(:menu){double :menu}
it 'should return a list of the menu' do
  expect(restaurant.list(menu)).to eq (menu)

end


end
