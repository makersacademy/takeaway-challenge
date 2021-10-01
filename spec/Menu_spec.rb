require 'Menu'

describe Menu do
  it 'p list' do
    expect { Menu.displayMenu }.to output("spring roll: 0.99\nchar sui bun: 3.99\npork dumpling: 2.99\npeking duck: 7.99\nfu-king fried rice: 5.99\n").to_stdout
  end
end