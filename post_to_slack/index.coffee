getstdin = require 'get-stdin'
WebClient = require('@slack/client').WebClient

token = process.env.SLACK_API_TOKEN || ''
web = new WebClient token

getstdin()
.then (tweet) ->
  web.post 'channel', tweet, (err, res) ->
    if !err then console.log('Message sent: ', res)

#TODO pass in slack channels from anothe function
