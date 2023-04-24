pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--game loop
function _init()
 _palette()
 _world()
 _player()
end

function _draw()
 world:draw()
 player:draw()
end

function update60()

end
-->8
--test
function _palette()
 pal({[0]=0,1,128,141,4,5,6,7,140,132,143,134,9,13,14,15},1)
 if time()<=1 then
  poke(0x5f2e,1)
 end
end

function _world()
 world={sp=64}
 world.draw=function()
  cls()
  for x=0,15 do
   for y=0,15 do
    spr(64,x*8,y*8)
   end
  end
  map(0,0,0,0)
  pal(2,0) pal(5,2) pal(11,5) pal(6,11)
  spr(68,40,40,3,3) spr(68,64,40,3,3,true)
  spr(71,32,66,3,3) spr(71,72,66,3,3,true)
  spr(73,56,66,1,3) spr(73,64,66,1,3)
  _palette()
 end
end

function _player()
 player={index_t={},index_s={}}
 for i=1,8 do
  local sp_t={s=i,x=8+(i*12),y=88,w=1,h=2,flip_h=false,flip_v=false,nar=true}
  local sp_s={s=i+32,x=8+(i*12),y=110,w=1,h=1,flip_h=false,flip_v=false,nar=true}
  if i==3 or i==5 then
   sp_t.nar=false sp_s.nar=false
  end
  add(player.index_t,sp_t) add(player.index_s,sp_s)
 end
 player.draw=function()
  for i=1,#player.index_t do
   if player.index_t[i].nar then
    sspr(8,24,8,8,player.index_t[i].x,player.index_t[i].y+11,8,8,player.index_t[i].flip_h,player.index_t[i].flip_v)

    sspr(8,24,8,8,player.index_s[i].x,player.index_s[i].y+3,8,8,player.index_s[i].flip_h,player.index_s[i].flip_v)
   else
    sspr(8,24,8,8,player.index_t[i].x-1,player.index_t[i].y+11,10,8,player.index_t[i].flip_h,player.index_t[i].flip_v)

    sspr(8,24,8,8,player.index_s[i].x-1,player.index_s[i].y+3,10,8,player.index_s[i].flip_h,player.index_s[i].flip_v)
   end
   ospr(player.index_t[i].s,player.index_t[i].x,player.index_t[i].y,player.index_t[i].w,player.index_t[i].h,player.index_t[i].flip_h,player.index_t[i].flip_v)

   ospr(player.index_s[i].s,player.index_s[i].x,player.index_s[i].y,player.index_s[i].w,player.index_s[i].h,player.index_s[i].flip_h,player.index_s[i].flip_v)
  end
 end
end

function setblack()
 for i=1,15 do
  pal(i,0)
 end
end

function ospr(sp,x,y,w,h,flip_h,flip_v)
 setblack()
 spr(sp,x-1,y,w,h,flip_h,flip_v)
 spr(sp,x+1,y,w,h,flip_h,flip_v)
 
 spr(sp,x,y-1,w,h,flip_h,flip_v)
 spr(sp,x,y+1,w,h,flip_h,flip_v)

 pal()
 _palette()

 spr(sp,x,y,w,h,flip_h,flip_v)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000444400000000000bbbb500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000449994000000000b5afff500bbb55000222220000000000055555000444440000000000000000000000000000000000000000000000000000000000
