require 'menu'

describe Menu do

  it 'has a populated menu' do
    expect(subject.menu_list).to eq({:pizza => 2.99, :thai => 4.55, :mexican => 5.25})
  end

end
