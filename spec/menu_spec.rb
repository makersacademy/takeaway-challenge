require 'menu'

describe Menu do
  subject(:menu)          { described_class.new }
  let(:order)             { double :order, basket: {spring_rolls: 3.99} }
  let(:menu_make_order)   { menu.make_order('spring rolls', 2) }

  it { is_expected.to respond_to(:see_dishes) }
  describe '#see_dishes' do
    it 'shows available dishes' do
      expect(menu.see_dishes).to eq({spring_rolls: 3.99 , crispy_duck: 11.95, chop_suey: 10.95, fried_rice: 4.99})
    end
  end
end
