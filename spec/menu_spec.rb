require 'menu'
describe Menu do
  before { subject.add("juice", 1.40) }
  it 'has capacity to store menu options' do
    expect(subject.options).to be_a Hash
  end

  it 'can add items to menu' do
    expect(subject.options).to include(:juice => 1.40)
  end

  it 'can show the menu' do
    expect { subject.list }.to output("juice - £1.40\n").to_stdout
  end

  it 'can get price of item' do
    expect(subject.get_price(:juice)).to eq (subject.options[:juice])
  end
end
