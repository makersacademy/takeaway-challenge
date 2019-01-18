require 'formatter'

describe Formatter do
  let(:item) { double(:item, name: "Fish", price: 8) }
  let(:subject) { Formatter.new }

  it 'should format an array of items' do
    expect(subject.format_items([item])).to eq ["Fish --- £8\n"]
  end

end
