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
