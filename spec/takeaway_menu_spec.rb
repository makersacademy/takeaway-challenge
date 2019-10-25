require 'takeaway_menu'

describe TakeawayMenu do
  let(:takeaway_menu) { TakeawayMenu.new(:szechuan_chilli_beef, :szechuan_chilli_chicken, :kung_po_chicken, :vegetable_spring_rolls) }
  let(:szechuan_chilli_beef) { double :TakeawayDish }
  let(:szechuan_chilli_chicken) { double :TakeawayDish }
  let(:kung_po_chicken) { double :TakeawayDish }
  let(:vegetable_spring_rolls) { double :TakeawayDish }

  context 'initialize' do
    it 'successfully instantiates the TakeawayMenu class' do
      expect(takeaway_menu).to be_instance_of(TakeawayMenu)
    end

    describe '#takeaway_dishes' do
      it 'returns the dishes created at initiali' do
        expect(takeaway_menu.takeaway_dishes).to include(:szechuan_chilli_beef, :szechuan_chilli_chicken, :kung_po_chicken, :vegetable_spring_rolls)
      end
    end
  end
end
