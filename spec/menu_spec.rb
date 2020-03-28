require 'menu'

describe Menu do
  it 'should display a list of dishes with prices' do
    expect(subject.view).to eq "1. Pie - £6\n2. Mash - £4\n3. Chips - £5"
  end
end