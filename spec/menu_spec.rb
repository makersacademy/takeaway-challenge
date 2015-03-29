require 'menu'

describe Menu do
  it 'can have a list of dishes stored as a hash' do
    expect(subject.items).to be_a Hash
  end
  it 'can load dishes from a yaml file' do
    yaml_file = './menu.yml'
    subject.load(yaml_file)
    expect(subject.items).not_to be_empty
  end
end