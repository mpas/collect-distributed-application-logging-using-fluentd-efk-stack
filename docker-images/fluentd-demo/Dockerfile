# fluentd/Dockerfile
# or v0.14-onbuild
FROM fluent/fluentd:v0.14.16-onbuild

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
        && sudo gem install fluent-plugin-elasticsearch \ 
        && sudo gem install fluent-plugin-mongo \
        && sudo gem install fluent-plugin-grok-parser \
        && sudo gem sources --clear-all \
        && apk del .build-deps \
        && rm -rf /var/cache/apk/* \
        /home/fluent/.gem/ruby/2.3.0/cache/*.gem
