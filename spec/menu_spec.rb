require 'menu'

RSpec.describe Menu do

  let(:menu) { Menu.new }

  it 'should show the menu' do
    expect(menu.menu).to be_a Hash
  end
end
