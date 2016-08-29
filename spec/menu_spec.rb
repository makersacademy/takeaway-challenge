require 'menu'

describe Menu do
  let(:menu){described_class.new}


  it {is_expected.to respond_to :items}

  it 'should include certain menu items' do
    expect(menu.items).to include("boquerones", "tortilla espanola")
  end
  
  it 'should include item with corresponding prices' do
    expect(menu.items).to include("boquerones" => 5)
  end

  it 'should return the price of an item' do
    expect(menu.price("boquerones")).to eq (5)
  end

end
