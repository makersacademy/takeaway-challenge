require 'menu'

describe Menu do
  it 'will have a menu of dishes and prices that can be read' do
    expect(subject.menu_items).to be_a(Hash)
  end
end