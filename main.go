package main
 
import (
    "github.com/hoisie/web"
    "image"
    "image/color"
    "image/draw"
    "image/png"
    "strconv"
)

func generate(ctx *web.Context, val string) {
    ctx.ContentType("image/png")
    
    var width = 100
    var height = 100
    if w,ok := ctx.Params["w"]; ok {
        width,_ = strconv.Atoi(w)
    }
    if h,ok := ctx.Params["h"]; ok {
        height,_ = strconv.Atoi(h)
    }
    
    m := image.NewRGBA(image.Rect(0, 0, width, height))
    grey := color.RGBA{0, 0, 0, 50}
    draw.Draw(m, m.Bounds(), &image.Uniform{grey}, image.ZP, draw.Src)
    
    png.Encode(ctx, m)
}

func main() {
    web.Get("/(.*)", generate)
    web.RunFcgi("127.0.0.1:9980")
}