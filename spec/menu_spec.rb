require 'menu'

describe Menu do
  it 'stores menu items' do
    expect(subject).to respond_to(:menu_items)
  end
end
