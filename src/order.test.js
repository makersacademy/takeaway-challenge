const Order = require('./order');

const order1 = new Order
const friesDouble = {price: 1.99, name: 'fries'}
const burgerDouble = {price: 3.99, name: 'burger'}

describe('order', ()=> {
  describe('getTotal', ()=> {
    it('returns a float', ()=>{
      expect(typeof(order1.getTotal()) == 'number').toBe(true)
    })
    it('returns the total price of all dishes in the dishes array', ()=> {
      order1.dishes = []
      order1.addItem(friesDouble)
      order1.addItem(burgerDouble)
      expect(order1.getTotal()).toBe(1.99+3.99)
    })
  })
  describe('addItem', ()=>{
    it('adds a dish to the dishes array', ()=> {
      order1.dishes = []
      order1.addItem(friesDouble)
      expect(order1.dishes.length).toBe(1)
    })
  })
  describe('clearOrder', ()=> {
    it('clears the dishes array', ()=> {
      order1.addItem(friesDouble)
      order1.addItem(friesDouble)
      order1.clearOrder()
      expect(order1.dishes).toEqual([])
    })
  })
  describe('listOrder', ()=> {
    it('lists items within an order', ()=> {
      order1.addItem(friesDouble)
      order1.addItem(burgerDouble)
      expect(order1.listOrder()).toEqual(["fries £1.99", "burger £3.99"])
    })
  })
})