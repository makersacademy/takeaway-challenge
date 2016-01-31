require 'menu'

RSpec.describe Menu do

  subject(:menu)  {described_class.new}

  it {is_expected.to respond_to(:show_menu)}

  it 'lists the items if show_menu is called' do
    expect(menu.show_menu).to eq ({"chicken" =>3,
    "rice" =>1,
    "pizza" =>6,
    "chips" =>2 })
  end


  it {is_expected.to respond_to(:price_of).with(1)}

  it 'returns the price of the dish in input' do
    expect(menu.price_of("rice")).to eq (1)
    expect(menu.price_of("pizza")).to eq (6)
    expect(menu.price_of("chips")).to eq (2)
    expect(menu.price_of("chicken")).to eq (3)
  end

end