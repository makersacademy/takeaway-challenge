require 'menu'

describe Menu do

it 'creates an instance of Menu' do
  menu = Menu.new
  expect(menu).to be_an_instance_of(Menu)
end

end
