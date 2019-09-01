# frozen_string_literal: true

require './lib/order'
require 'timecop'

describe Order do
  include_examples 'Test Helpers'

  let(:formatter) { instance_double('TimeFormatter') }
  let(:one_hour)  { 60 * 60 }
  subject         { described_class.new([menu_item, menu_item], one_hour, formatter) }

  before :each do
    allow(formatter).to receive(:format).and_return('11:10')
    Timecop.freeze(time)
  end

  after :each do
    Timecop.return
  end

  it 'should record the time it was created' do
    expect(subject.time).to eq time
  end

  it 'should return a copy of the time it was created' do
    expect(subject.time).not_to be time
  end

  it 'should calculate the correct order total' do
    expect(subject.total).to eq '8.60'
  end

  it 'should have a configurable delivery window' do
    two_hours = 2 * one_hour
    order = described_class.new([], two_hours, formatter)
    expect(order.delivery_time).to eq time + two_hours
  end

  context 'when returning a string representation' do
    it 'should format itself correctly' do
      expected = "Cafe Latte - 4.30\n"\
                 "Cafe Latte - 4.30\n"\
                 "Total: 8.60\n"\
                 "Delivers by: 11:10"
      expect(subject.to_string).to eq expected
    end

    it 'should delegate time formatting to its time formatter object' do
      subject.to_string
      expect(formatter).to have_received(:format).with(subject.delivery_time)
    end
  end
end