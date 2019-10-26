require 'menu'

describe Menu do
    subject(:menu) { described_class.new(items) }
    let(:items) do
      {
        katsu_curry: 10.00,
        ramen: 12.00
      }
    end

it 'shows a list of dishes and their prices' do
    expect(menu.items).to eq(items)
  end
  it 'lists all items and their prices' do
    listed_menu = "Katsu_curry £10.00, Ramen £12.00"
    expect(menu.list).to eq(listed_menu)
  end
end
