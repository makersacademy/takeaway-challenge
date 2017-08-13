require 'menu'

describe Menu do

  it 'works' do
    expect(subject.class).to eq described_class
  end

  it 'contains dishes' do
    expect(subject.dishes[:lasagna]).to_not be_nil
  end

end
