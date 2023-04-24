pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--loop
function _init()
 _palette()
 _world()
 _customizer()
 _player()
end

function _draw()
 world:draw()
 customizer:draw()
 player:draw()
end

function _update60()
 customizer:update()
end
-->8
--functions
function _palette()
 pal({[0]=0,1,128,141,4,5,6,7,140,132,143,134,9,13,14,15},1)
 if time()<=1 then
  poke(0x5f2e,1)
 end
end

function _customizer()
 customizer={arrow={x1=world.preview.x,y1=world.preview.y+10,x2=world.preview.x+world.preview.w,y2=world.preview.y+40,loc=1}}
 customizer.draw=function()
  rect(customizer.arrow.x1,customizer.arrow.y1,customizer.arrow.x2,customizer.arrow.y2,12)
  rect(customizer.arrow.x1+1,customizer.arrow.y1,customizer.arrow.x2-1,customizer.arrow.y2,12)
  rect(customizer.arrow.x1,customizer.arrow.y1+1,customizer.arrow.x2,customizer.arrow.y2-1,12)
 end
 customizer.update=function()
  if btnp(2) and customizer.arrow.loc>1 then customizer.arrow.loc-=1 elseif btnp(2) and customizer.arrow.loc==1 then customizer.arrow.loc=4 end
  if btnp(3) and customizer.arrow.loc<4 then customizer.arrow.loc+=1 elseif btnp(3) and customizer.arrow.loc==4 then customizer.arrow.loc=1 end

  if(customizer.arrow.loc==1) customizer.arrow.y1=world.preview.y+10 customizer.arrow.y2=world.preview.y+40
  if(customizer.arrow.loc==2) customizer.arrow.y1=world.preview.y+45 customizer.arrow.y2=world.preview.y+65
  if(customizer.arrow.loc==3) customizer.arrow.y1=world.preview.y+70 customizer.arrow.y2=world.preview.y+83
  if(customizer.arrow.loc==4) customizer.arrow.y1=world.preview.y+84 customizer.arrow.y2=world.preview.y+90
 end
end

function _player()
 player={sp=1,x=world.preview.x+9,y=world.preview.y+8,w=1,h=2}
 player.draw=function()
  osspr(player.sp,player.x,player.y,player.w,player.h,5)
 end
end

function _world()
 world={preview={x=40,y=10,w=9*6,h=17*6}}
 world.draw=function()
  cls(3)
  rectfill(world.preview.x-2,world.preview.y-2,world.preview.x+world.preview.w+2,world.preview.y+world.preview.h+2,0)
  rectfill(world.preview.x,world.preview.y,world.preview.x+world.preview.w,world.preview.y+world.preview.h,13)
 end
end

function osspr(sprite,x,y,w,h,scale,flip_h,flip_v)
 sx, sy = (sprite % 16) * 8, flr(sprite \ 16) * 8
 pal(1,0) pal(2,0) pal(3,0) pal(4,0)
 pal(5,0) pal(6,0) pal(7,0) pal(8,0)
 pal(9,0) pal(10,0) pal(11,0) pal(12,0)
 pal(13,0) pal(14,0) pal(15,0)
 sspr(sx,sy,w*8,h*8,x-scale,y,w+(scale*w*8),h+(scale*h*8),flip_h,flip_v)
 sspr(sx,sy,w*8,h*8,x+scale,y,w+(scale*w*8),h+(scale*h*8),flip_h,flip_v)
 sspr(sx,sy,w*8,h*8,x,y-scale,w+(scale*w*8),h+(scale*h*8),flip_h,flip_v)
 sspr(sx,sy,w*8,h*8,x,y+scale,w+(scale*w*8),h+(scale*h*8),flip_h,flip_v)

 pal()
 _palette()
 sspr(sx,sy,w*8,h*8,x,y,w+(scale*w*8),h+(scale*h*8),flip_h,flip_v)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000044444000000000004444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700444999400444440044499940044444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaffff4044499940aaaffa40444999400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000af2ff2a0aaaffa40af2ff2a0aaaffa400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700fffeeff0af2ff2a0fffeeff0af2ff2a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000fffff00fffeeff00affff00fffeeff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000006660000fffff00066ff6000fffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000066666000066600066666660066666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000f666f0006666600f66666f0666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000f666f000f666f00f66666f0f66666f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000f111f000f111f00f11111f0f11111f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008080000f808f0008808800f88088f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008080000080800008808800088088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000008080000080800008808800088088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007070000070700007707700077077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
