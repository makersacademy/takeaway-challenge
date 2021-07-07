require './lib/my_takeaway.rb'

RSpec.describe Takeaway do



  describe '#open_menu' do
    it 'opens a list of dishes with prices' do
      expect(subject.open_menu).not_to be_empty
    end

    describe '#order' do
      let(:basket) {double :basket}
      it 'adds item to basket' do
          expect { subject.order(item, quantity) }.to change{ subject.basket.length }.by(1)
      end


    end
  end
end
