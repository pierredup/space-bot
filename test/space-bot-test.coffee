chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'space-bot', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/space-bot')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/show me all space movies/i)
    expect(@robot.respond).to.have.been.calledWith(/wh(ich|at) year was (.*) made/i)
    expect(@robot.respond).to.have.been.calledWith(/who directed (.*)/i)
    expect(@robot.respond).to.have.been.calledWith(/what is the plot for (.*)/i)
    expect(@robot.respond).to.have.been.calledWith(/what is the tomato rating for (.*)/i)
    expect(@robot.respond).to.have.been.calledWith(/show me the poster for (.*)/i)
    expect(@robot.respond).to.have.been.calledWith(/who wrote (.*)/i)
    expect(@robot.respond).to.have.been.calledWith(/who starred in (.*)/i)
    expect(@robot.respond).to.have.been.calledWith(/how many (.*) (movies|series)/i)
    expect(@robot.respond).to.have.been.calledWith(/list all (.*) (movies?|series)/i)
