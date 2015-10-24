require 'menu'

describe Menu do
  it 'should hold a list of dishes with prices' do
    menu = Menu.new
    menu.add_item('fries', 3.0)
    expect(menu.list).to include ({'fries' => '%.02f' % 3.0})
  end

end
