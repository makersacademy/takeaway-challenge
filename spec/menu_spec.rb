require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe 'the menu' do
    context 'when a customer requests the menu' do
      it 'should show the list of meals' do
        expect(subject.show).
        to eq "Bombay Aloo : £5\nLamb Passanda : £9\nChicken Tikka Masala : £8"
      end
    end
  end

end
