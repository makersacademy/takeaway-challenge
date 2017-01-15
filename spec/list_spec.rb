require 'list'

describe List do
  let(:dishes) do { lasagna: 4.50, pizza: 7.50, steak: 17.50 } end
  subject(:list) {described_class.new(dishes)}
  let(:printed_dishes) { "lasagna £4.5 | pizza £7.5 | steak £17.5" }

  describe '#show_dishes' do
    it { is_expected.to respond_to(:show_dishes) }

    it 'shows a list of dishes with prices' do
      expect(list.show_dishes).to eq printed_dishes
    end
  end

end
