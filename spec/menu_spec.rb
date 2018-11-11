require 'menu'

describe Menu do

  it 'has a list of dishes with prices' do
    expect(subject.view_dishes).not_to be_empty
  end
end
