require 'menu'

describe Menu do

  let(:dishes) { Menu.new }

  it 'should have a list of dishes with prices' do
    expect(dishes.menu).to include ({"Beans on Toast" => 4})
  end

end