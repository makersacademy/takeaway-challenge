require 'till'

class TillSpec

  include Till

  describe TillSpec do

    context 'Using the till' do

      let(:order) { double :order, dishes: [{'Korma': 4.95}, {'Red Curry': 5.95}, {'Red Curry': 5.95}, {'Green Curry': 6.95}] }

      it 'Giving a total for an order' do
        expect(subject.total order.dishes).to eq 23.8
      end

      it 'Print receipt for final order' do
        expect(subject.display_order order.dishes).to eq "[\"Korma @ 4.95 x 1\", \"Red Curry @ 5.95 x 2\", \"Green Curry @ 6.95 x 1\"]; TOTAL: 23.8"
        end

    end

  end

end