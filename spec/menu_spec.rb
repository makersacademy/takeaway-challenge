require 'menu'

describe Menu do
  let(:fake_menu) { { burger: 3, cheeseburger: 4, chips: 2 } }
  msg = <<~PUBLISHED
  Our menu is:
  burger, £3
  cheeseburger, £4
  chips, £2
  PUBLISHED

  it 'responds to print menu' do
    expect(subject).to respond_to(:print_menu)
  end

  it 'menu is a hash' do
    expect(subject.menu).to be_an_instance_of Hash
  end

  it 'print menu returns the menu' do
    expect(subject.print_menu).to eq fake_menu
  end

  it 'prints out the menu' do
    expect { subject.print_menu }.to output(msg).to_stdout
  end
end
