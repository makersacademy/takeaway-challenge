# frozen_string_literal: true

require './lib/menu_item'

describe MenuItem do
  subject { described_class.new('Cafe Latte', '1') }

  it 'should use "-" as a conjoiner by default' do
    expect(subject.to_string).to eq 'Cafe Latte - 1'
  end

  it 'should be able to use any single character conjoiner' do
    expect(subject.to_string('*')).to eq 'Cafe Latte * 1'
  end
end