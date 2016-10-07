require 'menu'

describe Menu do

  it 'should show a menu list with dishes and prices' do
    expect(subject.show).to eq(subject.dishes)
  end

  it 'should know what is on the menu' do
    expect(subject.do_we_have('Beer')).to eq(true)
  end

  it 'should know what is not on the menu' do
    expect(subject.do_we_have('&£&@()')).to eq(false)
  end

end
