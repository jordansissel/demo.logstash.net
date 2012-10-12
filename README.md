    dir="demo.logstash.net"
    [ ! -d $dir ] && mkdir $dir
    curl -Lso - https://github.com/jordansissel/demo.logstash.net/tarball/master \
    | tar --strip-components 1 -C $dir -zvxf -

