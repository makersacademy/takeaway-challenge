require './lib/order'

describe Order do
  let(:menu) {double(:journey, hash = [:beef_burger, 4.0])}
  let(:menu_klass){double(:menu_klass, :new => :menu)}

  it 'select some number of several available dishes from the menu' do
    hash = {}
    hash[:beef_burger] = 2
    expect(subject.add_order(:beef_burger, 2)).to eq hash
  end
end
