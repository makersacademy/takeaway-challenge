require 'menu'
describe Menu do
  subject(:menu) {described_class.new(dishes)}
  let(:dishes) do {:chicken => 3, :meatballs => 5.5} end
  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq dishes
  end

  it 'gives a list of dishes with prices' do
    expect(menu.list_menu).to eq "chicken: $3, meatballs: $5.5"
  end
end
