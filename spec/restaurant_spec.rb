require 'restaurant'

describe Restaurant do
  subject(:restaurant) { Restaurant.new(menu) }
  let(:menu) { { fish: "£13", chips: "£2.50" } }

  it 'has a list of dishes and their prices' do
    expect(restaurant.menu).to eq(menu)
  end

  it 'shows menu' do
    allow(restaurant.menu).to receive(:each)
    expect { restaurant.show_menu.to output(restaurant.menu).to_stdout }
  end
end
