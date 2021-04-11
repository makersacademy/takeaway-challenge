require 'menu'

describe Menu do

  it 'lists the dishes and their prices' do
    expect(subject.menu).to have_key(:Biltong)
    expect(subject.menu).to have_value(5)
  end
end
