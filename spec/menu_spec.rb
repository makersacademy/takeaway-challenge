require 'menu'

describe Menu do

  subject(:menu) {described_class.new(items)}
  let(:order) {double :order}
  let(:items) do    {
          "wild boar sandwich": 8,
          "venison": 8,
          "beef": 8,
          "pulled pork": 8,
          "crab salad": 8,
          "platter": 7
        }
  end

  it 'shows a list of dishes with prices' do
      expect(menu.items).to eq items
  end

  it 'allows selection of menu items' do
    expect(menu.has_item?(:venison)).to be true
  end

it "knows the price of items" do
  expect(menu.price(:venison)).to eq(items[:venison])
end

end
