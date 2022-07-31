/// <reference types="cypress" />

describe('takeaway challenge', () => {
  it('displays the restaurants menu, dishes and prices', () => {
    cy.visit('http://localhost:8080')
    cy.get('.on-the-menu li').should('have.length', 3)
    cy.get('.on-the-menu li').first().should('have.text', 'Risotto - 13.50€')
    cy.get('.on-the-menu li').last().should('have.text', 'Spanakopita - 14.99€')
  })
})