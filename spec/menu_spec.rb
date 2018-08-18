require 'menu'

describe Menu do

  it 'shows a list of dishes with prices'
    expect(subject.menu).to eq menu

end
