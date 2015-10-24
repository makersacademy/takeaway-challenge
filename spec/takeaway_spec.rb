require 'takeaway'

describe Takeaway do

  describe '#initialize'
    it 'has a name, with a default' do
      expect(subject.name).to eq 'no_name'
    end

    it 'has a phone number, with a defailt' do
      expect(subject.number).to eq '+447479365828'
    end


end
