require 'json'

class Menu

  attr_reader :menu

  def initialize menu_file="#{Dir.pwd}/lib/menu.json"
    @json_obj = File.read menu_file
    @menu = []
    build_menu
  end

  def show_menu
    str = ''
    menu.each do |arr|
      arr.each_pair do |k,v|
        str += "#{k}, Price : £#{v} // "
      end
    end
    str
  end

  private

  def build_menu
    menu << JSON.parse(@json_obj)
  end

end
