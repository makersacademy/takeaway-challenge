require 'menu.rb'
describe Menu do
  subject(:menu) { described_class.new(dishes: marg_pizza) }
  let(:marg_pizza) {double(:marg_pizza, name: 'Margherita', price: 6.00)}
  let(:pepp_pizza) {double(:pepp_pizza, name: 'Pepperoni', price: 6.50)}
  let(:list_dishes) do
    [marg_pizza].each do |dish|
       "#{dish.name}: £%0.2f" % [dish.price]
    end
  end


  it 'prints dishes and prices' do
    expect(menu.print).to eq(list_dishes)
  end

  it 'returns true if dish is on menu' do
    expect(menu.have_dish?(marg_pizza)).to eq true
  end

  it 'returns false if dish is not on menu' do
    expect(menu.have_dish?(:pizza)).to eq false
  end
end
