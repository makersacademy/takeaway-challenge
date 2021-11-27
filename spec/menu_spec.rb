require 'menu'

describe Menu do
  let(:dishes) { double :dishes }
  subject { described_class.new }

  describe '#show' do
    it 'shows a list of dishes' do
      expect(subject.show).to eq(subject.dishes)
    end
  end
end