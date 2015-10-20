require 'menu'

describe Menu do
  let(:klass) { Class.new { extend Menu } }

  it 'returns a hash when display_menu is called' do
    expect(klass.display_menu).to be_a Hash
  end

  it 'returns the dish price for a certain dish' do
    expect(klass.display_menu[:pepperoni_pizza]).to eq(5.00)
  end
end
