require 'menu'
describe Menu do
  it 'has capacity to store menu options' do
    expect(subject.options).to be_a Hash
  end
  it 'can add items to menu' do
    subject.add("juice", 1.40)
    expect(subject.options).to include(:juice => 1.40)
  end

  it 'can show the menu' do
    subject.add("juice", 1.40)
    expect { subject.list }.to output("juice - 1.40").to_stdout
  end
end
