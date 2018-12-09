require "menu.rb"

describe Menu do

  let(:menu) { Menu.new }

  it 'should load a default menu of dishes with prices' do
    expect(menu).to have_attributes(:list => menu.list)

  end
end
