require 'menu'

RSpec.describe Menu do

  subject(:menu) { described_class.new }
  let(:mochi_list) { ["DAIFUKU, £2", "ICHIGO, £3",] }

  it 'has a list of priced dishes' do
    expect(menu.dishes).not_to be_empty
  end

  it 'lists dishes with their price' do
    expect(menu.print_menu).to eq(mochi_list)
  end
end
