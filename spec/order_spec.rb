describe Order do


  describe '#initialize' do

    it 'creates an empty order' do
      expect(subject.selected_dishes).to be_empty
    end

    it 'has a zero total' do
      expect(subject.total).to eq 0
    end

  end

end
