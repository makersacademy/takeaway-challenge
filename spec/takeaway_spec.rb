require 'takeaway'

describe Takeaway do

  context 'when initialized' do
    it 'accepts 1 argument: default menu' do
      menu = double()
      expect(subject).to respond_to(:menu)
    end
    describe '#show_menu' do
      it 'displays menu in STDOUT' do
        expect(subject).to respond_to(:show_menu)
      end
    end
    describe '#check_out' do
        xit 'raises error' do

        end
    end
    describe '#confirm_delivery' do
        xit 'raises error' do
        end
    end
  end

  context 'when user adds an item' do
    describe '#adds' do
      xit 'accepts 2 arguments' do
      end
      xit 'raises an error with 1 argument' do
      end
      xit 'raises an error with 3 arguments' do
      end
    end
    describe '#check_out' do
      xit 'displays order total and quantities' do
      end
    end
    describe '#confirm_delivery' do
      xit 'if number is valid, sends SMS' do
      end
      xit 'raises error if number is not valid' do
      end
    end
  end

end
