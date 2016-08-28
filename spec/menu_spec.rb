require 'menu'

describe Menu do

  subject(:menu) {described_class.new(items)}
  let(:items) do    {
          "wild boar sandwich" => 8,
          "venison pie" => 8,
          "beef wellington" => 8,
          "pulled pork slider" => 8,
          "crab salad" => 8,
          "vegan platter" => 7
        }
  end

  it 'shows a list of dishes with prices' do
      expect(menu.items).to eq items
  end

end
