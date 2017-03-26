require 'order'

  describe Order do
    subject(:order) {described_class.new(menu)}


    describe '#place_order' do
      it 'selects some number of dishes' do
        expect(subject.place_order(dish)).to eq
      end

      it 'does not allow dishes to be added that are not on the menu' do
        expect(subject.place_order(dish)).to raise_error 'This is not available on the menu'
      end 

    describe '#order_total'
      it 'calculates the order total' do
        expect(subject.order_total).to change_by
      end


  end
