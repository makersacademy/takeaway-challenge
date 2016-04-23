require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'expected to shows menu items' do
    expect(menu).to respond_to :show_menu
  end

end
