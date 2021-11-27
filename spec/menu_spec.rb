require 'menu'

describe Menu do
  let(:dishes) { double :dishes }
  subject { described_class.new }

  describe '#show' do
    it 'shows a list of dishes' do
      expect(subject.show).to eq(subject.dishes)
    end

    specify 'dishes have a price' do
      dish = double("Fried Chicken", :price => 8)
      subject.dishes["Fried Chicken"] => 8
      expect(subject.show.last.price).to be(8)
    end
  end
end