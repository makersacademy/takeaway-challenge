'use strict';

describe('Airport', () => {
  let airport;
  let plane;

  beforeEach(() => {
    airport = new Airport();
    plane = jasmine.createSpyObj('plane',['land']);
  });

  it('has no planes by default', () => {
    expect(airport.planes()).toEqual([]);
  });

  it('clears planes for landing', () => {
    airport.clearForLanding(plane);
    expect(airport.planes()).toEqual([plane]);
  });

  it('clears planes for takeoff', () => {
    airport.clearForLanding(plane);
    airport.clearForTakeoff(plane);
    expect(airport.planes()).toEqual([]);
  });

  it ('clears multiple planes for landing', () => {
    expect(airport.planes()).toEqual([]);
    airport.clearForLanding(plane);
    airport.clearForLanding(plane);
    airport.clearForLanding(plane);
    expect(airport.planes()).toEqual([plane, plane, plane]);
  });

  it ('clears a plane to takeoff with multiple planes landed', () => {
    airport.clearForLanding(plane);
    airport.clearForLanding(plane);
    expect(airport.planes()).toEqual([plane, plane]);
    airport.clearForTakeoff(plane);
    expect(airport.planes()).toEqual([plane]);
  });

  it('checks for stormy weather', () => {
    expect(airport.isStormy()).toBeFalsy();
  });

  it('prevents takeoff during stormy weather', () => {
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect(() => {
      airport.clearForTakeoff(plane); }).toThrowError('cannot take off during a storm');
  });

  it('prevents takeoff during stormy weather', () => {
    spyOn(airport, 'isStormy').and.returnValue(true);
    expect(() => {
      airport.clearForLanding(plane); }).toThrowError('cannot land during a storm');
  });
});
