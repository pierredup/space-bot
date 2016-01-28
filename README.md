# hubot-space-bot

A simple [hubot](https://hubot.github.com) script that gives you information about space movies

See [`src/space-bot.coffee`](src/space-bot.coffee) for all the available commands.

## Installation

In hubot project repo, run:

`npm install hubot-space-bot --save`

Then add **hubot-space-bot** to your `external-scripts.json`:

```json
[
  "hubot-space-bot"
]
```

## Sample Interaction

```
user1>> hubot what year was Prometheus made
hubot>> Prometheus was made in 2012

user1>> hubot what is the plot for men in black II
hubot>> Agent J needs help so he is sent to find Agent K and restore his memory.
```

## Available actions

* Get list of all available space movies
* Get year when a movie was made
* Get the director of a movie
* Show the plot of a movie
* Get the rotten tomatoes rating
* View the movie poster
* List all the writers of a movie
* List the main cast members
* Get the number of movies or series made in a franchise
* List all movies or series of a franchise