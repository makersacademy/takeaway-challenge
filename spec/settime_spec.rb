require 'settime'

describe SetTime do

  let(:time2) { double() }
  subject { described_class.new(time2) }

  before do
    allow(time2).to receive(:hour).and_return(15)
    allow(time2).to receive(:min).and_return(2)
  end

  context '#initialize' do
    it 'returns one hour later' do
      expect(subject.hr1).to eq "16"
    end

    it 'returns the min1 variable in 2 digits after decimal' do
      expect(subject.min1).to eq "02"
    end
  end

end
