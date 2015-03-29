require 'customer'

describe Customer do
  let(:customer_hsh) { { name: 'Rob', tel: 00000000000, pcode: 'AA1 1ZZ' } }
  let(:subject) { described_class.new(customer_hsh) }
  it 'can set name at initialize' do
    expect(subject.name).to eq customer_hsh[:name]
  end

  it 'can set telephone number at initialize' do
    expect(subject.tel).to eq customer_hsh[:tel]
  end

  it 'can set postcode at initialize' do
    expect(subject.postcode).to eq customer_hsh[:pcode]
  end
end
