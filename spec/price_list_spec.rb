require 'price_list'

describe PriceList do
  let(:subject) { PriceList.new }

  it 'returns an array when "list" is called' do
    expect(subject.list).to be_an Array
  end
end
