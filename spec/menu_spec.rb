require 'menu'

describe Menu do

  context 'file open' do
    let(:content) { StringIO.new("Pad thai,7\Ramen,8 n2\Pho,9n3") }
    it 'mock file.open' do
      allow(File).to receive(:open).and_yield(content)
    end
  end

  context 'writing the file' do
    it 'mock File writing' do
      @buffer = StringIO.new()
      @filename = "somefile.txt"
      @content = "the content fo the file"
      allow(File).to receive(:open).with(@filename, 'w').and_yield(@buffer)
      File.open(@filename, 'w') { |f| f.write(@content) }
      expect(@buffer.string).to eq(@content)
    end
  end

  describe '#read_menu' do
    it 'puts to the screen' do
      expect { subject.read_menu }.to output(@dish_list).to_stdout
    end
  end
end

  # context 'append to file' do
  #   let(:dish1) { dish1 = double(:dish1, name: 'latte', price: '3')}
  #   it 'mock file append' do
  #     menu1=Menu.new
  #     menu1.add_dish(dish1)
  #     contents = File.read("./lib/menu.csv")
  #     last_row = contents.split("\n").last.chomp
  #     expect(last_row).to eq("latte,3")
  #
  #   end
  # end
