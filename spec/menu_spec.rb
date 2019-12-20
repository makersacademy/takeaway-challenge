require 'menu'
describe Menu do
  it 'has capacity to store menu options' do
    expect(subject.options).to be_a Hash
  end
  it 'lists name and price of the dish' do
    expect(subject.options).to include(a_kind_of(Symbol) => a_kind_of(Float))
  end
end
