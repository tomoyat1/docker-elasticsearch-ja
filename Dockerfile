FROM elasticsearch:2.4-alpine

RUN plugin install analysis-kuromoji \
    && echo "index.analysis.analyzer.default.type: custom" >> /usr/share/elasticsearch/config/elasticsearch.yml \
    && echo "index.analysis.analyzer.default.tokenizer: kuromoji_tokenizer" >> /usr/share/elasticsearch/config/elasticsearch.yml

ENV ES_JAVA_OPTS "-Xms50m -Xmx50m"

CMD ["elasticsearch"]
