require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:menu_order)  { menu.order('spring rolls', 2) }

  it { is_expected.to respond_to(:see_dishes) }
  describe '#see_dishes' do
    it 'shows available dishes' do
      expect(menu.see_dishes).to eq({spring_rolls: 3.99 , crispy_duck: 11.95, chop_suey: 10.95, fried_rice: 4.99})
    end
  end

  describe '#order' do
    it { is_expected.to respond_to(:order).with(2).arguments }
    it 'shows items added to basket' do
      expect(menu_order).to eq('added to basket: spring rolls x2')
    end

    xit "adds to basket" do
    end
    
  end
end
