#!/bin/bash
#
# This file encrypted at Wed 28 Aug 2024 07:38:34 PM CST by
# +------------------------------------------------------+
# | Author  : RMBL VPN                                   
# | Reguon  : Indonesia ( Asia Tenggara )                
# | Telegram: https://t.me/rmblvpn1                      
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/rmbl
# Sponsor this project:
# -  https://t.me/rmblvpn1
# -  http://rmbl.my.id

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @RMBL VPN / rmbl@rmbl.my.id
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @RMBL VPN / rmbl@rmbl.my.id
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "Anjay password nya mana 😂😂😂😂😂😂😂😂 Rasenggan (Ah lupa ga ada emot Rasenggan) pakai api aja dah 🔥🔥🔥 menyala abangkuh | en:8Q:yA:Uz:gf:JB:79:VF:NM:nN:iQ:fe:ir:ON:yL:Bu:Fl:rP:Ur:4B:l9:g5:o1:YE:Jh:lf:GV:ys:fj:Wl:Ep:Bl:Pl:EL:Op:Qu:Wh:29:47:Xq:6M:CW:yL:fM:jb:hj:pa:XR:7J:xH:EF:IT:pP:z1:hA:7G:Gp:9c:GS:RT:no:6H:J5:VX:tD:dE:AI:8e:xA:wu:kR:D3:2Y:vn:lh:qw:7A:bY:ON:wk:xt:nm:GM:aJ:ue:fU:jj:yt:IG:OM:af:Sp:x1:IM:4H:0Q:pm:aR:0f:vV:H9:d7:J5:9Z:pH:EM:P9:yJ:Sj:2I:Ru:DI:F9:mo:W0:gj:8P:hk:yO:Cs:gi:pR:fU:FK:Kk:9Z:a3:OS:w7:T8:mT:3x:v7:km:4z:Gd:9U:wm:mz:G3:PW:CX:Dv:h0:R0:OB:BG:fG:fz:LH:iJ:hH:Vi:1l:v2:Ss:aW:p5:oe:MD:cH:qW:RZ:tJ:f7:68:rR:RJ:E9:5h:6R:A4:rT:Zn:uY:7a:LP:zN:XZ:qT:yt:7W:ig:nJ:YA:t9:Mb:w4:vO:Zx:qh:ny:74:qT:AK:IY:hw:rB:m5:3H:5h:ZD:oS:6J:QC:Jo:l7:h2:vy:5O:ZM:YJ:h9:Xq:DZ:jc:Vy:BU:5A:rr:p1:tk:sM:Vk:oO:cl:4X:mF:1Q:ny:ds:36:Ax:xC:R0:pW:Li:CX:AC:Ib:nN:qy:hE:IO:Yd:ny:tP:l2:oe:wX:8E:1c:9h:AD:Xz:QV:GH:JO:e9:ID:Ss:87:Vh:jf:q1:5i:TG:Ke:hl:Vm:iM:IU:NV:0F:zJ:KX:zJ:Li:Ol:vA:YN:fn:w7:f7:8n:BV:hX:8x:mU:RZ:eH:a4:FI:Zi:s4:d5:Wa:ud:eS:sc:lc:Xx:UN:Fz:0P:RZ:lU:IO:Dg:lV:3q:QV:Re:ds:49:Uo:8T:AC:OV:QB:LV:GG:n2:ZL:4U:1H:LZ:Ir:dH:y5:uS:Ft:Fv:rB:ar:WF:HO:EU:qG:Tm:uq:ss:my:ca:8k:Bs:DB:Rv:Ew:ZW:jI:mM:DD:Ue:Dz:7I:1O:MA:eH:gv:Yg:9V:UC:hr:ku:3u:AI:E2:Br:9j:fz:4t:iK:XC:2Z:EG:cC:Bj:dD:a5:bk:MG:hc:Dj:Qv:3C:4g:yJ:nU:S4:5y:qX:2r:Gs:6m:pa:ue:fP:43:0e:lY:oP:v0:ex:Ut:ct:gr:Hy:cS:ct:Wo:66:aN:93:46:Dw:OX:pU:he:B5:yb:Kt:IT:CM:v4:X1:dw:8k:jI:cx:n2:VH:BV:92:FL:od:RI:IM:sm:QV:sp:Vv:np:XM:Nt:TW:YN:nr:sI:lM:gH:P6:d9:MC:lv:8k:ef:9U:DS:5C:NH:l2:gQ:0V:Me:Ph:0e:XB:fl:hJ:BL:tQ:kr:2n:uA:0g:Vv:D8:L4:IO:dC:Ym:MQ:Po:e2:uY:sG:RJ:3T:ab:YD:9S:uW:5H:L4:6S:lg:WA:Yn:Hb:Py:lc:0m:tv:CV:qH:Fk:SV:Z1:xx:ze:ol:KB:or:ud:GT:k0:OH:Ze:NJ:Zx:c5:QQ:9b:vD:Z9:Nk:yI:AT:Nk:7d:tp:lj:is:UX:1I:2s:lc:OL:Xp:FK:Qy:16:Vf:LG:Zp:8B:6m:d5:Xy:KG:an:pi:qe:wv:GM:Jg:LH:BJ:Ig:wT:sS:IT:OJ:cR:Ug:Gk:Rn:jv:YH:rt:Ph:Vc:tZ:7V:bL:zj:lm:oO:Wk:YG:6V:Em:qF:zA:ap:Wb:Y1:yj:ZZ:DA:UW:ek:Kw:B4:1Q:td:L0:Ii:1r:ab:jE:yE:86:K3:Hl:xX:eg:zg:Js:U3:SM:Kp:Mk:Oq:yx:O0:qQ:Z1:1r:Vb:SW:SB:kd:nt:kj:QO:9q:p6:Se:gT:AX:Ug:0O:Sp:k7:yX:Kf:3g:AV:OT:HO:0s:Rj:VH:hi:nu:ul:su:cX:9w:hA:23:du:Hh:Kb:S0:Ae:yC:Q2:FT:LB:Kp:FW:Lt:d6:LO:ne:Qc:Pi:FO:9W:Gm:5N:gO:qs:8R:0W:63:37:P6:Et:4d:Bk:MT:bW:Py:Y2:6s:vI:Y3:zC:3w:JU:5n:HC:gg:4u:Wr:ot:WA:bW:1v:cy:Od:uz:xy:r0:sj:NW:0a:OM:i5:Z5:IQ:mZ:4K:Rl:tN:1v:XJ:wJ:S4:g6:BH:3H:3n:UY:sY:6g:7N:LM:cu:6w:vx:lW:Q4:Mk:ot:pw:Z7:Ou:uI:CY:Sm:GE:JH:Tb:HT:I8:mh:Bv:Wf:Jg:R7:Kv:j7:bt:BY:EL:4g:nP:EN:uB:ky:hJ:1t:jq:2l:Fj:gJ:HB:DR:Ov:UE:B5:Yn:Ky:1u:Kk:Qj:V0:83:Ud:mY:kS:oE:er:La:cz:gI:lZ:Vy:xH:eN:SC:UO:ol:K1:kq:W2:B6:nS:0J:JW:9Z:tl:z4:aX:2i:Hg:lP:4t:ZI:2N:OY:PP:Cx:fp:ed:jW:xA:ET:f1:qf:bQ:UO:9D:Ly:Xz:ZT:J8:5P:0g:79:pV:Ma:ah:be:kQ:ym:Vd:NO:qR:15:yC:07:n7:f2:QB:qu:Zz:FE:J2:dQ:IM:y2:Pi:yY:bs:5B:Pi:p2:H8:4m:is:mg:C9:2w:Kn:aI:oH:Qu:lr:tr:jm:vz:zT:Ql:C9:eu:4M:hd:rg:8U:oi:fZ:UD:0P:GF:jL:Pg:Ik:UU:w4:Ko:0W:jx:Ky:Cx:xt:vJ:si:qa:6q:rv:CV:Il:xv:B0:v2:cn:iu:gC:8f:xm:5u:1s:Fx:t2:ge:en:O8:y2:PF:Ev:mr:Kj:Dh:Ph:Zx:He:jj:iD:sQ:rQ:ow:xE:V2:Ua:ng:Ye:UR:y8:Du:CJ:qA:DX:HA:si:If:Yr:mf:2N:iW:oh:RZ:ex:7l:EH:vu:7L:D1:56:UX:Ct:pp:Y4:kD:WJ:PD:NU:i6:R1:G4:Xa:96:Y1:Ga:LX:hI:BX:jY:Tt:gq:uH:re:cw:hD:YU:o9:cw:j7:9f:bE:ln:I7:3D:Q4:Lw:f1:OL:xq:sv:7P:WH:77:NJ:FB:CL:sB:7T:JR:Y0:t2:WJ:Xb:Dd:Kz:oh:be:L1:NV:kD:CM:45:Hc:MM:q0:uo:nN:oh:JQ:EK:O3:l5:FS:FU:vB:Xt:R3:Uz:NZ:Wd:eT:5i:vS:yd:JY:FF:Q0:7w:l5:rf:Vc:NW:4i:W8:Pw:5p:YN:Ca:yc:lA:wq:eT:mf:fE:jf:6p:3A:Ie:LB:Oy:xn:HS:Rm:9C:XC:H0:ve:RU:T5:JS:Xy:0Q:Hu:t4:Lr:bh:vJ:Cp:vs:k8:yh:fL:Ch:Ry:PS:AS:tX:0e:dE:op:wa:80:vJ:sW:Ct:XV:HF:uQ:li:en:vE:EO:iu:q7:ow:cm:vN:g3:PH:xW:J2:lh:eM:Va:yJ:5I:1g:0z:Ou:MA:9B:Pe:m5:7i:DO:oO:8d:8r:Ai:HX:Um:f9:eU:Bc:5B:cE:1Y:Yj:Eu:Ni:QY:ap:Vr:a6:ik:l5:mK:z5:eA:Ap:Dg:yD:Ju:FW:DY:tQ:WK:ng:q9:0P:Ix:Y2:YG:es:O3:jy:9Z:cl:p6:gh:bl:uf:0Y:7M:21:xI:7p:6e:VI:TD:Gz:cX:Me:c1:Dc:jz:Lk:H5:9j:ei:lN:5g:v3:yf:gH:JU:UA:sa:jd:SB:vZ:tF:CH:iQ:mx:Ko:Vc:qq:ox:L5:mN:Im:U3:6S:HA:ya:fc:Rp:Sw:zO:Ye:hd:5j:FO:Yi:BR:BF:2c:4a:Yi:bL:CJ:rX:nG:Lz:Fj:Oe:0p:Wh:AJ:tV:WO:sM:V2:Rm:dK:JS:q0:od:bG:5U:yP:Pf:Sb:zJ:wL:2E:nM:hk:4P:8J:KO:vb:cF:dG:41:XF:3s:tI:7q:Lm:kX:n2:aD:DM:0T:1s:LE:gK:wP:3q:eT:YS:NZ:WQ:kn:ED:4C:i5:FI:EX:CM:Ce:s7:xD:4X:UU:KI:dR:sn:s2:a4:bj:89:Aj:Rj:bz:6S:tf:yR:Xh:LP:OL:YT:Xg:qB:gg:FU:IB:L7:pL:u2:Ih:oL:Tj:0C:A8:HR:Cq:4j:IO:G1:Fd:8Q:0x:3u:Ip:0S:LI:gW:MU:kE:T0:WE:Yf:kY:QD:CJ:oY:rS:yY:EW:bl:rv:O5:Ql:Ji:WP:t8:L7:Ik:Cm:3f:Lj:iJ:0h:vC:F6:B4:Eg:ch:Ns:gE:zU:Mn:CX:h8:N1:4X:VW:CZ:GQ:sv:Rh:xj:Yk:bA:Iw:uq:WW:3F:VY:wY:gJ:Wa:s8:Em:Wa:nB:m9:Ri:3k:SI:B5:Es:hz:V0:AM:LR:Mh:F3:9g:7e:u0:Uy:np:6a:VI:YA:6a:6o:8Q:XL:fe:zU:nK:lY:2T:eJ:17:SY:AY:0h:38:xW:rc:kD:kK:RM:MO:SU:WZ:86:3B:3u:u6:Nv:0J:xe:rL:MJ:o1:dF:UY:Py:vM:zB:94:A0:9V:nc:NQ:vB:lq:bh:wQ:si:SI:TG:4c:YX:6o:vl:8g:Ox:co:WY:Wp:jU:PP:v1:VO:fI:i9:iS:LW:cv:Ds:my:8C:lS:4o:3d:27:ye:xO:LK:yR:qU:4q:pD:ru:2y:ji:wn:fg:C6:Gs:dP:D8:HI:YR:K9:wP:Dd:6G:Nf:yE:7I:Iu:p5:Fi:Ns:uN:Vy:eO:D4:zE:5q:kE:V8:so:tY:BG:Vp:Jm:f0:bT:fW:nQ:VC:KY:Hb:xC:D4:MN:bm:H4:gy:0Z:vg:B3:fl:Qe:zc:8I:it:fZ:yN:Jl:8y:YZ:xX:29:1h:or:zh:ii:GR:JX:ma:Vl:t6:L0:HU:xS:VB:Lg:jz:FY:u6:L7:SS:PQ:zR:Vl:7a:pR:y6:L3:oH:h5:UO:YA:s9:xI:lz:Cg:rs:5w:6y:WL:HD:ca:Oa:wW:cF:KK:mf:zD:BI:Va:de:jY:RI:Q3:yj:tT:b5:c9:5f:Ps:q7:HX:Wi:j9:qy:Mk:AK:SB:IU:vy:L9:Bp:fx:hZ:fs:J4:Av:ax:zu:BB:Kh:6n:3q:q4:Hi:2c:bi:8z:9b:z7:ah:4r:6b:4z:ul:JV:1O:NI:5M:DQ:BJ:Gl:fx:Q3:mL:LO:fr:5D:y6:dg:mP:pb:vr:Cl:84:pZ:ha:gK:Et:gw:j7:wf:L8:Ku:ER:jN:ol:Ln:Cp:6U:Fe:s7:SZ:xV:tt:Rx:ww:xi:3g:se:RL:3H:TK:1n:n4:oz:pY:1n:5h:gM:Wh:1g:4v:Ef:ud:9y:35:0e:kO:ud:eU:CC:mP:EC:R5:4A:sn:3M:oW:hP:Wu:KA:uo:pJ:R2:wA:xd:Bf:8o:Pt:v8:OQ:Be:qt:k9:3a:A4:4d:i6:Bf:zD:we:5o:Xx:Oq:Xz:Uc:zI:Ey:vd:wT:z6:QG:fE:wU:Tz:kN:0F:Z7:D7:lQ:m5:q1:R7:zn:f0:GA:0i:do:zF:Mf:r3:vv:BU:Dv:P9:ro:UX:Iz:ym:hi:dr:Tb:V5:lG:zu:Ck:KF:0U:80:kU:t0:XY:SZ:8V:3u:RP:3e:bB:n4:a7:uF:Mv:1U:yO:Eo:Li:YH:Ig:5E:N3:v4:dc:C7:Iv:mc:06:Ew:Wo:5E:Vg:ft:i8:R8:26:vV:XC:kv:eT:wd:XK:B2:vf:Xo:YJ:Pl:TZ:Wu:in:sJ:jq:zm:9v:RI:WH:xN:O2:rU:qy:1t:C7:DM:qX:LG:YW:Nd:cz:4K:ao:hv:JX:FW:qe:Nx:em:uY:i6:u4:9J:gR:1w:gO:0q:dK:uP:fy:u8:Ko:Xc:rI:0v:OQ:GH:QX:CE:zC:k8:lp:42:8W:R6:oe:q8:WG:zr:gG:5f:r8:Xp:Me:HI:hF:Bi:H3:gl:sL:CC:CB:ac:wI:Cj:mk:6J:vD:24:BE:1P:AU:Wi:3M:fr:s0:R7:g3:nG:OE:Q4:P7:dV:3Z:1y:j3:0n:HW:0W:tB:6x:zZ:LM:Il:yk:jF:cB:HY:ix:J2:wZ:cY:i9:VM:M3:Tl:Rq:Tx:wH:xi:fI:qL:RW:Mu:V8:wW:m0:N1:JU:DZ:PC:Pg:nz:s9:DN:9f:eE:E0:kR:JB:VV:RN:Y5:F8:Y0:4r:hY:0v:NT:Yw:74:Zl:aT:v0:qE:ti:bw:a6:sJ:QC:Cn:Nr:ma:km:mJ:HX:jt:ek:6k:n0:HW:N4:7R:ru:Vq:JU:yq:8t:eR:HZ:AC:Aj:ql:de:Yf:4n:DD:IR:8I:uV:ej:W3:5q:60:Yu:3Z:lV:cx:7U:Hi:dx:LT:uE:Dx:Ek:Mn:Kv:y2:a1:7l:rj:ZN:4S:N8:LF:qI:qA:DZ:E8:VV:R9:ND:uK:kZ:RI:jw:3t:ex:Dr:wW:8T:Ob:Hi:d5:dW:yx:Pw:y0:j5:dw:6j:x0:kG:Il:XA:3o:D7:sI:GW:bA:l5:mv:kx:i5:lr:or:Bh:vp:KQ:Ot:D7:cZ:Qu:T0:Wv:wW:lg:RM:B7:mf:9M:tN:hs:tL:zD:Tb:E8:9j:8g:0B:0Y:uq:zX:Mo:JI:MW:Z2:l5:PE:PM:8U:sZ:qO:4O:Hh:VD:vO:sU:7l:3p:gW:gh:Vh:8i:ca:Bw:KG:qP:wi:Ji:4e:3T:pr:8y:K0:WF:Cw:e4:JZ:Tv:Ob:qd:2L:Uw:pW:tX:JJ:NV:wY:0w:2p:be:3X:Zh:E1:2o:Xx:Qw:5J:KN:IV:GT:3S:OX:hD:Eg:z7:Qi:cD:DG:FM:3U:2d:pE:eH:AL:im:tg:hZ:3E:3y:Ar:XE:vs:a3:ld:6T:8n:UV:Cq:df:jV:cu:Yh:oG:qu:wY:xr:LC:xO:1X:IF:zT:dj:Eo:Dk:gK:aV:ty:XB:u2:MN:QN:kh:et:au:71:Tm:du:QD:LS:o2:FO:Ez:4Q:Du:KK:D7:nY:pq:Sf:MX:vP:1T:ve:N4:7o:KI:ak:l7:4D:SR:Bu:n0:8w:yg:0n:a4:t0:EB:jp:ig:2Y:sL:eu:Pe:Il:kH:Nw:v0:lc:mV:nc:As:UK:jy:8K:sn:4f:kU:cD:yq:kb:Qg:zH:KG:ir:ng:aM:eW:xt:T8:YI:Ra:7P:pl:9r:eA:lv:f3:ZV:mb:Vc:S6:L6:Zp:Id:gu:wZ:hJ:R2:d1:XP:yD:JC:Hd:Iz:kq:zx:pD:aF:Fe:X9:jA:WU:X1:r5:3x:Kj:Gd:L4:oj:cF:Yt:dh:dj:2H:p9:p4:Z9:eL:FO:KW:5k:JS:FC:f8:CV:ay:LA:JF:pk:DJ:3I:SR:uI:FK:FQ:1j:lz:t1:4k:zW:2y:KE:9T:iC:24:Ti:rQ:bp:RI:to:nK:g3:D0:pG:sY:oY:vx:4d:cg:TM:k3:3l:NV:Ah:pF:EW:3X:9O:oo:Du:vG:fQ:ct:TP:J4:fV:ts:PL:9D:9W:7A:vH:q1:6H:X9:uS:sB:YK:rv:cz:cu:i5:iS:GA:cA:i2:5s:v7:9w:77:Wd:OK:80:9i:Q1:dR:CD:sJ:Vx:Gk:lq:Xu:1d:F4:ae:N4:la:w8:at:8x:fa:V9:Wc:7k:fw:Jh:XF:Fh:Y1:o3:ys:NN:2T:Jc:IP:cd:5a:c5:lB:Oo:9e:PB:qZ:WP:Zn:2l:Bd:VY:zP:j8:El:EO:Oo:3A:5p:WZ:2S:J0:Nr:53:Sj:O9:Vd:82:mP:eg:gu:g2:Dz:QI:NU:aU:PU:8D:SB:P6:a7:yo:qa:xq:bJ:wV:94:Sg:Af:37:Qy:zJ:Kp:rN:w3:GZ:Vz:IT:56:lN:aq:9k:51:wz:3i:xR:D3:nO:UW:5i:mw:PF:IK:oE:c8:IW:ev:fs:oY:Z0:9N:Cb:Fx:B9:9O:j5:vB:xP:pK:Fq:Je:Xg:o2:6x:UO:mc:aN:HM:9Z:gY:JK:JM:8u:hE:pn:Tj:1F:y7:q6:6v:4u:uO:SE:PA:VP:Uu:K8:gH:KL:03:Xj:za:yS:xO:3c:wK:zE:DO:xS:Cj:Qr:Df:02:fL:w5:jp:ah:Cr:Cg:So:E6:tX:OP:Pn:5e:P8:8G:cQ:KN:i2:bp:jl:6E:OE:Ew:lo:3F:oz:cv:Ui:tX:81:Sk:DK:pu:6U:co:7w:he:3c:w7:jn:Y9:NZ:jo:PI:Tl:eh:VT:g3:1f:SS:zU:sn:RL:v8:KR:gL:W9:62:vc:aT:0l:HY:Bw:RV:80:jt:5Q:HE:Ky:Hc:ST:if:gO:Hp:Q8:47:Wj:Cv:jr:tl:3i:cL:Tv:4j:Ff:6X:Lr:de:oY:Hh:NF:F8:FU:jx:E6:wv:2e:yM:I8:UJ:g3:8g:JJ:uW:N6:6x:K0:i8:5v:5y:7p:bX:o9:oK:8R:BZ:WC:YL:75:ND:5P:sD:tN:F6:S6:rH:qN:s9:2K:2E:GC:aL:ua:Xv:6a:a5:Ix:HQ:yv:hp:Wb:uz:dG:9y:fj:mI:af:Ih:Iu:Ob:Wa:Ur:Lr:gL:El:91:ZO:la:Yo:69:jn:CA:1A:aa:2b:0k:aD:FE:zR:FF:N1:rR:hK:jK:Vl:vD:nT:tI:cq:mJ:dR:l1:fk:iT:o4:ZY:nE:tG:bH:V2:XG:II:kI:5u:lv:J0:Ak:Xm:Gg:gg:Jo:NR:oH:1d:sC:7N:to:S8:kL:EL:6C:xE:8G:91:ED:8i:7t:5o:XS:cD:tg:zv:sp:CO:MD:Cy:oR:pO:mL:7Q:oq:sL:nr:fn:XF:0R:oO:eV:HH:iO:0M:2I:7g:wN:ew:Uc:jU:v7:V0:1u:95:Aq:s2:ue:Ed:o5:fV:t3:yB:RD:Hk:Kt:Pl:2x:Ot:IL:yl:3m:T8:jk:IS:At:Dl:UZ:Vr:Uj:rc:9U:qK:xE:Ni:Po:xJ:eF:rR:IG:jm:G0:bL:Jf:pz:Qo:6R:oy:Jl:yY:cC:oI:bl:Mu:Ab:T4:QU:c5:cg:7F:Cl:R8:p5:GP:OA:Fy:NY:GD:aR:zg:wf:J1:Vj:IC:ee:Ob:sN:RA:0P:aB:aF:iA:rB:lw:yD:am:O8:4H:4a:0w:oO:IT:XN:EF:xx:oV:A1:MV:dO:p8:Av:7V:ll:Z5:vy:aW:hQ:mh:dw:Ve:0E:DM:7d:iB:FC:WU:iJ:mx:Hp:OX:04:gf:si:RW:Ab:yr:ap:2U:ms:HC:C7:ha:Py:c9:yJ:BX:Xl:WR:Hb:Ql:6g:Di:dn:1h:05:uN:td:ZV:qE:j0:cS:a0:W8:Mf:a5:Kr:Jr:0m:gk:77:XE:JG:G3:vv:q9:Jw:O6:gg:Gv:3l:w6:bQ:8i:vB:Th:E2:sm:tA:mr:wV:6G:aJ:ES:7l:aw:M0:zt:2F:cI:JL:CW:Vu:qN:Mp:H1:6h:ws:iV:zQ:69:K3:Zk:YP:ad:j1:eT:rB:m3:od:Kp:aA:Iy:52:Vt:1m:Z0:SZ:qq:mh:7v:Er:fk:lc:yd:lU:Bz:2P:6Q:dl:L8:Nf:BJ:Nu:IQ:3d:Vm:2O:cX:8l:rF:PM:CY:Cm:gb:2W:eU:16:2y:wX:QZ:ai:eG:UT:TF:dn:ca:lw:dJ:6D:VT:xX:LQ:x1:kp:U3:Da:5P:TC:HD:x9:IJ:8L:mR:yQ:Ku:PJ:65:SZ:5H:Cq:BM:Tj:jG:st:qg:ot:eK:Hq:bW:51:ux:5o:Cn:Nt:E2:EP:8k:f0:ff:35:6n:99:F0:4G:Uf:g6:xW:zo:t9:3u:OG:Bx:OV:Wu:z7:uU:GR:Uq:cS:qk:YS:Ap:vt:cb:1i:VO:xD:7T:39:6u:FW:x7:Xx:xf:qR:nM:1b:uU:gt:XT:65:kH:Sd:Do:uG:3E:7n:KS:r7:DJ:0V:Yd:hA:6v:iq:0N:mg:5J:GL:cz:u8:Lm:p0:iy:F7:Nn:0M:Z1:di:xf:hN:mP:NY:tN:M4:5D:mL:Qy:9e:L0:Si:P4:ET:eZ:RK:BV:2n:Ak:qt:YP:5a:KS:65:Z3:rZ:MB:vn:qC:XV:Ii:nV:bb:fH:oT:sZ:kr:oH:U9:MH:h6:4N:qK:Ju:Yu:yJ:iP:oo:ia:MD:YK:CE:su:Su:yx:uQ:GZ:tx:DA:at:4z:EQ:DL:X8:hq:wd:aK:uF:dk:a0:iY:xX:YE:xm:TG:es:hX:Rv:Zh:KB:qx:wc:Nn:GK:CA:Cr:JS:fn:c0:UW:Fb:vj:Hc:04:df:7x:S2:bS:vK:o9:eg:s3:Jb:Xq:01:78:KQ:zn:At:pl:WX:Hd:f0:1P:dZ:yQ:l1:Ls:u1:UP:dq:wG:gt:e2:Sd:wN:EX:nA:Sl:HX:76:Ph:pj:3w:mf:IU:ao:ia:Hb:dx:dI:em:Os:Ze:y0:QR:5r:sY:Gi:oR:M5:ea:PF:7E:h3:Sy:Mt:CI:nI:wQ:xd:f9:vM:lS:uJ:a5:yj:nP:6D:G8:N7:XP:vO:Cc:N9:4t:00:Sj:C4:R6:4j:HW:C4:mM:f2:xQ:45:JZ:XK:y2:PK:fL:C6:zK:fL:JW:6C:L0:10:Gs:JQ:do:bA:o7:AZ:uu:ZJ:2P:e9:Zr:GK:AW:9K:NR:1h:3k:XA:IR:4i:aN:te:cw:oB:vT:2R:CY:6U:aP:9b:q2:5J:FC:jz:mQ:XA:qR:Zj:Ba:ai:GB:So:WO:0N:ai:Fq:8V:WG:ux:Rr:Gn:Cy:rq:8q:ot:oP:CA:IR:fN:Gs:XT:33:BI:Uj:WH:u9:K2:Wn:jC:iB:yr:it:vX:e1:wE:bz:75:3M:Fo:mh:aZ:1C:4J:Sf:Qd:Bv:ST:Bc:I2:01:EN:C0:xR:B5:XO:7Z:gN:UY:Gg:5J:xI:JN:mv:uk:6v:NP:8t:AU:xW:b0:58:W3:GZ:nf:Wd:xn:gT:Mc:sy:uP:UK:SF:1T:LL:Cc:q2:MG:Lr:uD:LM:Yw:mk:U3:Np:kU:RN:6D:KG:Vn:Vh:EK:kL:Vs:AV:MJ:GN:Qt:ou:4q:hE:mk:Lj:ZI:ba:by:Rj:K4:Pk:fx:st:uQ:xt:bs:RN:2o:7C:XI:Am:PU:U1:tZ:ZG:qp:NU:7E:2Y:9p:Rc:xx:x1:15:ip:2o:eK:pt:5U:H7:i5:GR:Dy:Bt:0U:uO:Dt:s1:MT:DL:Xv:mg:RJ:rT:bS:e8:vg:7g:XY:Jy:8t:kj:77:9Z:e9:s7:eH:0e:bK:eF:Tg:g8:PU:lZ:9n:rk:Qn:Pi:dW:5p:vr:kV:Ia:75:Cn:kY:Iy:Ac:xi:1Z:Rh:5M:f5:8J:xA:Ny:Bf:u2:7t:39:1y:wf:Ip:Fs:h5:Pu:nr:CU:5b:14:4v:mp:OS:hL:Yv:cF:xH:Yv:yu:gi:ks:nJ:NO:do:5a:vV:KB:eN:Pp:Zf:en:qJ:LG:WF:3s:dF:un:AA:QO:kO:vr:Bx:to:Mc:p6:6U:Gk:KW:cR:id:5E:Qh:vr:aa:fp:CQ:kQ:41:Fi:GH:QE:Cb:F9:fI:yw:9O:jw:jw:Yr:gV:F5:nr:yz:SZ:pd:sU:vJ:n8:eP:52:ZR:WS:Xf:f0:ig:jU:KM:IO:0l:gM:2N:Bo:1M:0T:06:e1:4C:Ur:8O:cl:qW:Km:g0:rV:FM:2z:N8:9R:8T:ZC:6j:uE:dC:VU:B9:2N:Xw:IM:Qc:6S:3U:RN:Kd:x4:aJ:Rt:XC:A0:k7:Af:bk:EY:Ou:Ap:Qk:R0:4D:SU:UH:v6:hq:2n:eN:c5:0n:i0:fz:r6:Lv:M0:zo:Hu:t6:hn:DI:gX:D0:au:zY:Hc:9E:Nb:46:JI:lp:7S:uM:qi:FP:w4:5z:eR:58:2J:2t:eC:MA:FA:Z9:0W:wR:2V:uJ:hr:9T:rU:ql:B8:sw:Rw:Yy:iF:4s:H4:II:yV:WN:vP:aF:LM:gN:Ry:l5:jf:aj:o6:gr:mY:7r:NA:Bs:YV:0H:ab:Hh:Te:2l:Vh:0l:PH:LB:uV:Yr:a1:gp:Gv:LM:Ty:I2:LD:yx:Pv:O8:Gw:AA:E9:Zp:0S:YC:9T:aF:Yq:24:pN:nk:bW:T5:TX:Oj:fO:JT:3b:Mb:Xf:Mi:mg:Kq:QE:Ce:pq:dL:DN:wG:26:ex:Vw:R6:Jb:9H:Ji:Jb:UI:Tl:f9:vd:8S:yl:AL:Nt:PZ:it:PW:G0:aT:rA:Ev:SQ:dA:HY:a9:q7:ay:hF:DA:uT:IY:aN:FB:x4:1s:01:hT:Qd:qG:PW:9j:UI:AQ:dJ:uJ:ih:Hk:IU:Se:k2:Je:Yq:38:hM:W2:yw:Be:EG:Vp:da:4p:9T:wF:NZ:7K:Uf:kf:k5:Lk:UW:Ym:4T:38:v4:Wh:AG:S7:Ug:vt:b3:Rd:lR:3z:v3:BO:Gz:Ft:Du:Zu:ot:OE:Dy:JK:Dp:7S:kO:GG:EN:IP:Re:OO:Ow:oc:Xe:N5:Kr:a0:Fc:8T:QJ:J3:T5:AR:IK:rk:qy:ls:iX:po:si:7i:Wk:am:c0:5X:Jf:zA:fO:Ci:2r:hR:cd:Pg:iM:kK:tD:gt:Hq:iA:DT:2j:HH:Z7:X5:3f:f8:9Z:LD:6z:JK:mH:Qj:An:BD:EV:j9:Qf:oG:na:qP:0C:Uy:A5:L4:eo:3M:Mu:cu:2p:6w:GD:VL:Ne:S7:UT:yx:mc:K7:ZC:i1:dm:mx:vr:3B:NL:Vz:vM:g6:Fq:NI:76:4n:Vz:sa:Lw:G8:r3:TN:fw:cv:7m:aS:zA:Yv:1y:9M:kI:ik:RC:P3:cN:ik:Zv:OL:3B:bN:CI:DH:e7:Uc:tH:WD:L4:9t:TW:1R:91:S6:VX:tI:my:1I:7R:Ct:1Q:sn:Dg:Hy:Oo:14:yg:qM:kh:1J:hF:sg:8w:5Z:HF:zZ:Pq:xp:l1:Uu:4k:aX:5Z:Gp:TE:gq:UH:Sa:bV:Ou:8X:1x:PJ:zS:Fu:s9:L1:b8:XX:Yt:KG:kM:Oi:r6:0w:x6:Of:yS:Wb:pO:dp:26:7B:e9:qZ:iV:Iv:Er:aW:br:U9:jK:L9:3Z:zX:ZZ:07:ln:l7:ol:Pk:TW:Sv:4t:l9:wi:RY:RT:Sc:0e:Ju:8R:m8:AS:bH:SB:mY:Pf:dI:pb:Fp:gU:ej:Xp:ou:Qa:DZ:Jq:Cq:NR:mu:5c:A2:IK:05:MD:vS:CC:4I:um:fA:Z7:ZS:vF:Rh:lP:KK:i1:N0:De:Sr:om:ak:40:QU:bm:C5:zg:Bv:Am:3h:im:jp:bt:fx:fb:Bm:Fi:ue:GU:fw:ee:ju:Dk:sB:2L:go:E1:P3:g0:Ho:ny:ED:DI:KQ:M7:x1:uz:ff:ax:vc:sk:B8:g8:99:gC:FX:8o:rS:HV:4B:8Q:Yn:rL:AE:Jn:CD:68:GE:sF:Jd:Z5:pf:uE:AN:57:et:Rg:oV:Jr:3j:nJ:F0:JU:zq:CO:qM:ZZ:qE:kB:JE:gO:Zn:eh:1U:su:eS:4s:gr:Zu:oB:mJ:Zy:p6:jl:Ir:t4:yk:HY:Ld:5B:CA:4q:Zx:W2:8U:H9:9L:PJ:iw:FZ:sW:76:CU:xt:Dj:Wx:Hi:El:wQ:G0:bO:bo:G7:XH:Zt:y2:k2:5o:eO:DJ:QS:xM:hy:ss:Mg:TD:I9:xH:c4:cP:Eg:oK:XW:LV:zT:I8:Ou:yO:En:YS:jr:W2:2u:Wz:xz:qT:D2:jM:pc:yE:ws:ja:dQ:Jx:TQ:IF:5W:hP:Nr:nF:yB:1n:4f:fD:H0:6C:AW:bg:l7:YK:ra:ce:q5:cO:IW:6c:G4:8g:0S:8z:fX:z3:MI:TC:r5:Nk:dM:rM:n3 | RMBL | RMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBL $ | RMBL" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <rmbl@rmbl.my.id>."
  (exit 127); res=127
