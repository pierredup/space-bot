# Description
#   A simple hubot script that gives you information about space movies
#
# Dependencies:
#   "lodash": "^4.0.1"
#   "omdb": "^0.5.0"
#
# Author:
#   pierredup

movieList = require "./data/movieList"
omdb = require 'omdb'
_ = require 'lodash'

validMovies = ->
  for key in _.keys movieList
    _.lowerCase key

getMovieInfo = (value) ->
  title = _.lowerCase value.replace /[^A-Z0-9]+/ig, "_"
  movies = validMovies()

  index = _.indexOf movies, title
  year = (_.values movieList)[index]

  {title: title, year: year}

module.exports = (robot) ->
  robot.respond /show me all space movies/i, (res) ->
    res.send _.join (_.keys movieList), "\n"

  robot.respond /wh(ich|at) year was (.*) made/i, (res) ->
    options = getMovieInfo(res.match[2])
    console.log(options);

    omdb.get options, true, (err, movie) ->
      res.send movie.title + " was made in " + movie.year

  robot.respond /who directed (.*)/i, (res) ->
    options = getMovieInfo(res.match[1])

    omdb.get options, true, (err, movie) ->
      res.send movie.title + " was directed by " + movie.director

  robot.respond /what is the plot for (.*)/i, (res) ->
    options = getMovieInfo(res.match[1])
    omdb.get options, true, (err, movie) ->
      res.send movie.plot

  robot.respond /what is the tomato rating for (.*)/i, (res) ->
    options = getMovieInfo(res.match[1])

    omdb.get options, {tomatoes: true}, (err, movie) ->
      console.log(movie)
      res.send "The rotten tomatoes rating for " + movie.title + " is " + movie.tomato.meter

  robot.respond /show me the poster for (.*)/i, (res) ->
    options = getMovieInfo(res.match[1])
    omdb.get options, true, (err, movie) ->
      res.send movie.poster

  robot.respond /who wrote (.*)/i, (res) ->
    options = getMovieInfo(res.match[1])
    omdb.get options, true, (err, movie) ->
      res.send movie.title + " was written by " + _.join movie.writers, ", "

  robot.respond /who starred in (.*)/i, (res) ->
    options = getMovieInfo(res.match[1])
    omdb.get options, true, (err, movie) ->
      res.send "The main cast for " + movie.title + " includes " + _.join movie.actors, ", "

  robot.respond /how many (.*) (movies|series)/i, (res) ->
    type = if res.match[2] is "movies" then "movie" else res.match[2]
    startYear = 2100
    endYear = 0

    omdb.search res.match[1], (err, movie) ->
      total = 0
      movies = validMovies()

      for key, value of movie when value.type is type
        title = _.lowerCase value.title.replace /[^A-Z0-9]+/ig, "_"

        if title not in movies
          continue

        total++
        if _.isObject value.year
          startYear = if value.year.from < startYear then value.year.from else startYear
          endYear = if value.year.to > endYear then value.year.to else endYear
        else
          startYear = if value.year < startYear then value.year else startYear
          endYear = if value.year > endYear then value.year else endYear

      message =  total + " " + res.match[1] + " " + res.match[2] + " was made"
      message += " between " + startYear + " and " + endYear if endYear > 0

      res.reply message

  robot.respond /list all (.*) (movies?|series)/i, (res) ->
    type = if res.match[2] is "movies" then "movie" else res.match[2]
    omdb.search res.match[1], (err, movie) ->

      movieList = validMovies()

      movies = for key, value of movie
          title = _.lowerCase value.title.replace /[^A-Z0-9]+/ig, "_"
          value.title if value.type is type and title in movieList

      res.reply _.join (_.filter movies), "\n"

  return