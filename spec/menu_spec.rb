require 'menu'

describe Menu do
  let(:some_dishes) {double:some_dishes}
  subject(:menu) {described_class.new(dishes: some_dishes)}

  it 'expected to shows menu items' do
    expect(menu).to respond_to :show_menu
  end

end
