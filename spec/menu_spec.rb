require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { {name: "Lasagna", price: 8} }

  it 'prints dishes' do
    expect(menu.print_dishes).to include dish
  end
end