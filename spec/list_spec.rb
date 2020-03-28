require 'list'

describe List do
  it { is_expected.to respond_to :see }
    
  it 'shows dish price pairs' do
    menu = { 'apple' => 3 }
    expect(subject.see).to eq(menu)
  end
end