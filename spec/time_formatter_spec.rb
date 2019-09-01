# frozen_string_literal: true

require './lib/time_formatter'
require 'timecop'

describe TimeFormatter do
  include_examples 'Test Helpers'

  subject { described_class.new }

  before :each do
    Timecop.freeze(time)
  end

  after :each do
    Timecop.return
  end

  it 'should have a default format of hours and minutes' do
    expect(subject.format(time)).to eq '10:10'
  end

  it 'should be able to accept any format' do
    formatter = described_class.new('%H:%M:%S')
    expect(formatter.format(time)).to eq '10:10:10'
  end
end