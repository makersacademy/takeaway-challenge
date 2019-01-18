require 'formatter'

describe Formatter do
  let(:item)     { double(:item, name: "Fish", price: 8 ) }
  let(:subject) { Formatter.new([item]) }

  it 'should format an array of items' do
    expect(subject.format_items).to eq ["Fish --- 8\n"]
  end

end
