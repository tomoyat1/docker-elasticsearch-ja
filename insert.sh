#!/bin/sh
curl -XPUT 'http://localhost:9200/_all/_settings?preserve_existing=true' -d '{
  "index.analysis.analyzer.default.tokenizer" : "kuromoji_tokenizer",
  "index.analysis.analyzer.default.type" : "custom"
}'
