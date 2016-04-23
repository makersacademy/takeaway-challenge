require 'menu'

describe Menu do
  let(:some_dishes) {double:some_dishes}
  subject(:menu) {described_class.new(dishes: some_dishes)}

  describe '#show_menu' do
    it 'expected to show list of dishes and prices' do
      expect(menu).to respond_to :show_menu
    end
  end
end
