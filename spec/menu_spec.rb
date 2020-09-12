require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  it 'has a list of dishes' do
    expect(menu.dishes).to be_an_instance_of(Array)
  end
end