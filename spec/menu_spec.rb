require 'menu'

describe Menu do

it 'returns a list of menu items' do
  expect(subject.print_menu).to(be_a(Hash))
end
end
