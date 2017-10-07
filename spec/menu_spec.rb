require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'shows the dishes available to order' do
    expect(menu.view_menu).to include "pepperoni"
  end
end
