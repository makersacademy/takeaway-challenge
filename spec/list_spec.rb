require 'list'
require 'meal'

describe List do
  it { is_expected.to respond_to :see }
    
  it 'shows dish price pairs' do
    menu = { 'apple' => 3 }
    expect(subject.see).to eq(menu)
  end

  it 'lets the user choose a number of a dish' do
    menu = {
      'apple' => 3
    }
    expect(subject.apple).to eq(menu)
  end
end