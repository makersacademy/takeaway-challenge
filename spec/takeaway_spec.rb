require './lib/takeaway'

describe Takeaway do
  let(:rice) { { name: :rice, price: 3 } }

  it 'has a menu of dishes' do
    allow(subject).to receive(:dishes).and_return([rice])
    expect(subject.dishes).to include rice
  end

  it 'shows a list of generic options' do
    expect(subject.options).to include '[S]how order'
  end

end
