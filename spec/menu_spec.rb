require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes: dishes)}
  let(:dishes) { {menuitem1: 1, menuitem2: 1.5} }

  context '#show' do
    it 'readable format' do
      expect(menu.show).to eq "Menu\n\nmenuitem1: £1\nmenuitem2: £1.5"
    end
  end
end
