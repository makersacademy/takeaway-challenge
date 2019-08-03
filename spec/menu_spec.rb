require 'menu'

describe Menu do
  it 'contains a menu with a pizza costing 7' do
    expect(subject.menu[:pizza]).to eq 7
  end
  it 'shows a list of dishes with prices' do
    expect(subject).to respond_to(:show_menu)
  end
end
