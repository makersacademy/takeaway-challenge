require 'menu'

describe Menu do
  subject(:menu) { described_class.new(list) }
  let(:list) do { Kebap: 1.00,
                  Breakfast: 1.00,
                  Pizza: 1.00 }  end
  let(:user_list) { "Kebap: £1.0 Breakfast: £1.0 Pizza: £1.0" }

  it 'show initialized list' do
    expect(menu.list).to eq list
    p list[0]
  end

  it 'generates list for user' do
    expect(menu.generator).to eq user_list
  end

end
