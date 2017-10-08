require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  it 'has a list of dishes' do
    expect(menu.dishes).not_to be_nil
  end
  it 'can show dishes' do
    expect(menu.show).to be_a String
  end
end
