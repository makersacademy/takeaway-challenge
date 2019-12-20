require 'menu'
describe Menu do
  it 'has capacity to store menu options' do
    expect(subject.options).to be_a Hash
  end
  it 'can add items to menu' do
    subject.add("juice", 1.40)
    expect(subject.options).to include("juice" => 1.40)
  end


  xit 'can show the menu' do

    expect { subject.list }.to output(instance_of(Symbol) => instance_of(Float))
  end
end
