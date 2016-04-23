require 'menu.rb'
describe Menu do
  subject(:menu) { described_class.new }

   it 'has some dishes stored' do
    expect(menu.dishes).not_to be_empty
  end

  it 'contains string' do
  expect(menu.dishes.last).to include(String)
  end

  it 'contains float' do
    expect(menu.dishes.last).to include(Float)
  end



end