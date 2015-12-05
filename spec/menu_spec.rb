require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  #menu is the name of the class and includes all menu methods etc.
  #list is the name of the actual menu within the class

  describe '#view' do
    it 'outputs the list of dishes with prices to the screen' do
      expect{ menu.view }.to output.to_stdout
    end
  end
end


=begin
it 'will match when output is generated' do
  # observes output sent to $stdout or $stderr
  expect { print('hello') }.to output.to_stdout
  expect { print('hello') }.to output('hello').to_stdout
  expect { print('hello') }.to output(/ll/).to_stdout

  expect { warn('problem') }.to output(/problem/).to_stderr
end
=end
