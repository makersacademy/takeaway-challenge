require 'menu'

describe Menu do

  it 'lists dishes and prices' do
    expect(subject.menu).to eq described_class::MENU
  end

end
