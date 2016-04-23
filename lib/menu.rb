class Menu

  attr_reader :dishes

  DEFAULT_VALUE = 0
  HASH_SIZE = 4

  def initialize
    @dishes = { "jamon serrano": 15.99, "croquetas gato": 7.99, "tortilla patata": 4.99, "spanish sangria": 7.25 }
    @dishes.default = 0
  end

  def contains?(dish)
    dishes.has_key?(dish.to_sym)
  end

  def to_s
    list = ""
    @dishes.each do |k,v|
      list += "#{k} : €#{v}\n"
    end
    message = "Bar El Gato Muerto"+"\n"+"MENU" +"\n" + list
  end



end