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

## Available commands

* show me all space movies
* wh(ich|at) year was (.*) made
  * E.G `what year was Apollo 13 made`
* who directed (.*)
  * E.G `who directed Avatar`
* what is the plot for (.*)
  * E.G `what is the plot for men in black ii`
* what is the tomato rating for (.*)
  * E.G `what is the tomato rating for aliens`
* show me the poster for (.*)
  * E.G `show me the poster for Avatar`
* who wrote (.*)
  * E.G `who wrote District 9`
* who starred in (.*)
  * E.G `who starred in men in black`
* how many (.*) (movies|series)
  * E.G `how many star trek movies was made`
  * E.G `how many star trek movies exists`
* list all (.*) (movies?|series)
  * E.G `list all star wars movies`

## Demo

To test the bot or play around with it, you can join the Slack group [https://botmakers.slack.com](https://botmakers.slack.com), then join the #test-space-bot channel
