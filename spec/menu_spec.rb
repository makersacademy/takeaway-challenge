require 'menu'

RSpec.describe Menu do

  it 'contains a list of dishes with prices' do
    expect(subject.menu).to be_a(Array)
  end

  it 'displays the menu' do
    expect{subject.display}.to output("pizza - £5\nfish - £7\nchips - £2\nkebab - £5\ncurry - £7\n"
    ).to_stdout

  end

end
