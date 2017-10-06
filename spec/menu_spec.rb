require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  it 'has a list of dishes' do
    expect(menu.show_dishes).to eq [item: :sushi, price: 7]
  end
end
