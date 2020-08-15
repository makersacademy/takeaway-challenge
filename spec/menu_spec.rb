require 'menu'

describe Menu do
  it 'creates an instance of Menu' do
    expect(subject).to be_an_instance_of(Menu)   
  end

  it { is_expected.to respond_to(:view) }
end