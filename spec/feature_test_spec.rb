require 'takeaway'

describe 'Feature_test' do
  let(:takeaway) {Takeaway.new}

  describe '#menu' do
    it 'responds to menu' do
      expect(takeaway).to respond_to(:menu)
    end
    it 'displays a list of dishes and prices' do
      expect(takeaway.food).to include(margareta: 4)
    end
  end
  describe '#select_dish' do
    it 'can select a number of dishes and stores them in a current_order' do
      takeaway.select_dish(:margareta, 8)
      takeaway.select_dish(:hawaiian, 6)
      expect(takeaway.current_order).to include(margareta: 8, hawaiian: 6)
    end
    it 'can select a custom quantity of dishes' do
      takeaway.select_dish(:margareta, 20)
      expect(takeaway.current_order).to include(margareta: 20)
    end
    context 'when an invalid dish is inputted' do
      it 'can reject invaild dishes' do
        expect{takeaway.select_dish(:invalid, 5)}.to raise_error('Sorry this is an invalid dish')
      end
    end
  end
end
