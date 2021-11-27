require 'menu'

describe Menu do
  let(:dishes) { double :dishes }
  subject { described_class.new }

  describe '#show' do
    it 'shows a list of dishes' do
      expect(subject.show).to eq(subject.dishes)
    end

    specify 'dishes have a price' do
      subject.dishes["Fried Chicken"] = 8
      expect(subject.show["Fried Chicken"]).to be(8)
    end
  end
end