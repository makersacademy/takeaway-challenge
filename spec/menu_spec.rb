require 'menu'

describe Menu do
  subject(:menu){described_class.new}

  it 'is created with a list of dishes' do
    expect(menu.view_menu).not_to be_empty
  end

end
