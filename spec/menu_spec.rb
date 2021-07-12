require 'menu'

describe Menu do

  subject { described_class.new(dishes)}
  
  let(:dishes) do
    { 
      margherita_pizza: 10, 
      spicy_pizza: 11, 
      mushroom_pizza: 11
    }
  end

  it { is_expected.to respond_to(:display_menu) }

  it 'has a list of dishes' do
    expect(subject.dishes).to eq(dishes)
  end

  it 'displays a list of dishes and prices' do
    displayed_dishes = "margherita_pizza: £10, spicy_pizza: £11, mushroom_pizza: £11"
    expect(subject.display_menu).to eq(displayed_dishes)
    p subject.display_menu
  end
end