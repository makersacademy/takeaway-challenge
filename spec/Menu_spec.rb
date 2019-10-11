require 'Menu'
describe Menu do

  it 'returns a menu' do
   expect(subject.menuOutput).to eq subject.menuItems
  end
end
