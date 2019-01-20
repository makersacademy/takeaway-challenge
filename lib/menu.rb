require 'csv'
require 'printer'

class Menu

  def initialize(menu_csv)
    @menu_csv = menu_csv
    read_csv
  end

  def list
    Printer.print_nicely(@hashed_menu)
  end

  def price?(dish)
    @hashed_menu.each { |e| return e[:price] if e[:item] == dish }
  end

private

  def read_csv
    @menu_read = CSV.read(@menu_csv, {
                                      headers: true,
                                      header_converters: :symbol,
                                      converters: :all
                                      })
    @hashed_menu = @menu_read.map { |d| d.to_hash }
  end
end
