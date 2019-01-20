require 'csv'

class Menu

  def initialize(menu_csv)
    @menu_csv = menu_csv
    @output = "Item name\t\tPrice\n"
    read_csv
  end

  def list
    prettify_menu
    @output
  end

  def price?(dish)
    @hashed_menu.each { |e| return e[:price] if e[:item] == dish }
  end

private

  def prettify_menu
    @hashed_menu.each do |entry|
      @output += "#{entry[:item]}\t\t#{entry[:price]}\n"
    end
  end

  def read_csv
    @menu_read = CSV.read(@menu_csv, {
                                      encoding: "UTF-8",
                                      headers: true,
                                      header_converters: :symbol,
                                      converters: :all
                                      })
    @hashed_menu = @menu_read.map { |d| d.to_hash }
  end
end

menu = Menu.new('menu.csv')
puts menu.list
