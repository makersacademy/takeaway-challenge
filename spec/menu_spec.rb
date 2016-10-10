require 'menu'

describe Menu do

  subject(:menu) {described_class.new}

  describe '#initialize' do
    it 'creates emtpy menu for today' do
      expect(subject.todays_menu).to eq [{:pizza=>:Margherite, :price=>1.25}, {:pizza=>:Pepperoni, :price=>1.75}, {:pizza=>:Spicy, :price=>2.75}]
      end
  end
end
