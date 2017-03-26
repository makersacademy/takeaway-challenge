require 'time_function'
require 'timecop'

describe TimeFunction do
  it { is_expected.to be_instance_of(TimeFunction)}

  describe '#time_plus_one_hour' do
    before do
      Timecop.freeze(Time.new(2017, 3, 26, 13, 0, 0))
    end
    it 'expects to return time plus 1 hour' do
      expect(subject.time_plus_one_hour).to eq "14:00"
    end
  end
end
