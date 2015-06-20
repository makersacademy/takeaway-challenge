require 'menu'

describe Menu do

  it 'should have a list of dishes with prices' do
    expect(subject.view).to be_instance_of Hash
  end

end
