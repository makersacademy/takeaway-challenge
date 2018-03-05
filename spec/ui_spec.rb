require './lib/ui.rb'

describe UserInterface do

  describe 'user_getter' do
    it 'turns user_input to an array' do
      allow($stdin).to receive(:gets).and_return('raefe, house, car')
      expect(subject.user_getter).to eq("car")
    end
  end

  describe '#correct_cost' do
    it 'raises an error if customer has the wrong price' do
      allow(subject).to receive(:user_getter).and_return(21)
      expect { subject.correct_cost }.to raise_error "Customer's intended cost is different from actual cost"
    end
  end
end
