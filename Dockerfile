FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.0

RUN elasticsearch-plugin install analysis-kuromoji

USER root

# RUN elasticsearch-plugin install analysis-kuromoji
#    && echo "index.analysis.analyzer.default.type: custom" >> /usr/share/elasticsearch/config/elasticsearch.yml \
#    && echo "index.analysis.analyzer.default.tokenizer: kuromoji_tokenizer" >> /usr/share/elasticsearch/config/elasticsearch.yml

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/e1f115e4ca285c3c24e847c4dd4be955e0ed51c2/wait-for-it.sh /utils/wait-for-it.sh
ADD ./insert.sh ./start.sh ./
RUN chmod 755 ./insert.sh ./start.sh /utils/wait-for-it.sh

ENV ES_JAVA_OPTS "-Xms50m -Xmx50m"

USER elasticsearch
CMD ["./start.sh"]
