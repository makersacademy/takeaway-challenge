require 'menu'

describe Menu do
  
  it 'allows the user to create an instance of Menu' do
    expect(subject).to be_instance_of Menu
  end

  it { is_expected.to respond_to :list_of_dishes }

end