import sys, json, os
from elasticsearch import Elasticsearch

es = Elasticsearch(
  [
      os.getenv("ELASTIC_URL")
      #"http://elastic:changeme@pwd10_0_35_3-9200.host1.labs.play-with-docker.com/"
  ],
  verify_certs = False
)

tweet = json.loads(sys.stdin.read())

es.create(
  index = "twitter",
  doc_type = "tweet",
  id = tweet["id_str"],
  body = tweet
)

print("all done")
