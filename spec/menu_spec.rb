require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'shows a menu of dishes with prices' do
    expect(menu.menu_items).to include(pizza: { :margherita => 9.50,
                                                :fiorentina => 11.95,
                                                :rustica => 11.95,
                                                :diavolo => 12.45
                                              })
  end

  it 'allows the user to view all menu items by default' do
    expect(menu.view_menu).to include(:pizza, :pasta)
  end

  let(:non_menu_item) { [:frogs_legs, 1000] }

  it 'checks whether an item is in the menu' do
    expect { menu.confirm_menu_item(non_menu_item) }.to raise_error 'Item not in menu!'
  end

end
