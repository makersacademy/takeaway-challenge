require 'sms'

describe Hour do

  describe '#eta_to_string' do
    it 'should return one hour ahead' do
      allow_any_instance_of(Time).to receive(:strftime) { "21:24" }
      expect(subject.eta_to_string).to eq "22:24"
    end

    it 'should return one hour ahead' do
      allow_any_instance_of(Time).to receive(:strftime) { "01:59" }
      expect(subject.eta_to_string).to eq "02:59"
    end

    it 'should return midnight as 00' do
      allow_any_instance_of(Time).to receive(:strftime) { "23:24" }
      expect(subject.eta_to_string).to eq "00:24"
    end
  end

end
