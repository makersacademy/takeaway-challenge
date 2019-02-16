require 'menu'
describe Menu do
  it 'gets created with an empty list of dishes' do
    menu = Menu.new
    expect(menu.instance_variable_get(:@dishes)).to eq []
  end
end
