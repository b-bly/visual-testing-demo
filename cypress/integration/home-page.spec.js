

describe('Home page', () => {
  it.skip('Looks the same', () => {
    cy.visit('/')
    cy.eyesOpen({
      appName: 'Open Cart Demo',
      testName: 'Check home page'
    })

    cy.eyesCheckWindow({
      tag: 'Home Window',
      target: 'window',
      fully: true
    })

    cy.eyesClose()
  })

  it('Loads the store logo (fail demo)', () => {
    cy.visit('/')
    cy.get('#logo').should('be.not.be.visible')
  })
})
