require './lib/time_formatter'
require 'timecop'

describe TimeFormatter do
  subject { TimeFormatter.new }
  let(:time_placed) { Time.new(2000, 10, 10, 10, 10, 10) }

  before :each do
    Timecop.freeze(time_placed)
  end

  after :each do
    Timecop.return
  end

  it 'has a default format of hours and minutes' do
    expect(subject.format(time_placed)).to eq '10:10'
  end

  it 'has a configurable format' do
    formatter = TimeFormatter.new("%H:%M:%S")
    expect(formatter.format(time_placed)).to eq '10:10:10'
  end
end