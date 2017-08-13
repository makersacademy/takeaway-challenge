require_relative '../lib/menu.rb'

describe Menu do

  it 'has one attribute' do
    menu1 = Menu.new("test")
    expect(menu1).to have_attributes(:list => "test")
  end

end
