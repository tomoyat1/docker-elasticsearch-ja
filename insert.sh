#!/bin/sh
curl --user elastic:changeme -XPUT 'http://localhost:9200/_template/kuromoji_tokenizer_default' -d '{
    "template" : "*",
    "settings" : {
        "number_of_shards" : 1,
        "index": {
            "analysis": {
                "analyzer": {
                    "default": {
                        "tokenizer": "kuromoji_tokenizer",
                        "type": "custom"
                    }
                }
            }
        }
    }
}'
