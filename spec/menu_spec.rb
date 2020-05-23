require 'menu'

describe Menu do
  subject { Menu.new }

  let(:dishes) { [:chicken, :beef, :pasta, :pizza, :burger] }

  it 'starts with an array of dishes' do
    expect(subject.dishes).to eq(dishes)
  end

  it 'prints menu, line by line, when you call show_menu' do
    expect { subject.show_menu }.to output("chicken\nbeef\npasta\npizza\nburger\n").to_stdout
  end

end
