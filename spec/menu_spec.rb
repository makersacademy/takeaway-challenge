require 'menu'

describe Menu do
  
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do
    {
      pak_tod: 4.90,
      satay_gai: 5.50,
      pad_thai: 7.90,
    }
  end

  it 'contains a list of dishes with their prices' do
    expect(menu.dishes).to eq(dishes)
  end

end