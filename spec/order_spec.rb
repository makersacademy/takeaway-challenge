require 'order'

describe Order do
  subject { described_class.new }
  let('menu') { double :menu }

  it 'adds items to hash' do
    subject.add("pasta", 1)
    expect(subject.order).to eq({ "pasta" => 1 })
  end

  it 'summarises order in hash' do
    allow(menu).to receive(:lookup).with("pasta") { 1.99 }
    subject.add("pasta", 2)
    expect(subject.summary(menu)).to eq([{ :item => "pasta", :quant => 2, :total => 3.98 }])
  end

  it 'returns order total' do
    allow(menu).to receive(:lookup).with("pasta") { 1.99 }
    allow(menu).to receive(:lookup).with("pizza") { 2.99 }
    subject.add("pizza", 3)
    subject.add("pasta", 2)
    expect(subject.total(menu)).to eq(3 * 2.99 + 2 * 1.99)
  end

end
