require 'menu'

describe Menu do

  it 'contains a list of dishes with prices' do
    expect(subject.list).to eq({margherita: 5, pepperoni: 6, hawaiian: 6, supreme: 7})
  end


end
