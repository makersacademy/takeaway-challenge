require 'menu'

describe Menu do

  # let(:menu) { described_class }

  it 'to load menu file' do
  end

  it 'menu is a hash' do
    expect(subject.menu).to be_a Hash
  end

  it 'has a list of dishes and prices' do
    subject.menu
    expect(subject.create_menu).to include("1. Roasted pork - £8\n")
  end
end
