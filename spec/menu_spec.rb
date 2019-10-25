require 'menu'

describe Menu do
  it 'creates an instance of Menu' do
    expect(subject).to be_an_instance_of Menu
  end

  it 'creats a hash with menu items and their prices' do
    expect(subject.menu_items).not_to be_empty
  end
end