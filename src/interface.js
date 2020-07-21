$(document).ready(function() {

	var dishes = new Dishes();
  var order = new Order()
  var keys = Object.keys(dishes.all());

  $('.thanks').hide()
  $(`.dish-name-1 .value`).html(`${Object.keys(dishes.all())[0]}`);
  $(`.dish-price-1 .value`).html(`£${dishes.all()[keys[0]]}`);
  $(`.dish-name-2 .value`).html(`${Object.keys(dishes.all())[1]}`);
  $(`.dish-price-2 .value`).html(`£${dishes.all()[keys[1]]}`);
  $(`.dish-name-3 .value`).html(`${Object.keys(dishes.all())[2]}`);
  $(`.dish-price-3 .value`).html(`£${dishes.all()[keys[2]]}`);
  $(`.dish-name-4 .value`).html(`${Object.keys(dishes.all())[3]}`);
  $(`.dish-price-4 .value`).html(`£${dishes.all()[keys[3]]}`);
  $(`.dish-name-5 .value`).html(`${Object.keys(dishes.all())[4]}`);
  $(`.dish-price-5 .value`).html(`£${dishes.all()[keys[4]]}`);
  $(`.dish-name-6 .value`).html(`${Object.keys(dishes.all())[5]}`);
  $(`.dish-price-6 .value`).html(`£${dishes.all()[keys[5]]}`);
  $(`.dish-name-7 .value`).html(`${Object.keys(dishes.all())[6]}`);
  $(`.dish-price-7 .value`).html(`£${dishes.all()[keys[6]]}`);
  $(`.dish-name-8 .value`).html(`${Object.keys(dishes.all())[7]}`);
  $(`.dish-price-8 .value`).html(`£${dishes.all()[keys[7]]}`);
  $(`.dish-name-9 .value`).html(`${Object.keys(dishes.all())[8]}`);
  $(`.dish-price-9 .value`).html(`£${dishes.all()[keys[8]]}`);
  $(`.dish-name-10 .value`).html(`${Object.keys(dishes.all())[9]}`);
  $(`.dish-price-10 .value`).html(`£${dishes.all()[keys[9]]}`);
  
  $('.select-meal').on('click', function(){
    var mealIndex = (this.id - 1);
    if($(this).is(":checked")){
      order.select(keys[mealIndex]);
      console.log(order.showReceipt());
    } else if($(this).is(":not(:checked)")){
      order.unselect(keys[mealIndex])
      console.log(order.showReceipt());
    }
  })

  $('.confirm').on('click', function(){
    event.preventDefault();
    console.log(order.submit())
    $('.table').hide();
    $('.welcome').hide()
    $('.confirm').hide();
    $('.thanks').show()
    $.each(order.selection, function(index, dishName) {
      var new_html =  dishName + "<span> - £" + dishes.all()[dishName] + "</span>";
      $('ul.choices').append($('<li></li>').html(new_html));
    });

    request = new XMLHttpRequest;
	  request.open('GET', 'http://api.giphy.com/v1/gifs/random?api_key=7MaxL13AmQwPWjHKTNjbEITo69NlnynR&tag=cat&rating=g', true);
	
	  request.onload = function() {
			data = JSON.parse(request.responseText).data.image_url;
			console.log(data);
			document.getElementById("gif-wrap").innerHTML = '<center><img src = "'+data+'"  title="GIF via Giphy"></center>';
	  };

	  request.send();
  
    $(`.thanks .price`).html("Total price: £" + order.totalPrice());
    });

})
