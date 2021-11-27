require 'menu'

describe Menu do
  it 'stores the menu' do
  expect(subject.menu_list).not_to be_empty
  end
end