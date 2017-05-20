require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'shows a menu of dishes with prices' do
    expect(menu.pizza_dishes).to eq({ :margherita => 9.50,
                                :fiorentina => 11.95,
                                :rustica => 11.95,
                                :diavolo => 12.45
                              })
  end

  it 'should show the full menu by default' do
    expect(menu.view_menu).to include(:pizza_dishes)
  end

end
