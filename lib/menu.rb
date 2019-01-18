require 'csv'

class Menu

  def initialize(menu_csv)
    @menu_csv= menu_csv
    @output = "Item\t\tPrice\n"
  end

  def list
    read_csv
    prettify_menu
    @output
  end

  def prettify_menu
    @hashed_menu.each do |entry|
      @output += "#{entry[:item]}\t\t#{entry[:price]}\n"
    end
  end

private

  def read_csv
    @menu_read = CSV.read(@menu_csv, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
    @hashed_menu = @menu_read.map { |d| d.to_hash }
  end

end

menu = Menu.new('menu.csv')
menu.list
menu.prettify_menu
