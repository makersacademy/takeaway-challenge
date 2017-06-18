require 'order'

describe Order do
  it { is_expected.to be_a Order }

  describe 'Initialization' do
    it { is_expected.to respond_to :basket }

    context 'Order basket' do
      it 'is an array' do
        expect(subject.basket).to be_a Array
      end

      it 'is empty when initialized' do
        expect(subject.basket).to be_empty
      end
    end
  end
end
