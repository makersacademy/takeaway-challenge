require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { {lasagna: 10, burger: 5} }

  it 'has a menu' do
    expect(dishes).to eq (dishes)
  end

  it 'shows the list of dishes' do
    dishes = "lasagna: 10, burger: 5"
    expect(menu.show_dishes).to eq(dishes)
  end

  it 'lets user add dish' do
    menu.add_dish('salad', 5)
    expect(menu.dishes).to have_key(:salad)
  end

end