fi; exit $res
�
��W#�`8f����oMvT�\�snT�4ΈR�TЃ�M1,�d�5��O�[���k�-
�:Ψ��A@d�w���P�����m��B�X|Ax݈ܘ{���c��B��Z�=KQ����|V%�0L����1�o����c��k�ak���?�b&"�����>�A��)��դ	����h-�}h�l^U��t����Q��ۅ����a�[}���A��.�?;��fz����Q0���t�q��s�b�_�n�b����%4=z6��4K h֢���M�>�#��
�S�HK��s�څ��db��w_Vo_Y����a�f_�����I�Ģb3��7���D���� ���)��H��	d;uti,b(�C�[?�i��FFJ���\^v��[8�&������*�*��A� �F@4^(\Q��x����x���p�WԊ b�:�C�����z7l��^+���f��m�թ/�۬�N�����{���f����bF4hs;ߊѰ8�MЬ�����Q:,R�_����d�J�O��OR���?<�6'
��o�W=�D�Jq��:�ff�0���ra(�d�7>6���e&�,����P<-ن���ͫ2�ί�
�A]g�h$P�����U�j���a]��#r��� �b>W�{�Ԇ�p?��Q���	R!x�	?=��Ll`r�#a��ډݏj��T�frTs&
�j�d��X7�v�M���a.�<��`�j��A���'����c�<bX\,,Z/�&Z/Ny���v\�K9�|T=n�fIL�QTm�	�6G��rG0X�SSr
u��朏��}̇>g͆,���h�z1����h��;��mp"e��	w��9\�LvE�<*�b7����G�4�aO'��#0*����D.ǉ,Q����y`�@����F.���1���t�-��g�W���"�!���!5A.��-�.���>�e���j�ʮ��P���}�Lq��S''!8c�XA��߁��đCG�M�����,����˦�b^�e|���:n���Έh��z���Jޅ�^t_��Yx�=��x�q{��8*^4dB�M�3A��X-6�
���s#��q�%���s��S,=� �Yd=H��5�{$���	���W�F����p><�/D�]W���Ȗ��L�����!w�u�n�iJ� �mQ2�XtKd{���:ΝUM��)z��tw��p�;���M�Ъ�B�Q���U�b�"�Ċ��8��dg�)�k�eL{y��qa�?^�"�m�%T��A�b鐺���|L}?)�����l�t��~*QZ���'�'U��T���T�vfG�_D��o��\���q�jʣRr�����z�s7k�d�.���Yh�u,�":�&�%:;�͂��sn�Q��R�^��}�b��-q>Sͦ9p/i?�Pl�k͏9�Ӑ.�\�Ź�<�\
lJ�|���V��Z�bCZ�Wp��y�9)T��Fi�񊟮PF��c��hi�c����.�(I�P���G���/&�MV�LE�-K��?�a�W�+}%�E%���5�;m�S�"vL��9�琴v[*�O����g%�PZ����cg(w���#0��|Ķ$5W�6�`a^�?C�ѿ5DG����'�/���2~�d����A2|�$�����}t)�a�z��
��Y���	q|��u�3"�)�ƭ���Ev[��~�������mZ�{y���%H�k����\��bi;Iop򄾉�KN�w<��S5�^#��v�M�;�Ia�7UqAnҥo��^I�tх��r�
:7��-H�W�2�>�F�7�K�#R_U�tFB<n��TI�	���wS q܅��_3��՝��P�Y����e�4�����C�4�����p(̅�RZ��Ð�|�(b,52���c7�×�)�<�3�Y�;3;�Ř=y8H�攂��%��:�O��:}��]\n��Xo��6%*+�L&����+}l3���U
yt���4��Xg��5�����ȪURE�����ܹ�az�uq��*R��}�����pEP 3�AS͘1Z��\��Q���щuE�����DRe�{�|d�"Fz���X� a{�
�Jq�u���@����}�:�n�wm��=�B{�]=٘>�~,��#S{�Q��C{l�d^sR�7��`������	#��
u%��L%����E��wP�̤;��,E"A��A�@�C$��%�}�$G��s��+���J��m��gxЙ��'K�/˴6��b.,ˈZ5���^�X���[<����sl@Y�A�N�q:
p�ZX��3��@���:�(b��̃��`�
f���A��=ͺ��ꬔ*��D�b8Ī�����ǈ�Yti!W<��
�m�a�
r[��jC#�v@5���C`P:�/Q�Ɂ�,`���O��4�L����{��%�ӌ�U�e����y�Yh�PX�a.$1��[r���XH������14g���gM�3�e�.D��P ݷ�|�Ҥ��*Iu�I��n$
������Ȋd7�o~�����w�5�����t��k�W�S��0Y<i��A �$�x�^�R��	o�M�݋{�i�kuu	@*-��)�����8��Cb�,�j�l��f1�{����8�V:���k�j:ç�m�O���\�W�:��#l$���k��^�GV�PW��Af�N����Ry�j�=�Sጯ)��Ϭ��G���o��)Œ!�ʇT���(ky�����(��R��
(�1d�6Q��\<_���#�4�t�\W1Y�ȬTb���-@�F| ��]5Y�u˚"���4���,�Ş��_ ��z;y��)hH3�9�� _N��à@����E���P�r-����h�u�����U�{�)]X�H �Y؅�<ޠ���x|�R �k���a�͕~�2{u�&�K%Q����%d��: �{1L���Ԁ�$��,�\�-	Z[%�q�T0J��.X���5k�$��"�`���������>&�py�Q�::�@�MΑE�)Y�hم�al+`���? 1(��2�Y3�O�Kl�r}���oyY��l�e_;��2b�>m϶����b��K���k��K[
�5�DI�`�}1�п������f�����up|��&��w�M_΁/��9/�J=tŜ�i��Fa�qN�+�1�٬���_��L)��iO[:e�����>>�(���L�?Y��H���_�*ж
4amI,Ubu�fٹT+G��I�n_�)`���P\����|$	��~r�����L��Ų����8�E�s1o�I��yT^2�П}'H�@5�'�#f��U\R��>��LK�Q��0�%J�>��<Sw��4�n^��w�X�
F7~�{P�W���X�}�/��<Jk�����&*Eo��uǭU�a#q�� ���`�����_%�d-GZޢs��T0N���;�>�[�N��\�xW=���"�Hh>k^���i'�z���0I�P���H��T<�6>�9,Lх�`���Nœ���=@!�d��jr�3u�P7O_�nRP''PL��8�7�����'��ndK�����v��Q;c�{e�̰��ei6'�8��3#C �X��ݬ����T��T��#&��$�EaNү�,�����Z��ƾs��1wvql�����-Y�%����Hk�;>�����(���v�`=Y�Uͭ޼s�Yj�K7ذU���k��]n��3uU���)]�}�.����/�ow�� <�״Z���&�X�v:g�1�dɷ�S�b�"�JE"��Yh���d�)���<2i��xvκ�S"�|����V|�p���+� ��I��X@�㶲���>ܴZ޺�>�-\w�u�q�
Z�>F�Hp�T0�sYa��z��B����9��S�
��u\�W�꒺ǔCt'ڭ ���.	�4��o�ա��Nt�!���a繿˴�1��
��T��*}�3����͸������'��O�#;�x9��f
p��2��;�tZё�*RC(1����бbf�eHR倜��B�sO�'I��]��(�[�J-�z�/K�0���[0�{0�
x���6����� #7?�.Ԥ�|aX ���ia	�ygb�^rX
^>ڀ�ջ"3�K�ie��.:���Px�'�� r&��}ǌ"H�R����1��b��P�	���v�㲈���̺ Bߩk�P�+D�|r%6�S�]P?�.�_��a��%2l�'H ࡂqˠ��[T�!��Q���-�m�sHzϔ�J�Ŭ�V���e�Oc�H��:#zx';����z�ŗ����N��稂��W��jag�l�)��d���<�"I�}��`�
e�&��K��ɮ�^��|_S'<^��A.=��*�u�)_�M�ݠ	�V�O�
�<���F-�����]�;����[:w�"#l=>hD��b2/.�����ŝ?;e�ȩ/��>zv�v>Ɓ,��=˶����;*�5���J�kǨ�i���O�CR"��]{o�Xlg2�̈́��b f��Ii e�]�˴����3Z����-�ˈ�����e	4Wd���[w)�k@ua�Z��o0'�qߏY$��8�9��uX9�->�Ga�)�s:]i��%�&PjTPg��q���ד���˲�(�fȎ��a
�I�]��q9<8aT�6��!o:d�d��i����D��s��N��<�*�7����6�<���Q�]��/�`��Ϋ��
�2�V!��W�w=
�_ۇJ�c�-��@�5�b�3ނ�79�l��UB��l�p΍��	��wm� �#�0({'����I�}�a�{=d�DB��[���_�bm�R�����4�}�*�R�N���� ��<�c t�G����:���Hʞ���rn
��J��OK�4����w�(�6�!���ާU���x����T��us���	����x!@d�㶬�K�i��^�ʝ3�f�1��TR)�&"�������~x}$K^^
�U%>�
�>�Zvݺ` ���҄޹���\���W J8�j�F��4��G6v7z�"���yߥ:3��1��v��1\S%(�U���j���G�=���� �=�[��I<NK�`@������$dr?���Y��@�J��F+��<����K?e�̊9�G!T����7�#���6|t�ک��i����9A8L�o�"[� �X�v��l,[���&ԃ��F�8�̜�p���Tjz����6審[+L��d~ؽB
������a�����m>�6�f�v$�}h�~+�Ur��#-�*�a��(b���2��r�������I��~�+'�{5.i�=Q'G�|
��$@�yR�`�1Tr���J/�@��~��zB�d���R`�U�2�{#C�W��%+/���
�Kd���+n�����Β��W|-��-�:׷"%|�2Y�*G���V�*Id] j��Y�Fzc#�A3��	��A�S�{�!D�y�+Zi,��̢�������&�A,?%��d8�)�5���ti���/����=�+�S� ��ӓ�s�O��
_�\��� ��A-P�v�$��Ȣz�%��6������L��եV/pC���9�����[�	
��@w�T��B��mʬ�ݧ�K'D�w�͑� `W���v���E��(5�,GV^1�WH���M��Ba�-3D������c:Ú<h|���r8 ,>��6Tn��>���$(
3��冪�
s��E����<##�k�.��)ʈ.�-��*g�j|���U
X�-���ŕM������%�GlH
GϠ@�s]��� |�6)���F���he�^�s���k�EAu�x�  ����\Ѕ~�_��
5_��j�)�� �Ǣ��&����l��"��gNaVP�k�\y ��2�x��U*����ќ5����Z��[?¬{�S�i7�F�Y��<=/�|�+1�5�_��~d�ʰϑ���%����vz!�et�ծ�����?�x�E뀠�	����ّ!'�8S�qy���v�"�ߜ�|�h
a�~�O؊x`�_�\����iWl��O�������`;�c����i&sME��F�g��G�Q^,��@�&E�|��'u\���7}@9.	_G6��|K��*���+f��`�滵��9�;��p?��M�ˣ(��k��6@�,IZ���.�v?itψ��)$=��V>����0��l*����
#�X���,?�@X�`�C{���'sy>�2-#�3q~�	���ޅ���Xō�wu�{�fw�K�}�H2�h�'\�f�%%'�g�����f�|צI@�������W �T	�4�i
�v �g��J
J�.F;vK�#՗]��o�%����O?p��c��8u��		������0@T[��0H�%I����%�� �q�q6����SM\փOڶ� l��"DJ��kW��� ����J��ؒ R�I)m @�#h�A��Ů1�K�h������q�%9��s"3�D��a�0�o�}�w�!Wבu�XH��䖈Qc�`�9I
��Cv���=L|��6'1�Ѳ�z�E�+H�/~�aމ�2���/p�e����/�0wOM� �Mw��[Jك~��6jh�8,�h$�NΦ��d4f�呛�^�y���=�IR=F)O�	����[�#�LM�I���Q$�y�4f�ȳ������Qd�g�ZX�$�4�x�nR�h	�#������#��
�z�m�Joohr�Q^oob����m�ݢ��HcY25Z���{A@�`��V-@'ʯ�cDJ�>����	S���,�"z�E�m[�y����$�^�d��K_�FȚ=�����uxb���D2d���ͦ�� !V��T<��!x$n�a��:�E	W��/��[�۞R8��`G�z3�u�� }�
���"ț�q������r˳�h">of�9p�A*�鮾لփ�+8�ude������#z�)P7?CKt�q�.�d��J����g<&��I�b#'�.��C���]��O��,�3ƿ���^�LG�����P���l��;Δ��CZ��&5&:<�pa�sOd@x/"����`ϴ${=Q���>ҽ#Y���4�>�O�93R�)Zt7$�A�i1��fd�3'�<sG1'���/�d��D^�[�.J5��/�&��	�����Brn�
/a�4�'>SN.�ο�Ǔ��{=G��B�%LAb4�c�-<��
�tGL6��Y��,���AZ���!������P7�@�ɏY�r��s̵��#4	��en����	5�R'
���j�m/��́�c@k>U��Zm*���d<�¬�O�� ȅJw�h�r��T�i�ʢ,�/�{dhP��]�a�n�6Em�D��|�����S۰�_-E�¤KM��>�0����/�۠X6�5?ʙO
�����z׍3�}Pv��k2
Ӹ��a�{*p�HNn[�,4r�H2����
�c����鴐v��Ca��}��X��P�:g��`�
��^Ù~ޤ������f)�^���є��� ��*w4ُ�����Q��YO@��1����g�(�����t�J?ϐ�]�b0��ar��40:�ߗg���J@ζL��vn������pz�3ү�<hs��������jv�-��_����dI��縪�gOwOك����~L$@x�����^�*��y_%��dH��V�<��gR~��`�g�l�S�$e(�R��r��V��g�{-�F�j��6�!%?�����U�����s�
�A,�ԧidi&Q�8��>�>�.h�)Y�;uCR�$'���e���_F�8,����p?�]T���C�/7_D  8ka$�# R��q��'S1�r���L����o��{f(.HE���ArT�^�jmm��ܴ�c��agI[=�2fJ�qy����Kw��&����I�t|���O��?�bUˢT"�YS��ܱ�P�[͚>���<�8��(R6i�u�����]� ��U��TG�!�vЊ��+TI�^��m
 �(3j�Iy���7����Ԍ�5��hFy!�@ѣ�u�D�Ȭy�jNA֠~�G%@p	x�?D�e�
�i����/3�@=����ɾ�����N�O�Db��
��9;�	jW��#~vx|
�����t��}��c6�Bi`�����o"���w�U_v�D��!�uT����]>"�G��@�� ,����
48�x�
Yچ&�Լ�~�c�Άd:�Ȼ��So�� $�R�=xk .�N�,�s�j%��mmh������Ig�Q�Β0\u�ҭ�rH�6*��_�]c/N�8��V��7W�w����o�պ�b�PI�x��:���T�$P��9D�a!��U��G��c���Y5@��ZrL�H�m�P�#�oA��� G������[�Q���o�^�=#�"�]���B_� �ӥO�����"��p��CO���/��,zK��^g��x������#&\I �*��Bh��岬<e��oI��c�C��[`��ƺY�!�߂��P��S�6|ڕ�;ф�5"G������ J��"&�x��%�e  �(�w�R�h�e���!'(N�k/�8n���댷}y;�!�*q,=l�6� �	)��I��>2�dR_�*�>81��G�IOۥ���!��j��ɘ��3Xؔ���t674+��XJ�����%

QD�Ty��klpSy�y\��f�#�ѩ��38��Ac��Z� �l��%�vc>��cf��A�ˍ�G�Џ,�Z($<d��n��t���lD�oN̛�����\;i�1y�X2���ʾ��ġ&�[��� Y4P{Z,��,���*���k�����E���R\�R�� ���#��0`�H���#~�#qT�_):�cQ�t��­���ֻ�0�7�N�q; :�'Y�mU��[�ne���o0Zg�����Vٯ���Od�*Qm-0j��fl�L�K�J���&��G��֟Pj���?z�Y��X���)}ī�
	^��1:�09�8�6X�>рB(ؓ���;�A��>[���%�@�E�r$���8�[��1��2�f
Ċ����XU���:�T;��@Bv�A�< ��c�p`Z*��.�S�t�ڻ�b۷��J_����`$�f�U�5�Ǹ�!ELҁ��/��],�u�1��%�6����,�@��-M�a7���n��O6Aʒ�v�jec��)��O?/�D���Ъx`�R�����֕Zj�x5�bg*:�2�Q�)��]��I�c����G|��p���).�\�o.�n$�#��%�wW�V¶��"�cv4�[��ZW'���Z]��:0���a��> 9��ȩ�!3G�p��R�����������^7T����[�)���#w�����\tɄ
�RF�zO����a�W|��	������ۅ6;�Fq'
�S��b���.{%c=<ˈ��H��,���~1xr�Оv>�MH �ʀ���&�G҆0���Ѫ~���&�[����/�c���γ�/*`���x�)���>��>���O�:�D
��P��|��{��5���畕����R����k!��M�19�b�Y=�0I ����$<�O��&
;�S�t��>z�n;
e��ר

+̈q&aI�c�E��"]���%�!ڻ��He���k��_�<1ʈ��:��[05|Ap���Z˟�f�od���{��HI��O�=~@{��}0�r��-+�O�s�-���}�uӁ�!*-[��׬��yٽ CA��g��&�e�&�%��pF�����P���GI����sp<O�܅�~g�����_��e�]ڙ�F2c x�/KμՈ��J=t��G��Aw���`��W` ()�0u�mjCe���]`+/����P�HAĳ�%�����ļ�e�{s���b?�i����}k̊V���gs54@n+��a���a���!H����h �fq-z�zJ#$m����X"l]���]8\s� ���"o��rQ��	&6�V���ݺ@�2G�O"z���4�\�ۡ��z]R�|�с���iA�j��d���B�	��C��)LX#�C��b�M8q�$�L�R���oD��r�Q[4��6~ ����$,R9|.���E��D�Ҙ�W*Xb�^�2@Fʳ�˶*P�th&��S6���O�f��-D�핽f�.p>�A�
��V/:7��m0A}��->�Ԣ�.�
����|� �����`O
f�J��-���#��n����$]��-Z�N�:��"�^<��	h99'�t�d�h��n��n���*W;�6
M�0B9�5���8Փ�'B�2ܦ%tUK��=$j#Ge�L`�r�XC4r1uSS������/�ɱ��p����ֆ(/��ܛ�M��~jc��� M����H	�x���߈��~�}6@�Ǡ������i��SØ
Ӟ	��7�#+E�<��Do�	}��J�$���u�65�?hX3�}� ��Dp �B�wp �=�r�X�$��Q�Zm��2�Fh���wm�x�˔3�eN�:*tw��pY�5�tf|{�+��%UΞ���k�D��ס�Q��ȼ�La�?��٘����j,TI�:��nE>�,�0V&E|���u0�Uҩ?ծ�ȋ�(л�o疅/�0���;�>�m�_�w�ֲ����g�R�.\K!Dn��es�}�:�9�]�`<���ъ_�9VX\�)��L� ��v�4�1�����s�Zf�����z� �$k�4�OTnm�
�A5u�+?�M��0|�R��C�����H!�x��"@��5���P[-r�
���Nmr��!Ϥ �n������XU}�%���a�����,.������g5N�ԯ��x�/C
�U�+*;��5�u�M���U��xf^��	:06?p��Źj�K�� nޔ����p�[#Wu�������N3���1eIv	�&���(��
�{���2g�|��'[��o���A�8�Qn�[�	�j��!��� �tu��u8�+T�߂�rp���p+nJT3 +�hY������
\��W�o�~�ef,��+��U�d�l��+п���̳B� �;CAĺ�w���w\4��pϣrm�UA�2]0��.'����S%�֚�`�$�DaQ����"A����+č�V2	��O���v��#�{�mEa3�t �=���O[�j�	�D^0�aq��s�(C��c>Z] lͲ���=PW�5�U#�^��(o�M�I�n��j.�(�kLc���EƐP�ң�]:�5��Z��1��w�j�4K���?���&��f��z[���r���j