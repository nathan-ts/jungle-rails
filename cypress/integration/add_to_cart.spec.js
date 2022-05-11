/// <reference types="cypress" />

describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('displays the intro section by default', () => {
    cy.get('.intro').should('be.visible')
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("The cart count increases by 1 when the Add to Cart button is clicked", () => {
    cy.get("a[href='/cart']")
      .invoke('text')
      .then((prevCart) => {
        const prevAmt = parseInt(prevCart.match(/\(([^)]+)\)/)[1]);
        // click button to add to cart
        cy.get(".products article").first().find(":button").first().click({force: true});
        // get new cart value
        cy.get("a[href='/cart']")
        .invoke('text')
        .should((currCart) => {
          const currAmt = parseInt(currCart.match(/\(([^)]+)\)/)[1]);
          expect(prevAmt+1).to.eq(currAmt);
        });
      });

  });


})
