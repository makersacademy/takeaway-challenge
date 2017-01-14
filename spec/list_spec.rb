require 'list'

describe List do
  subject(:list) {described_class.new}

  describe '#show_dishes' do
    it { is_expected.to respond_to(:show_dishes) }

    it 'shows a list of dishes with prices' do
      expect(list.show_dishes).to eq "lasagna £4.5 | pizza £7.5 | steak £17.5"
    end
  end

end
