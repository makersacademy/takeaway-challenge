require 'order'

describe Order do

  before do
    @menu = Menu.new
  end

  it 'should return the menu' do
    expect(subject.read_menu).to eq(@menu.menu)
  end

end
