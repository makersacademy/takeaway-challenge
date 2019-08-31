require './lib/time_formatter'
require 'timecop'

describe TimeFormatter do
  subject { TimeFormatter.new }
  let(:time) { Time.new(1750, 7, 28, 10, 10, 10) }

  before :each do
    Timecop.freeze(time)
  end

  after :each do
    Timecop.return
  end

  it 'has a default format of hours and minutes' do
    expect(subject.format(time)).to eq '10:10'
  end

  it 'has a configurable format' do
    formatter = TimeFormatter.new("%H:%M:%S")
    expect(formatter.format(time)).to eq '10:10:10'
  end
end