require 'simplecov'
SimpleCov.start
require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  it 'should have dishes in an array' do
    expect(menu.dishes).to eq []
  end

  it 'should display a list of dishes' do
    expect(menu.display_dishes).to eq []
  end

end