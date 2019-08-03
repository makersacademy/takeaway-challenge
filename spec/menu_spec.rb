require 'menu'

describe Menu do
  it 'contains a menu with a pizza costing 7' do
    expect(subject.menu[:pizza]).to eq 7
  end
end
