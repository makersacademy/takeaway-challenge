require 'menu.rb'

describe Menu do

  it { is_expected.to respond_to :dishes }

  it 'has more than one dish' do
    expect(subject.dishes.count).to be > 1
  end

end
