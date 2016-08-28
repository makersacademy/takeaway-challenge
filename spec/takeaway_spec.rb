describe TakeAway do

  subject(:takeaway) { described_class }
  let(:select1) { {item_n: 0, quantity: 1} }
  let(:select2) { {item_n: 1, quantity: 1} }
  let(:tel_n) { '+447733362000' }

  describe ':show_menu' do
    it 'is a class method of TakeAway' do
      expect(takeaway).to respond_to(:show_menu)
    end 
  end 

  describe ':order' do
    context 'when given the correct total' do
      it 'does not raise an error' do
        expect {takeaway.order(18, tel_n, select1, select2)}.not_to raise_error
      end 
    end 

    context 'when given a wrong total' do
      it 'raises an error' do
        error = takeaway::PRICE_ERROR
        expect {takeaway.order(19,tel_n,select1,select2)}.to raise_error(error)
      end 
    end 
  end 
end 
