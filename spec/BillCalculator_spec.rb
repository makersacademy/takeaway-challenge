require 'BillCalculator'
require 'Menu'

describe BillCalculator do
  let(:bill) {BillCalculator.new(Menu::MEAL_OPTIONS)}
    describe '#calculate_total' do
      it 'calculates total corretly and pushes total to @total' do
        bill.calculate_total(:Hamburger=>4, :Salad=>7)
        expect(bill.total).to eq(41)
      end
    end

    describe '#order' do
      it 'stores order correctly in @order' do
        bill.store_order(:Pizza=>8, :Lamb_Shank=>20)
        expect(bill.order).to eq(["Pizza (£6) x 8 = £48", "Lamb_Shank (£7) x 20 = £140"])
      end
  end

end
