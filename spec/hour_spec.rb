require 'hour'
require 'timecop'

describe Hour do
  describe '#60min_ahead' do
    it 'returns a time 1h ahead from now in 00:00 format' do
      @time = Time.local(2022, 1, 1, 5, 14, 57)
      Timecop.freeze(@time)
      expect(Hour.one_ahead).to eq '06:14'
      Timecop.return
    end
  end
end