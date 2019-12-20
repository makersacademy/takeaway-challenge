require 'menu'
describe Menu do
  it 'has capacity to store menu options' do
    expect(subject.options).to be_a Hash
  end
  it 'lists name of the dish' do
    expect(subject.options).to include (:name)
  end
  it 'listys price of the item' do
    expect(subject.options).to include (:price)
  end
end
