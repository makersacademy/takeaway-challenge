require 'menu'
describe Menu do

let(:menu) { described_class.new(meals) }
let(:meals) {{ Chicken_Tikka: 5.25,Lamb_Biryani: 9.50 }}

it 'has a list of meals with their prices' do
  expect(menu.meals).to eq meals
end

describe '#display' do
  it 'displays a list of meals with their prices' do
    expect(menu.display).to eq('Chicken_Tikka: 5.25, Lamb_Biryani: 9.5')
  end
end

describe '#price' do
  it 'calculates the price' do
    expect(menu.price('Chicken_Tikka')).to eq(meals['Chicken_Tikka'])
  end
end
end
