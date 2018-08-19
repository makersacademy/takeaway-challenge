require 'display'

describe Display do

  test_menu = [{ :food => "Apple", :price => 1 },
               { :food => "Orange", :price => 2 },
               { :food => "Pear", :price => 3 }]

  test_select = [{ :food => "Apple", :price => 1 },
                 { :food => "Apple", :price => 1 },
                 { :food => "Orange", :price => 2 },
                 { :food => "Orange", :price => 2 },
                 { :food => "Pear", :price => 3 }]

  test_display = Display.new

  describe '#menu' do

    it 'outputs a menu to stdout' do
      expect { test_display.menu(test_menu) }.to output("1: Apple £1\n2: Orange £2\n3: Pear £3\n").to_stdout
    end
  end

  describe '#order' do

    it 'outputs a selection of elements to stdout' do
      expect { test_display.order(test_select) }.to output("1: Apple x2 - £2\n2: Orange x2 - £4\n3: Pear x1 - £3\nTotal: £9\n").to_stdout
    end
  end
end
