require 'menu'

describe Menu do

  subject(:menu) {described_class.new}
  # let(:menu).receive(add, :tortellini, 3)

    it 'has meals' do
      expect(menu.dishes).to_not be_empty
    end
    it 'add new meal' do
      expect{menu.add(:margherita, 13)}.to change{menu.dishes.length}.by(1)
    end
    it 'has a list of dishes' do
      expect(menu.show_menu).to include :pizza
    end

end
