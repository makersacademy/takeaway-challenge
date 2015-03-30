require 'menu'

describe Menu do
  it 'can add new dishes' do
    expect(subject).to respond_to(:add).with(2).arguments
  end
end
