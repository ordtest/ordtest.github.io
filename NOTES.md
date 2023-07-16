# Notes



## SVG Notes


Q: How to specify the portion of the image to be rendered inside SVG:image tag?

<https://stackoverflow.com/questions/16983442/how-to-specify-the-portion-of-the-image-to-be-rendered-inside-svgimage-tag>


The are a couple of other ways I can think of to achieve the same effect in a more flexible way.

Use the clip or clip-path style properties along with careful positioning of the image on the page

Embed the image inside another `<svg>` element and use viewBox to select the part of the sprite you want.

The following example demonstrates the three main techniques above.

```
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="8cm" height="8cm" viewBox="0 0 400 400" version="1.1"
     xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <desc>Testing image elements</desc>

  <!-- Outline the drawing area in blue -->
  <rect fill="none" stroke="blue"
        x="1" y="1" width="398" height="398"/>

  <!-- Use preserveAspectRatio to show the top 64 pixels of the image (Stack Overflow logo) -->
  <image x="100px" y="100px" width="238px" height="64px" xlink:href="http://cdn.sstatic.net/stackoverflow/img/sprites.png"
         preserveAspectRatio="xMinYMin slice"/>

  <!-- Use a CSS clip rectangle to show a small facebook logo from the sprite.  Logo is at 150,1000 with dimensions 19x19.
       Positioned at 100,200 in the SVG (-50+150, -800+1000).  Could also use a clip-path for this. -->
  <image x="-50px" y="-800px" width="238px" height="1073px" xlink:href="http://cdn.sstatic.net/stackoverflow/img/sprites.png"
         clip="rect(200 100 219 119)" />

  <!-- Use a svg viewBox to show the facebook logo from the sprite.
       By setting our viewBox to the bounds of the logo, the renderer will scale it to fit the specified width and height.
       Which in this case is 19x19 - the same size as the sprite. -->
  <svg x="100px" y="300px" width="19px" height="19px" viewBox="150 1000 19 19" version="1.1">
    <image x="0px" y="0px" width="238px" height="1073px" xlink:href="http://cdn.sstatic.net/stackoverflow/img/sprites.png" />
  </svg>

</svg>
```

https://lists.w3.org/Archives/Public/www-svg/2008May/0011.html

Source-image offset/dimensions control for the image element

From: Erik Dahlström

Hello www-svg,

I'm wondering if there's interest in being able to control the offset,
width and height of a raster image to draw in the <image> element, to be
able to select exactly what part of the raster image to draw.

Something similar to CSS background-position [1], which allows you to pick
an arbitrary (x,y) offset of an image. This is often used to collect many
sprites in one image, to be able to load multiple resources as one.

In SVG it's only possible to use the 'preserveAspectRatio' attribute to
control the position for raster images. The 1.1 spec says that when an
<image> element references a raster image the implicit 'viewBox' has a
value of "0 0 raster-image-width raster-image-height". If there was a way
of controlling the implicit viewBox it would be possible to draw raster
sprites more efficiently.

It is possible to control all of this in SVG, using for example the clip,
mask or pattern features. However, each of these comes at the price of
additional processing, since they are meant to cover more advanced
use-cases as well.

Thoughts?

