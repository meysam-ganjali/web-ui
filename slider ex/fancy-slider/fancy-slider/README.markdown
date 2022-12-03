# Fancy Slider

A Pen created on CodePen.io. Original URL: [https://codepen.io/suez/pen/wMMgXp](https://codepen.io/suez/pen/wMMgXp).

Based on dribbble shot by Kreativa Studio - https://dribbble.com/shots/2375246-Fashion-Butique-slider-animation

Fullscreen please. Looks best in Webkit browsers, because clip-path not working in FF/IE without SVG fallbacks, which I don't want to use in this demo. Not responsive atm, I will figure out something soon.

Features:

1) Clip-path for image masking rectangle border (webkit only).

2) Blend-mode for this mask.

3) Smart color system, just put your color name and value into sass map and then add proper class with this color name to elements and everything will work!

4) Cool credits side-menu (click small button in the center of demo).

5) Vanilla js with just < 200 lines of code (basically it's just adds/removes classes).

6) Reusable/configurable. I will add some comments to css/js code if I don't forget about it :D


P.S. - background-attachment: fixed does not working with transforms, so I tried to achieve completly static bg-image during mask movement with translateY, but bg-image was "jumpy", so right now bg-image simply goes up when mask rotates, which is ok for me.