000000000aaffa40022222005affffb0bbbaaa502222222004449400555445500444444000000000000000000000000000000000000000000000000000000000
00000000af2ff2a022299220af2ff2a0baafffb029944990499aa940544aa4504aaffa4000000000000000000000000000000000000000000000000000000000
000000000ff44ff022944920fffeeff0af2ff2f0942442404aaffa905a2aa2a0af2ff2a000000000000000000000000000000000000000000000000000000000
0000000000ffff00942442400affff00fffeeff0444224404f2ff2f04aa44aa00ffeef4000000000000000000000000000000000000000000000000000000000
0000000000022000244224400bbffb000fffff0004444400fffeeff00aaaaa0000fff44000000000000000000000000000000000000000000000000000000000
000000000222220022444400666bb6d000d1d000011221009affff900044400007bbb60000000000000000000000000000000000000000000000000000000000
000000000222220000992000ab6666a0086868008888881094aaaa9006666b000f777f0000000000000000000000000000000000000000000000000000000000
000000000222220003333900fb6666f006d86d00118888109e999e900ab66a000f888f0000000000000000000000000000000000000000000000000000000000
000000000f111f0004933400f11111f00849480041888840f33333f00a111a000f808f0000000000000000000000000000000000000000000000000000000000
000000000080800004222400088088000f404f004ddddd40fdddddf00a808a000080800000000000000000000000000000000000000000000000000000000000
00000000008080000020200008808800004040000ff0ff00fdddddf0008080000080800000000000000000000000000000000000000000000000000000000000
00000000008080000020200008808800004040000ff0ff0000333000008080000060600000000000000000000000000000000000000000000000000000000000
00000000007070000050500005d05d0000b0b00005b05b0000707000009090000070700000000000000000000000000000000000000000000000000000000000
00000000049444000222220004449400088448000222220004444400022222000444440000000000000000000000000000000000000000000000000000000000
0000000009aa9900229929204499a940888118800229920049444440224442200444994000000000000000000000000000000000000000000000000000000000
000000000afffa002944442049affa904aaffa4029444400494aaa9024aaaa204aaffa9000000000000000000000000000000000000000000000000000000000
00000000ff2ff2f094244240af2ff2f0ff2ff2f0942442404a2ff2f04a2aa2a0af2ff2a000000000000000000000000000000000000000000000000000000000
000000000ff44f00244224200ffeef000ffeef00044224009ffeef900aa44a000ffeef9000000000000000000000000000000000000000000000000000000000
0000000000111000023332000ddddd00001b100001111100d99999d000bbb0000066644000000000000000000000000000000000000000000000000000000000
000000000f888f0004222400f11111f00f868f0004888400fdddddf00a111a000f888f0000000000000000000000000000000000000000000000000000000000
0000000000707000005050000d60d600009090000070700000909000004040000070700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000b33333b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000bbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d666d666022222222220000002222200000000000000222222222222000000002222220000000000022222222222222000000000000000000000000000000000
6666666627486142ce72000028d7c420000000022222777777777777000000227777772222222222274d614200eece7200000000000000000000000000000000
66d666d6277e97794772000024c71e20000222277777666666666666000022776666667777777777277e97795787477200000000000000000000000000000000
66666666272e92294272000024c71e20022777766666666666666666002277666666666666666666272e92295282427200000000000000000000000000000000
d666d666262e92294262000027777720277666666666666666666666027766666666666666666666262e92295282426200000000000000000000000000000000
6666666626bbbbbbbb6200002bbbbb2022776666666666666666666627666666666666666666666626bbbbbbbbbbbb6200000000000000000000000000000000
66d666d6262c21222c6200002bbbbb20252277666666666666666666222bbbb66666666666666666262c2122212ddc6200000000000000000000000000000000
66666666262c512b2c6200002bbbbb202b552277666666bbbbbbbbbb2552222bbbbb666666666666262c512b212ddc6200000000000000000000000000000000
6ddd6ddd26246e26246200002bbbbb202bbb5522bbbbbb22222222222bb555522222bbbbbbbbbbbb26246e262e28846200000000000000000000000000000000
dddddddd26bbbbbbbb6200002bbbbb202bbbbb5522222255555555552bbbbbb5555522222222222226bbbbbbbbbbbb6200000000000000000000000000000000
dd6ddd6d26222d12216200002bbbbb202bbbbbbb5555555b555555552bbbbbbbbbbb55555555555526222d1224d2216200000000000000000000000000000000
dddddddd26252d12216200002bbbbb202bbbbbbbb5bbb5b5555555552bbbbbbbbbbbbbbbbbbbbbbb26252d12d4d2216200000000000000000000000000000000
6ddd6ddd262628e22e6200002bbbbb2032bbbbbbbbb5bb5b555555552bbbbbbbbbbbbbbbbbbbbbbb26262de289822e6200000000000000000000000000000000
dddddddd26bbbbbbbb6200002bbbbb20b322bbbbb5bbb5b555555555322bbbbbbbbbbbbbbbbbbbbb26bbbbbbbbbbbb6200000000000000000000000000000000
dd6ddd6d26221222226200002bbbbb200b3322bbbbb5bb5b55555555b332222bbbbbbbbbbbbbbbbb262212222212226200000000000000000000000000000000
dddddddd262212c2c26200002bbbbb2000bb3322b5bbb522222222220bb333322222bbbbbbbbbbbb262212c22d12c26200000000000000000000000000000000
3bbb3bbb2622e242426200002bbbbb200000bb332222223333333333000bbbb333332222222222222622e24228e2426200000000000000000000000000000000
bbbbbbbb26bbbbbbbb6200002bbbbb20000000bb333333bbbbbbbbbb0000000bbbbb33333333333326bbbbbbbbbbbb6200000000000000000000000000000000
bb3bbb3b32222222222300003222223000000000bbbbbb0000000000000000000000bbbbbbbbbbbb322222222222222300000000000000000000000000000000
bbbbbbbbb3333333333b0000b33333b0000000000000000000000000000000000000000000000000b33333333333333b00000000000000000000000000000000
3bbb3bbb0bbbbbbbbbb000000bbbbb000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbb000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bb3bbb3b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18881888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88188818000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18881888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88188818000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0043000000000043000043000043000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0043000000000043000043000043000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0053000000000053000053000053000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4a4b4a4b00000063000063000063000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5a5b5a5b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6a6b6a6b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
