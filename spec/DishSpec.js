describe('Dish', () => {
  let linguini;

  beforeEach(() => {
    linguini = new Dish('linguini', 11.5);
  });

  describe('.getPrice()', () => {
    it('returns the price', () => {
      expect(linguini.getPrice()).toEqual(11.5);
    });
  });

  describe('.getName()', () => {
    it('returns the name', () => {
      expect(linguini.getName()).toEqual('linguini');
    });
  });
});
