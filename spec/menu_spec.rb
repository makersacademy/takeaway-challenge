require 'menu'

describe Menu do

  it 'should have a list of dishes with prices' do
    menu = Menu.new
    expect(menu.dishes).to include ({"Beans on Toast" => 4})
  end

end