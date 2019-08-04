
require './lib/menu.rb'

describe Menu do
  let(:menu) { described_class.new }
  it 'Should have a list of dishes and prices' do
    expect(menu.menu_list).to eq ({ 'pepperoni' => 10,
                                    'hawaiian' => 12,
                                    'meat feast' => 15,
                                    'vegetarian' => 9,
                                    'spicy sausage' => 11,
                                    'awesome sauce' => 0.59 })
  end
end
