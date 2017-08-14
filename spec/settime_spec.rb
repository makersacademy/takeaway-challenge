require 'settime'

describe SetTime do

  # subject { described_class.new(journey_c) }


  context '#initialize' do
    it 'returns one hour later' do
      hr2 = Time.now.hour + 1
      expect(subject.hr1).to eq hr2
    end

    it 'returns the min1 variable' do
      min2 = Time.now.min
      expect(subject.min1).to eq min2
    end
  end

  # context 'check two digits' do
  #   let(:time1) { double :time1 }
  #   before do
  #     subject.instance_variable_set(:@time1, time1)
  #   end
  #
  #   it 'returns the min1 variable in 2 digits' do
  #     allow(time1).to receive(:min).and_return(2)
  #     expect(subject.min1).to eq "02"
  #   end
  # end

end
