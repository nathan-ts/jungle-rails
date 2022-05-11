/// <reference types="cypress" />

describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('displays the intro section by default', () => {
    cy.get('.intro').should('be.visible')
  })

  it("There are products on the page that go to product page when clicked", () => {
    cy.get(".products article").should("be.visible");
    cy.get(".products article").first().click();
    cy.url().should('include', '/products/');
  });


})
