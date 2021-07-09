describe("Takeaway", () => {
  let pizza;
  let burger;
  let chocolateFugdeCake;
  let ggDelicatessen;

  beforeEach(() => {
    pizza = new Dish('pizza', 12);
    burger = new Dish('burger', 8.5);
    chocolateFugdeCake = new Dish('chocolate fudge cake', 7);
    ggDelicatessen = new Takeaway();
  });

  describe('.addToMenu()', () => {
    it('adds a Dish to the menu', () => {
      ggDelicatessen.addToMenu(pizza);
      expect(ggDelicatessen.getMenu()).toContain(pizza);
    });
  });

  // As a customer
  // So that I can check if I want to order something
  // I would like to see a list of dishes with prices
  describe('.getMenu()', () => {
    it('returns a list of dishes with prices', () => {
      ggDelicatessen.addToMenu(pizza);
      ggDelicatessen.addToMenu(burger);
      ggDelicatessen.addToMenu(chocolateFugdeCake);
      let menu = ggDelicatessen.getMenu();
      
      expect(menu).toEqual([pizza, burger, chocolateFugdeCake]);

      expect(menu[0].getPrice()).toEqual(12);
      expect(menu[1].getPrice()).toEqual(8.5);
      expect(menu[2].getPrice()).toEqual(7);

      expect(menu[0] instanceof Dish).toBe(true);
      expect(menu[1] instanceof Dish).toBe(true);
      expect(menu[2] instanceof Dish).toBe(true);
    });
  });

  // As a customer
  // So that I can order the meal I want
  // I would like to be able to select some number of several available dishes
  describe('.addToCart()', () => {
    it('adds a Dish that was selected to the cart', () => {
      ggDelicatessen.addToMenu(pizza);
      ggDelicatessen.addToCart(0);
      expect(ggDelicatessen.getCart()).toContain(pizza);
    });
  });

  describe('.getCart()', () => {
    it('returns some number of selected dishes among several available ones', () => {
      ggDelicatessen.addToMenu(pizza);
      ggDelicatessen.addToMenu(burger);
      ggDelicatessen.addToMenu(chocolateFugdeCake);
      ggDelicatessen.addToCart(1);
      ggDelicatessen.addToCart(2);
      expect(ggDelicatessen.getCart()).toEqual([burger, chocolateFugdeCake]);
    });
  });
});
