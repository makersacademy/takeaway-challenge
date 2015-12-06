require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:rand_number) {rand(20..50)}
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
      takeaway.select_dish(:margareta, rand_number)
      takeaway.select_dish(:hawaiian, rand_number)
      expect(takeaway.current_order).to include(margareta: rand_number, hawaiian: rand_number)
    end
    context 'when an invalid dish is inputted' do
      it 'can reject invaild dishes' do
        expect{takeaway.select_dish(:invalid, rand_number)}.to raise_error('Sorry this is an invalid dish')
      end
    end
  end
end
