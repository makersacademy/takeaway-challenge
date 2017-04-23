require 'sms'

describe Hour do

  describe '#eta_to_string' do
    it 'should return 21:24 when given 22:24' do
      allow_any_instance_of(Time).to receive(:strftime) { "21:24" }
      expect(subject.eta_to_string).to eq "22:24"
    end

    it 'should return 02:59 when given 01:59' do
      allow_any_instance_of(Time).to receive(:strftime) { "01:59" }
      expect(subject.eta_to_string).to eq "02:59"
    end

    it 'should return midnight as 00' do
      allow_any_instance_of(Time).to receive(:strftime) { "23:24" }
      expect(subject.eta_to_string).to eq "00:24"
    end
  end

end
