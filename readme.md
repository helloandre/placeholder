## PlaceHolder

written in [Go](http://golang.org) on a lark in a couple hours on a Saturday night. Useful for inserting placeholder images into test pages. There are __way__ better/cooler/funnier ones out there, but I wanted to experiment doing things in Go.

## Usage

Install web.go (i'm lazy and didn't want to parse parameters)

    go get github.com/hoisie/web
    
compile the progarm

    go build main
    
I've included some helper scripts to get you going with Nginx and daemons. If you want to just test it, you can change "127.0.0.1" to "0.0.0.0" and just hit <yourip>:9980 and skip using any proxy.

You can pass w=xx&h=xx values to change whatever you would like. 

#### live example at [http://ph.ablu.us](http://ph.ablu.us)