getstdin = require 'get-stdin'
WebClient = require('@slack/client').WebClient
config = require './config.json'

token = process.env.SLACK_API_TOKEN || config.token
web = new WebClient token

replace = (x,y) -> x.replace(/(\r\n|\n|\r)/gm, y)
filter = (x,y) ->
  if y.length is 0 then return x
  else return x[y]

getstdin()
.then (infoWanted) -> web.channels.list (err, info) ->
  chans = []
  infoWanted = replace(infoWanted, '')
  if !err then chans.push filter(channel, infoWanted) for channel in info.channels
  console.log chans
.catch console.log.bind console

#TODO rethink token auth situation
#TODO might need to add new Promise to first .then
