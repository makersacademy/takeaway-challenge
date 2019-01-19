require 'formatter'

describe Formatter do
  let(:item) { double(:item, name: "Fish", price: 8) }
  let(:subject) { Formatter.new }

  it 'should format an array of items' do
    expect(subject.format_items([item])).to eq ["Fish --- £8\n"]
  end

  it 'should format a given price' do
    expect(subject.format_price(8)).to eq "£8"
  end

end
