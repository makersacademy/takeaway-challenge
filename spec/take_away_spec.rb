require 'take_away'

describe TakeAway do
  context '#read_menu' do

    it 'exists' do
      expect(subject).to respond_to(:read_menu)
    end

    it 'returns an array' do
      expect(subject.read_menu).to be_instance_of(Array)
    end
  end
end
