
::paths&settings
@SET inkscape=%cd%\tools\Inkscape\
@SET ImageMagick=%cd%\tools\ImageMagick\
@SET svg_in=%cd%\svg_no_circle\
@SET png_out=%cd%\png_no_circle\
@SET resized_out=%cd%\out_no_circle\
@SET png_DPI=20
@SET reversecolor=-colorspace HSI -channel B -level 100,0%  +channel -colorspace sRGB

::create/cleanup output dir
@md %png_out%
@del %png_out%*.png
@md %resized_out%
@del %resized_out%*.png

::convert svg to PNG
start /w "01" %inkscape%inkscape "%svg_in%01-play.svg" -o "%png_out%01-play.png" -d %png_DPI%
start /w "01" %inkscape%inkscape "%svg_in%01-play.svg" -o "%png_out%01-play.png" -d %png_DPI%
start /w "02" %inkscape%inkscape "%svg_in%02-pause.svg" -o "%png_out%02-pause.png" -d %png_DPI%
start /w "03" %inkscape%inkscape "%svg_in%03-stop.svg" -o "%png_out%03-stop.png" -d %png_DPI%
start /w "04" %inkscape%inkscape "%svg_in%04-empty.svg" -o "%png_out%04-empty.png" -d %png_DPI%
start /w "05" %inkscape%inkscape "%svg_in%05-prev.svg" -o "%png_out%05-prev.png" -d %png_DPI%
start /w "06" %inkscape%inkscape "%svg_in%06-next.svg" -o "%png_out%06-next.png" -d %png_DPI%
start /w "07" %inkscape%inkscape "%svg_in%07-step.svg" -o "%png_out%07-step.png" -d %png_DPI%
start /w "08" %inkscape%inkscape "%svg_in%08-open.svg" -o "%png_out%08-open.png" -d %png_DPI%
start /w "09" %inkscape%inkscape "%svg_in%09-empty.svg" -o "%png_out%09-empty.png" -d %png_DPI%
start /w "10" %inkscape%inkscape "%svg_in%10-audio.svg" -o "%png_out%10-audio.png" -d %png_DPI%
start /w "11" %inkscape%inkscape "%svg_in%11-subtitle.svg" -o "%png_out%11-subtitle.png" -d %png_DPI%
start /w "12" %inkscape%inkscape "%svg_in%12-empty.svg" -o "%png_out%12-empty.png" -d %png_DPI%
start /w "13" %inkscape%inkscape "%svg_in%13-sound_on.svg" -o "%png_out%13-sound_on.png" -d %png_DPI%
start /w "14" %inkscape%inkscape "%svg_in%14-sound_off.svg" -o "%png_out%14-sound_off.png" -d %png_DPI%
start /w "15" %inkscape%inkscape "%svg_in%15-sound.svg" -o "%png_out%15-sound.png" -d %png_DPI%

::merge images into line
%ImageMagick%magick.exe montage -background none -mode concatenate %png_out%01-play.png %png_out%02-pause.png %png_out%03-stop.png %png_out%04-empty.png %png_out%05-prev.png %png_out%06-next.png %png_out%07-step.png %png_out%08-open.png %png_out%09-empty.png %png_out%10-audio.png %png_out%11-subtitle.png %png_out%12-empty.png %png_out%13-sound_on.png %png_out%14-sound_off.png %png_out%15-sound.png -tile 15x PNG32:%png_out%toolbar.png

::resize result
%ImageMagick%magick.exe convert -geometry x32 %png_out%toolbar.png PNG32:%resized_out%toolbar_032.png
%ImageMagick%magick.exe convert -geometry x40 %png_out%toolbar.png PNG32:%resized_out%toolbar_040.png
%ImageMagick%magick.exe convert -geometry x48 %png_out%toolbar.png PNG32:%resized_out%toolbar_048.png
%ImageMagick%magick.exe convert -geometry x64 %png_out%toolbar.png PNG32:%resized_out%toolbar_064.png
%ImageMagick%magick.exe convert -geometry x128 %png_out%toolbar.png PNG32:%resized_out%toolbar_128.png
%ImageMagick%magick.exe convert -geometry x256 %png_out%toolbar.png PNG32:%resized_out%toolbar_256.png

::resize result and make it white
%ImageMagick%magick.exe convert -geometry x32 %png_out%toolbar.png %reversecolor% PNG32:%resized_out%toolbar_w032.png
%ImageMagick%magick.exe convert -geometry x40 %png_out%toolbar.png %reversecolor% PNG32:%resized_out%toolbar_w040.png
%ImageMagick%magick.exe convert -geometry x48 %png_out%toolbar.png %reversecolor% PNG32:%resized_out%toolbar_w048.png
%ImageMagick%magick.exe convert -geometry x64 %png_out%toolbar.png %reversecolor% PNG32:%resized_out%toolbar_w064.png
%ImageMagick%magick.exe convert -geometry x128 %png_out%toolbar.png %reversecolor% PNG32:%resized_out%toolbar_w128.png
%ImageMagick%magick.exe convert -geometry x256 %png_out%toolbar.png %reversecolor% PNG32:%resized_out%toolbar_w256.png

pause

