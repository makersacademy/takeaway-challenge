require 'menu'

describe Menu do

  it 'expect menu to not be empty' do
    expect(subject.menu).not_to be_empty
  end

  it 'shows menu options' do
    expect { subject.display_menu }.to output("Menu Options:\nCurry: £9.99\nRice: £2.99\nNaan: £3\nPepsi: £0.99\n").to_stdout
  end

end
