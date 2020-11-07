require 'menu'
describe Menu do
  it 'stores available items in an instance variable' do
    expect(subject.food).to be_an_instance_of Hash
  end

  it 'each item in the hash has its own price' do
    expect(subject.food["Goan pork vindaloo"]).to eq 14.00
  end
end
