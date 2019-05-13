require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'responds to view' do
    expect(menu).to respond_to(:view)
  end

  it 'prints a menu to the screen' do
    expect { menu.view }.to output(@menu_items).to_stdout
  end
end
