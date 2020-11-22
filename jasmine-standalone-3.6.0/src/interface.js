$(document).ready(function() {
  var menu = new Menu();

  $('#start-over').click(function() {
    location.reload();
    var menu = new Menu();
  })

  $('#quantity-increase0').click(function() {
    menu.increase(0);
    updateQuantity(0);
  })

  $('#quantity-increase1').click(function() {
    menu.increase(1);
    updateQuantity(1);
  })

  $('#quantity-increase2').click(function() {
    menu.increase(2);
    updateQuantity(2);
  })
  $('#quantity-increase3').click(function() {
    menu.increase(3);
    updateQuantity(3);
  })

  $('#quantity-increase4').click(function() {
    menu.increase(4);
    updateQuantity(4);
  })

  $('#quantity-increase5').click(function() {
    let number = 5;
    menu.increase(5);
    updateQuantity(5);
  });

  $('#quantity-decrease0').click(function() {
    if (menu.items[0]["quantity"] >0){
      menu.decrease(0);
      updateQuantity(0);
   }
  })

  $('#quantity-decrease1').click(function() {
    if (menu.items[1]["quantity"] >0){
      menu.decrease(1);
      updateQuantity(1);
    }
  })

  $('#quantity-decrease2').click(function() {
    if (menu.items[2]["quantity"] >0){
      menu.decrease(2);
      updateQuantity(2);
    }
  })
  $('#quantity-decrease3').click(function() {
    if (menu.items[3]["quantity"] >0){
      menu.decrease(3);
      updateQuantity(3);
    }
  })
  $('#quantity-decrease4').click(function() {
    if (menu.items[4]["quantity"] >0){
      menu.decrease(4);
      updateQuantity(4);
    }
})




            function updateQuantity(number) {
              $(`#quant-${number}`).text(menu.items[number]["quantity"]);
            };

            $('#accept-bill').click(function() {
              let array1 = menu.receipt();
              for (let p = 0; p <array1.length; p++){
                var element = document.createElement("h3");
                element.innerHTML = array1[p]["quantity"] + ' ' + array1[p]["food"]
                + ' ' + '£' + array1[p]["price"].toFixed(2);
                $("#ordered-item").append(element);
              }
              $(`#total-price`).text(menu.totals());
              var x = document.getElementById("accept-bill");
              x.style.display = "none";
            })
              })

              $('#place-order').click(function() {
                var y = document.getElementById("thank-you");
                y.style.display = "block";
              })
