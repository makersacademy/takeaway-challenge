require 'menu'

describe Menu do
  subject {described_class.new}
  double_item = 'chips'

  describe 'see_menu'do

  it 'should show customer a menu' do
    expect(subject.see_menu).not_to be_empty
  end

end

describe '#has?' do
  it 'should check if item is on menu' do
    expect(subject.has?(double_item)).to eq true
  end
end

end
