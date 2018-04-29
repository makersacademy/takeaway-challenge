require_relative './item_printer'

class Orderer

  include Item_printer

  def initialize(menu_handler = Menu_handler.new)
    @menu_handler = menu_handler
    print_menu_summaries
  end

  def print_menu_summaries
    ordered_print(@menu_handler.file_summaries)
  end

end
