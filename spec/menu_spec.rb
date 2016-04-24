require 'menu'
describe Menu do
  subject(:menu) {described_class.new(list_of_dishes)}
  let(:list_of_dishes) do {:chicken => 3, :meatballs => 5.5} end
  it 'is formed by a list of dishes with prices' do
    expect(menu.list_of_dishes).to eq list_of_dishes
  end

  it 'provides a ordered list of dishes with prices' do
    expect(menu.list_menu).to eq "chicken: $3, meatballs: $5.5"
  end

  it 'checks if a dish is on the menu' do
    expect(menu).to be_has_dish
  end
end
