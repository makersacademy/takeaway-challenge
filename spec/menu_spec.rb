require 'menu'

describe Menu do
  it 'contains a menu with a pizza costing 7' do
    expect(subject.menu[:pizza]).to eq 7.00
  end
  it 'shows a list of dishes with prices' do
    expect do
      subject.show_menu
    end.to output("pizza: £7.0\nkebab: £8.0\nburger: £5.0\nchips: £3.0\n").to_stdout
  end
end
