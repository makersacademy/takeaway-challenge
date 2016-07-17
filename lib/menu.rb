require "awesome_print"

class Menu

  def menu
    [{name: "gongbaojiding", chinese: "宫爆鸡丁", price: 8, stock: 5, veg: false},
     {name: "xiaocongbandoufu", chinese: "小葱拌豆腐", price: 6, stock: 3, veg: true},
     {name: "ranmian", chinese: "燃面", price: 7, stock: 6, veg: false},
     {name: "jiaozi", chinese: "饺子", price: 7, stock: 25, veg: false},
     {name: "laziji", chinese: "辣子鸡", price: 9, stock: 4, veg: false},
     {name: "mapodoufu", chinese: "麻婆豆腐", price: 5, stock: 3, veg: true}]
  end

  def print_menu
    ap menu, :indent => -2
  end
end
