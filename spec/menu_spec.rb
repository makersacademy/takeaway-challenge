require 'menu'

describe Menu do

  it 'should have a list of dishes with prices' do
    dishes = Menu.new
    expect(dishes.menu).to include ({"Beans on Toast" => 4.99})
  end

end