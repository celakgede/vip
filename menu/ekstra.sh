#!/bin/bash
#
# This file encrypted at Fri 04 Apr 2025 08:01:20 PM WIB by
# +------------------------------------------------------+
# | Author: RMBL VPN                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/ |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/R
# Sponsor this project:
# -  https://t.me/RMBL
# -  http://vps-ku.my.id

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rmblvpn / rmbl@rmblv.my.id
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rmblvpn / rmbl@rmblv.my.id
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "Anjay password nya mana 😂😂😂😂😂😂😂😂 Rasenggan (Ah lupa ga ada emot Rasenggan) pakai api aja dah 🔥🔥🔥 menyala abangkuh | 60:LS:4G:7p:Zk:vl:nl:4J:Ns:Xb:pQ:P5:Qi:ad:sr:Lx:E4:h8:mZ:rA:u7:0b:4R:Rv:KP:Vt:SP:QA:Rf:Vn:37:gU:lE:Rt:Ot:3R:o0:md:8P:Y2:10:ro:wY:99:GU:Wn:jh:8t:Q5:16:EY:rt:so:Xy:eT:vi:WJ:43:cc:2B:Mb:nF:Ud:Pd:7Q:1r:bh:hu:6C:B0:C4:mN:MI:MC:SK:v3:Ka:7l:IY:bl:ty:zv:Gz:5K:kJ:Hu:HR:hu:WG:5H:h1:Qo:cQ:6v:lZ:cc:j1:7o:1N:kx:js:qR:CM:mL:tc:Kr:9s:lE:um:qE:M0:Gn:lX:Qg:tb:NW:OP:UD:As:Wg:aT:le:uI:gR:Xi:zv:VH:tD:81:Tm:8w:VP:V2:Pu:A0:tO:4b:ZK:cR:Us:zy:IF:uo:2R:YR:Bd:At:7r:O0:Pt:k2:By:Fh:uG:05:Oa:cH:EC:as:sv:6v:Fv:bj:7J:yo:xh:M9:22:bK:1f:RB:bv:ZZ:lF:Qf:cC:o1:tt:yw:xQ:NW:u7:6e:GM:Hx:aM:1B:ND:YR:Mp:FL:4H:yi:Tq:on:FE:RE:cf:1X:sM:Vg:TH:yu:XR:Y2:Kr:ke:fG:wo:pb:BR:2l:sS:Ow:xI:l5:0d:LK:H1:we:Xy:p1:Il:uR:Rs:ig:nR:47:Ct:lH:5V:DF:uw:ii:N4:40:rU:sk:9y:sK:yv:dc:4b:8P:HQ:Ml:cd:iR:VJ:wT:gs:Y8:GV:Dg:fi:9y:aC:0v:IA:Oe:dZ:UH:YU:J2:Qk:N0:r9:Yt:Jn:Kw:ma:mg:88:xA:SQ:HZ:Z3:DU:PP:Dv:ZB:yd:gT:Xz:Mf:9m:RC:V1:la:ht:ax:De:rN:fi:oj:bd:FI:w4:Ec:Jv:tm:ZA:pm:g7:JB:yc:RO:iC:oX:A6:BZ:8R:k9:pC:3t:8q:og:bK:GB:Ba:nV:uU:S2:Bj:IJ:6h:28:54:0o:9e:Oo:AW:8H:Mw:jh:GP:3M:dW:As:Fm:VW:sR:70:st:Vk:CN:me:Sp:2i:pC:UQ:6G:bB:jC:W9:89:2p:TD:90:co:hb:Wb:Ox:mT:OU:7M:Uz:EK:RR:RG:vq:7H:cA:fO:3n:o6:Ll:gP:hE:at:h3:WA:Qq:oI:JW:Of:NA:fl:3x:2c:gS:yN:Ll:FE:jq:B6:CY:2S:5j:68:pz:c8:Xn:UQ:zP:u4:mt:Sn:JL:l8:CN:Ob:CQ:dK:0n:8u:Jz:9V:XJ:SZ:FK:XT:Cm:4D:gp:7g:Yf:86:0c:td:dU:S2:uV:5F:8l:oy:7A:Mr:7x:7f:mr:rb:EO:HA:Mb:hm:b4:GN:4E:f0:1q:61:bZ:cS:Mn:T6:5C:0u:2P:oM:Vv:lc:eL:kZ:Fi:95:wl:1r:lg:1W:4I:K5:rz:Qc:Rx:Zf:Uj:fc:TA:68:p0:By:ci:OQ:Fa:kU:W3:BW:nn:fj:NE:AD:RD:JG:Zp:Xf:Gh:ms:z3:9S:tf:ED:YI:KB:wi:rB:SX:1T:vH:dg:W4:k5:lk:51:dj:GO:Lw:9j:pi:bP:w4:eC:MS:qG:aj:Pe:jP:35:hO:A4:dP:WJ:A1:I1:bA:jM:dy:V1:cT:SC:hU:s4:iz:LM:rU:ae:jn:J1:MR:v6:2m:9t:gA:5C:oY:LK:bv:iR:j4:MJ:lj:8X:GB:hO:VO:SJ:Np:Po:Hg:IG:CK:fj:fo:0B:SH:Fa:Oe:Fu:4m:0z:52:x7:ZU:8v:KZ:Qg:gq:QM:vv:Hm:P7:hd:gJ:9E:P3:ud:9o:ZG:LA:nG:vd:pS:rc:sz:6R:Q3:f7:cc:ci:0s:sY:XW:uz:2E:gc:Du:gn:cv:FD:6w:r8:1y:4a:OD:9h:v6:je:9o:I2:g3:5V:lv:xN:HN:jn:vf:PR:bu:ad:pb:Rg:2e:6K:CI:mH:mM:ea:XI:UQ:9p:Ic:ew:Uu:ux:Ui:D8:ji:9r:G0:fN:p3:IK:tU:j6:q6:vo:GW:QY:d8:7q:gY:UQ:Xx:Xu:ki:Yb:yU:Kt:sr:qa:cx:SA:pW:D1:8a:Oq:ZR:14:fj:tv:zP:AP:Vz:Ta:wM:Di:yC:Dy:tK:1e:sS:sG:aw:Pu:sC:1S:Z1:HE:l8:Gl:RI:pZ:Ck:6B:B5:dk:ZB:qH:cV:XU:Kr:cs:NG:t6:zu:CX:mr:4z:D4:Yj:DE:sE:sf:dA:gZ:Rw:dF:x8:c0:2G:Sf:xW:Vd:g8:Xo:gv:pD:Us:MX:BQ:Z4:ln:ll:Jd:UE:fn:JR:dA:YW:e5:c3:x0:t4:uw:JQ:Tm:va:D7:kq:cn:np:l5:2K:OZ:2x:w4:Mc:mw:5C:nZ:ss:tu:xv:IJ:e2:q4:Iz:BG:G7:zC:Oc:NO:yh:IX:fL:Rx:WM:QW:01:Tq:Y2:CX:na:Sh:04:to:ef:xl:Ki:iA:M5:pP:W2:eo:gJ:qQ:ye:L3:Io:9l:Us:lx:b2:oP:dR:ns:sh:zz:p7:51:Vw:UO:Bw:Uh:vK:zi:C8:lx:4T:70:h9:93:Rx:hd:Or:FI:pT:MJ:2v:2o:Ra:iQ:cL:EQ:0P:gU:mi:cb:2o:VJ:zH:Ms:JQ:Ei:tm:yE:gY:7L:hL:wT:tN:1K:zW:TS:ho:bF:5C:ns:Pa:Lq:kS:JS:Sn:dq:WG:cZ:1d:bY:3t:8t:5Z:NK:Qy:NL:yO:ru:zE:5z:z3:jB:nw:9U:0n:Wo:Vd:Xf:ZC:3Z:LQ:FV:mT:Bz:6b:CE:Ks:MN:Mz:Qb:CP:f6:Oq:cY:UU:Hv:a6:qD:JZ:Mu:aX:g1:ey:5m:61:Cf:t5:vf:EC:TI:b6:Pc:dI:jd:xJ:CS:Et:ea:l4:LI:cc:Vt:WS:ha:YX:4x:gg:qJ:LW:eH:Sn:k3:wr:0F:Sh:Fj:cq:KO:qc:yf:ym:MJ:fb:PP:vM:7x:aU:9z:LX:Rd:LZ:m9:m4:3f:j1:g5:oV:M6:TS:BS:qf:8e:mc:u3:Ud:Nm:t2:rH:LK:IZ:gd:lS:wk:vn:aG:1x:IV:1B:aI:yN:H4:Kr:o9:id:J4:Mb:4x:KC:ol:Db:UP:zs:60:dg:Xe:Ud:eN:qw:Uz:iG:js:MD:2n:eL:gy:2R:QT:Fr:tY:HX:LW:me:1v:UR:Vp:PW:mL:Yz:WM:uD:ak:pd:ri:6H:Vt:iy:hQ:6Z:tQ:0t:F5:K1:wS:zI:dh:Lz:2J:XS:md:pY:UG:Nw:9J:wo:9i:wg:kt:sa:Le:X2:oF:CU:vP:tD:eC:Dd:zQ:6z:sY:cQ:A6:qR:aK:Xn:c2:Z7:oS:7m:RK:Yu:ZR:3T:j0:ZM:Mb:Y5:ZE:ch:O8:sf:Al:ej:sJ:AI:uv:Zf:lm:8g:BF:5u:SV:ZG:6C:k3:v8:jX:Jd:16:H8:ee:TC:x7:2f:kl:hU:O2:Dn:8P:La:OP:PO:sw:p2:jP:zZ:3j:mA:0x:Od:vI:uj:RS:Px:tp:cc:xv:tC:kA:ct:30:CL:oF:mU:DA:4M:7b:Nu:eN:ef:UW:gl:Lp:QU:Sp:Rc:GH:5i:Wj:JG:MV:fD:rF:3s:rE:un:4v:Z2:Xc:iH:rX:Jl:am:76:Gc:4e:kU:Rv:ei:hI:NP:ta:AU:04:AO:sW:AD:aj:Bo:72:kV:9Y:Ll:ap:Vr:9u:Dg:7U:Jx:Qt:ng:94:Dj:Iz:4J:dx:Bs:L6:VH:om:0R:a4:Wo:A1:Sy:6X:aV:bq:xM:mM:LO:5c:0E:RW:ZT:PC:0q:Zp:Nr:H1:yX:El:V2:xm:jA:rx:ED:8e:Fg:r9:QK:V8:mF:DB:4F:aS:QJ:Jx:8T:rC:RI:92:Ok:DH:Rz:Gj:6V:cb:7e:0h:Bk:iJ:XR:LL:PX:f4:7a:TV:7o:jn:2Q:Tr:XN:J3:Wu:xD:R8:uK:0D:OP:SI:3h:jY:TM:WS:lD:pc:5W:3m:gj:yw:M4:LW:iK:I7:9s:p2:Ej:z4:ya:tL:gW:5n:PD:z9:QV:4e:dH:5H:A6:rT:js:bo:Iu:X5:6C:Wn:lA:eu:u0:XF:MJ:SO:tV:Sa:Va:ds:Ti:b4:0U:FY:i2:co:hG:a6:JB:xw:15:Ui:0w:ri:r7:X6:a7:GD:D0:6f:uh:MB:5X:dU:oR:LZ:L6:Mm:LN:9e:ec:eJ:gm:xB:as:P1:I3:Vk:ZP:sA:9m:iA:Lz:RA:S1:ln:X9:77:de:R7:Qg:7I:VG:3U:wX:0R:vq:hs:91:9A:bQ:gS:Gr:EQ:oj:4B:Oi:hU:UE:jY:TW:Z5:eP:0w:VP:Us:UP:Gg:N6:3R:o2:kL:fO:nY:tm:91:cH:Aw:CD:Wm:mX:6y:wN:qL:mF:B7:rD:se:N8:4N:K0:wf:Xm:a5:4b:FJ:Yu:u3:n3:BL:m4:uv:G7:Ej:dB:FB:F3:nK:AF:fW:TZ:4y:Os:hA:eW:2U:NB:Ki:d3:Gk:hb:K6:tJ:GG:2q:eo:sB:kz:h3:dV:Iy:Mx:pF:Kk:BU:2E:3M:Zw:MB:Ue:hh:mU:6v:X6:Oh:63:qm:Eq:KE:Y1:68:Ke:oJ:ZM:Yr:DI:pl:vM:2o:Fy:eV:rt:qY:WF:t8:Os:o3:o2:Z3:5E:V0:n3:xP:ng:Vx:Xc:dG:xk:sP:kU:lT:Y4:bB:mt:8p:ad:oG:th:Nw:fx:yG:6w:vo:4W:IJ:aw:TU:pV:dr:9Q:db:yv:0T:gK:aI:Ft:VV:BS:A5:Nq:wF:Gy:qP:TG:yz:5Q:hO:uJ:BN:FB:9Y:0y:cl:Gk:sU:10:wH:xo:uo:zw:Iw:hn:Aq:Ho:k2:LD:c1:Fs:K7:V8:A0:3U:sK:rZ:CZ:Ih:5L:RX:5Z:pI:Oz:CR:52:jD:aM:RO:31:QB:jP:X5:Rf:Ux:en:CQ:Fo:Q2:zL:Od:7U:sp:c2:id:Ud:oy:dq:6s:6e:Ef:VQ:KH:vO:iY:tj:pV:KH:uF:Dw:x3:rj:KE:RT:Uv:Ap:ib:zI:FB:6q:Jv:vN:2L:ti:JK:eb:DO:Zf:dB:Cq:iD:D2:vo:Jb:Q9:FS:Ii:RA:kp:J5:o4:UO:8a:pw:An:8Z:AS:zd:bd:o8:02:Bd:nr:zt:nl:25:2B:He:YR:O0:w2:Tq:YY:RY:ns:lV:GB:G7:2Z:ud:EZ:3n:D3:pe:it:0u:Q2:kr:2X:z4:oe:mh:f9:PA:0K:0L:W7:fp:kK:HH:Qz:cI:SY:xp:cA:9s:zN:PC:FS:l3:yX:B1:rq:9k:Ea:vM:B2:KU:Gd:gs:8b:Cy:wo:8t:3o:XC:rk:4F:Ew:6N:lZ:5H:nN:1T:VP:4G:qu:yD:JH:7O:fF:rf:QI:yY:XO:1D:jx:c2:EW:E3:bV:GQ:6G:XV:Ug:oy:Ng:H4:Lr:iA:5p:Ot:3e:v1:oN:Cq:Ao:Vn:I4:A2:Qm:UV:oD:4X:YT:rI:9q:Pj:zD:tP:Us:pv:BG:43:UN:OJ:jr:RE:Yo:f1:kr:VF:As:YK:Ab:1V:Sc:Qo:Va:dW:3N:ql:fS:YL:zu:qA:Qk:mw:jx:wG:VB:Ws:Yx:N2:FQ:Ov:bJ:KN:8w:ao:t9:mI:dP:gX:cr:Xj:aO:qU:w5:Ec:mB:aX:ry:zw:Bx:rF:z2:TM:Cx:ho:qv:JE:vW:O6:ui:U3:AW:av:IV:C8:dN:ic:ck:MT:07:eX:5n:J3:o2:Zp:aO:w7:2A:9x:Cr:aF:AW:lq:lx:AS:It:xy:tZ:4R:8B:Us:XG:4d:AW:fc:RF:3b:58:4s:Yl:Cc:P7:to:3i:fA:eA:wn:xP:rR:GX:cv:4v:aO:KS:my:re:w1:VO:dn:K7:AQ:za:86:w5:tM:rS:kx:fz:xb:Fb:Ph:r0:Je:6I:aP:fB:5q:5A:01:kZ:oy:I2:jN:Y2:vm:F3:Ir:CF:9j:BD:XQ:oM:z9:Rk:on:tj:Rs:66:4f:Oi:fN:Io:jx:c6:Ru:A5:xt:1L:1l:ZF:Xu:Mk:Ay:pe:lr:1Y:ZM:YP:Hg:0R:xU:wp:UZ:g0:4E:pT:rV:Rm:mB:Su:Jr:gl:dP:wZ:0R:iU:UW:0L:7O:Zx:hR:7D:Kn:jE:L6:fv:ev:ho:qb:mh:3U:cJ:7m:Px:YB:oR:2i:c8:5p:Gb:75:kL:nO:G5:D5:F5:gr:yy:Lf:5D:yi:Mr:xF:S2:uA:px:ON:Pp:xu:nM:Uc:TV:xi:k8:L4:Ad:i3:8k:zX:1M:Z6:KI:yw:BA:Xy:PN:i6:pu:It:yg:7f:Gw:nv:ey:T1:HZ:zI:ew:NX:Ra:5h:BZ:gy:sk:Ix:lz:wm:J3:EZ:3G:Ne:XX:r3:Mp:aO:cZ:ro:pl:fi:Sq:NU:mO:4u:yq:x4:WQ:NN:fY:SG:kf:kS:yP:BA:PU:Df:s5:m8:9f:1p:le:V1:cW:uw:ip:jR:vj:WO:pT:Nb:M3:rm:cd:pD:cO:KM:W8:IM:wW:03:8k:A4:lY:Tb:vh:JV:sg:oq:S9:zJ:zs:yT:av:gU:C5:2N:sm:5H:Tg:4T:UE:Vg:rb:Tv:iL:0S:j0:do:Aj:O6:WJ:9l:No:nC:e2:Mh:Pr:Dx:Ap:Wl:Ae:2e:aQ:yy:pN:WH:RB:gc:Q2:IT:pU:cF:Px:rZ:jA:6Y:PJ:Ge:2y:2u:O7:Lg:hD:Ym:rw:Fx:Z2:jy:Mb:Jf:SF:s4:K2:Ai:qf:IS:4I:vW:1L:0S:qC:B9:53:8l:6G:8v:Mc:rv:ZI:1M:4E:ne:nc:qO:1C:S8:vA:t0:AQ:Pd:fg:nj:Da:ls:uO:ib:kV:a6:Q1:jG:zC:PA:tN:8q:k3:IE:9k:Gu:7P:GJ:Im:IB:CV:h5:Ww:jv:xl:Rx:vk:CH:he:Yq:U5:gN:0U:ub:96:Q4:x3:9F:KL:A0:4s:Vb:gl:01:VC:gU:zS:vv:IJ:PW:jB:H5:tg:0h:xZ:C2:rY:2e:bw:uf:jo:eo:Ra:TQ:YU:8I:Wy:y8:mI:6e:gO:cW:N6:cA:pu:5s:o5:Lr:GS:nv:jM:YO:lh:If:0j:zU:wG:aq:da:63:JL:Vc:M0:BP:WK:oA:Ln:rV:2x:mc:r9:Sv:RW:36:gr:h7:H4:V3:gi:Sw:qV:EH:AT:gR:y2:Su:R5:B0:Fs:9H:HJ:dD:Fg:52:na:yM:aO:pG:eN:KU:pr:TB:Ou:aY:Nd:94:QP:qj:ob:3Z:sE:5C:6d:MI:eY:TE:Hw:3e:sO:vQ:Wb:iX:X2:WU:LG:yQ:Fw:En:Ab:BB:lF:1K:vj:kL:Qt:Ui:n9:dt:Ef:e3:hd:qa:hr:QB:0C:PN:jk:Zl:6y:ee:1t:qD:rO:YV:tr:pv:gx:Py:h1:Jg:S4:SK:Rc:V6:hd:S6:dt:hB:BL:fO:CW:Pd:vP:SD:Kf:Xe:XD:aj:U7:Yg:Cv:3A:9W:Wx:A0:gE:Ed:Vp:qz:1G:gE:ce:pY:GE:1d:Hh:1Y:xH:NQ:21:hn:FA:oE:CG:IX:4N:vS:fj:97:CO:0s:SM:nE:LM:Ev:C6:bW:NJ:WT:P5:HW:E7:RP:xI:0b:fO:aI:be:EN:GG:X7:HV:fs:yy:bj:6L:lm:bt:I0:hF:CD:ZJ:of:gK:6M:1C:Jf:lR:a1:HE:2O:It:aR:Ar:88:XK:Uu:Od:lf:oN:Vz:w2:75:tu:fX:SO:vG:RR:00:SP:Xf:cL:aU:LZ:5G:xs:ut:qp:9e:bn:0j:y3:6R:HL:A8:iD:nc:u4:aw:uE:Pp:kD:a8:q5:QH:8V:7x:x7:oX:JF:8q:tE:tv:lB:Dh:2W:Cy:X9:rx:a8:7o:xs:cN:SC:Ex:qH:sh:u1:87:7e:2a:mv:0s:pM:yd:qd:L5:ZH:rE:w5:zV:dU:sy:U5:ky:HH:pK:lI:Eq:Mw:zm:mR:zv:Dh:7R:YN:34:0z:qU:KG:jJ:Nv:Il:ct:7M:w5:E8:AK:ZU:Qv:P0:zU:Hq:0Y:zn:9X:2E:SH:Gg:UM:zy:kc:fJ:y0:mc:Ga:wZ:SD:IO:0s:7M:on:VR:GA:HX:3I:2b:vZ:Rn:ou:Bo:H0:Qq:DI:9y:CX:cz:Oi:d6:GG:uO:Mt:LJ:b8:sc:Gi:Sr:6d:b3:F0:qE:3F:5I:rv:gc:xf:AC:sE:cE:rO:cw:lt:rf:Vm:kB:Rp:Ad:yf:rT:jg:21:8X:XF:3Z:I3:I2:PL:Mj:cl:R6:js:ZQ:IV:hl:Cc:9W:9B:gw:ts:HD:PW:Fi:TT:Oc:RR:PV:TB:Rl:Tv:A9:u1:Qv:KJ:5Y:To:sJ:NX:si:yh:s6:7w:KO:1L:5s:xT:D7:wA:ai:OQ:Ln:ql:Qf:MV:uh:hU:6y:ib:1o:FC:Un:tp:A9:un:st:fR:MF:8h:Ow:kN:ZC:FI:VL:8C:5P:zH:0F:Bh:5q:xU:Sf:xR:mS:7k:wJ:Mb:DK:7O:mW:SG:k2:5C:dU:7O:Cu:QV:Zi:yh:Es:6b:uY:kW:2I:WA:hN:49:Gn:oE:Mi:jq:9I:rw:K9:iQ:89:3D:oB:Zf:tV:Zv:Wo:gC:iB:QT:p1:u3:b6:k4:VL:LS:I2:xV:lE:eE:2z:bL:ay:xa:rg:Oi:Gt:zj:7Q:Yb:OX:xc:Vc:LM:eA:UH:O4:Oq:kX:yF:T7:D2:Xb:Ce:Kd:YK:o0:rv:HI:nz:q5:hE:o2:Qr:T3:vl:Xc:Fc:7p:9b:pY:9j:1i:uq:cF:PR:XK:w8:an:we:xr:oA:Ej:bK:qN:zk:jl:3a:jV:lc:ij:r6:sC:hE:F7:kW:5r:qC:dm:rA:3B:Bh:mo:Dk:ds:fL:Dz:VK:IK:5f:xJ:7S:eP:ya:lB:mC:56:Np:ss:Cc:uw:pC:Xs:O8:En:oD:fj:EY:LX:KC:cq:Bq:AR:g9:m6:l1:mg:1S:zW:EG:ws:5d:Uu:wW:3j:3B:JQ:R0:WT:dK:Ri:W7:DK:8v:co:TN:Ji:U9:uA:x3:Lt:6M:vL:DZ:HF:zV:UW:ZG:q0:9N:Q7:7l:or:Hb:dJ:V0:XE:VZ:45:GO:LG:zQ:y0:hJ:2C:o6:2Z:aC:2A:5z:aT:2n:rj:WL:iO:04:zd:vK:VF:MX:zv:mU:VG:9j:kP:7a:An:pq:mD:WR:G2:i5:Z2:IP:i0:Jh:ar:Iq:oT:nJ:h5:oQ:F9:8F:XM:yJ:RS:7j:Ho:rm:yz:N9:jG:fp:eI:JE:ek:2y:D6:LD:1s:en:Bp:FU:rs:nI:6N:zm:VI:tX:hc:UQ:eu:6E:Jo:fQ:sH:TU:AR:9a:N7:Ip:pF:SQ:tl:jk:9Z:mN:OS:Rs:mz:hP:LL:7R:4u:NR:Wk:Es:jp:1l:hq:5w:Aj:Xe:U1:gD:z8:d0:6d:o5:rN:Ms:Mq:Ge:0p:vC:8T:Fq:nW:34:DR:hg:S8:ao:eJ:3q:c6:mr:2u:2u:5z:gM:XA:W3:ka:xh:PE:CG:G5:SV:Et:SK:rB:Ep:R8:xM:Lc:k5:Ph:Z7:ga:zc:m1:K7:Pd:sv:59:FF:HK:GK:xI:rP:0k:Yh:qF:og:7H:xD:ha:X8:8c:i3:Mz:Wc:S9:QK:Y6:3n:tN:kK:ST:Su:iB:Zn:tL:PX:kM:fj:rw:LO:Gy:yE:GR:O0:In:c4:99:S6:C7:7L:tZ:4v:zO:LQ:Rg:1r:Wc:7P:6s:1P:aq:oY:vU:98:eA:1o:U2:3x:8U:qu:5k:Rc:hR:dv:hU:Uk:JA:1W:QE:Dz:ae:10:BQ:lT:Ov:sV:f2:Rl:wT:5F:Yd:yD:Nk:3S:AT:WD:60:VD:Nh:UR:xE:21:4l:ob:JK:z9:UC:iS:mm:Nj:43:ce:kc:DD:Mu:FG:9E:qm:Rc:5w:r7:T5:Su:4s:CB:pw:bg:dY:dl:C6:qM:NC:GU:CS:4x:f8:xF:m9:hf:tb:Cb:VO:EL:wZ:OA:VE:sp:o1:S1:UD:6j:qS:i4:VP:QS:lg:sD:Ui:HG:rj:Ka:MU:gd:YT:BR:zU:Am:n3:QE:6Y:gW:1b:Iw:8S:xy:TM:rF:G0:j5:A2:A9:56:Bc:Gp:Ua:vU:NL:0v:Nn:A7:tP:69:Bb:wG:pP:EW:rD:iF:lb:bA:y1:LR:OT:qQ:f5:61:tb:PX:Wl:ap:q8:Ws:gd:GM:uf:mD:GS:YP:3d:pb:Cw:16:cv:OI:Vs:sk:6z:My:nE:PB:4b:vc:xk:w8:qY:nE:Ko:2W:5F:Y3:n3:uX:Ao:2L:P2:GP:e6:ee:hg:4d:WV:d4:vP:4t:bx:GV:iz:d4:16:YX:Bz:yc:Ic:Eg:n4:E4:QH:uf:ax:C8:sy:N1:NU:vE:Xw:yq:qp:85:01:Ii:Ic:vQ:hn:XI:Te:SQ:xY:La:FN:Kt:ls:a7:iN:nE:F4:pV:EP:HO:61:pl:g9:jw:PL:Ro:tt:wL:2k:YA:6k:EV:mh:op:j8:yF:Br:DO:b0:lM:aI:VD:Ih:vr:nE:3h:t9:Uh:oJ:T1:bI:cb:G8:Lb:aW:8w:Yt:mJ:CE:LB:lp:mT:Et:Lw:bb:p9:Pp:JJ:aM:CX:Vo:H7:nu:BM:nY:x4:Oi:jO:3l:6r:1C:ja:Lm:XX:qq:aZ:Gx:EL:1f:Y1:ji:DY:nK:GC:gb:ED:9G:hS:jR:5v:wd:RZ:bq:7u:SY:po:n0:qt:kN:F4:uz:p9:78:28:P4:Aa:nV:pB:0R:Ot:Jh:WW:tK:ce:vJ:Jf:xh:eA:1t:M0:sC:5l:RV:5e:ok:1U:Ee:S4:Gg:zZ:ll:9i:sv:lc:g4:7e:6i:Yo:Ws:uP:Cy:g6:pG:Ld:mR:xt:F3:Eb:jw:lu:8V:Eb:gG:6W:Rf:Ep:EX:rE:pe:XF:xP:ob:Rf:MQ:vk:NP:i8:tp:Za:WO:Wx:Rs:dZ:uL:5V:y7:A5:35:H3:Ve:Cu:Ps:1O:jX:D4:cV:vy:jr:47:ky:wx:AJ:9z:us:pb:eY:I2:Wh:WH:C6:im:jV:P9:na:Nf:VV:nd:nA:66:gQ:1A:c9:Y6:A4:7t:TU:tM:zn:u3:9B:C5:GF:C2:wt:8l:iP:mI:No:1w:qs:sC:tB:CO:bJ:yc:l2:jE:jM:Br:d8:kL:ss:NU:7l:aE:9g:z9:Xt:IB:Bz:It:4M:tr:kE:tF:ML:zA:95:OH:FV:uX:yf:y3:wz:oj:Lt:m1:6m:TY:ik:0o:vK:HA:7I:g8:3u:mt:dA:T8:V5:5u:A3:Fg:ia:PT:p7:SM:Zf:J6:vM:Yz:KJ:So:cb:5l:L8:kO:uB:is:62:hz:vV:E6:05:eE:Xs:rN:RJ:YD:s4:f0:0e:iw:nm:VK:1C:v3:Ys:w3:b3:hi:wW:Rc:By:kE:co:ZX:IP:6Y:RR:hI:rn:kn:UD:5S:TH:eA:fH:AK:cK:PR:cU:jm:ql:pi:6Z:k0:4p:Pm:po:LZ:ac:Dt:BE:sV:Zu:Tr:Yb:IZ:Lc:CZ:0l:Iy:GM:A4:9X:z0:Nr:Bo:JH:19:Jr:jT:6L:kz:2H:ME:aW:9T:ev:yx:g0:rW:HO:dL:M1:Yl:9a:lD:Qx:A3:BF:fG:Rl:ct:AB:37:xy:q4:o5:ei:lM:Yk:Tb:AR:Um:Uc:aJ:Se:FD:IM:2m:s1:Gs:9R:6Q:6v:Tb:u8:ip:bs:Q0:20:C9:9Z:eK:IP:PQ:XQ:FH:dU:3P:6V:F7:Xb:l9:WV:OU:fq:WF:NB:TX:Xh:uU:cv:28:RS:HB:yc:II:KQ:O1:q1:sq:JT:Fa:Wg:il:dz:Qd:AT:eN:E3:k0:ST:SP:Bx:Ej:1S:OQ:KR:la:6f:0C:yk:TK:2b:5z:t4:Hf:qn:Yi:WD:2C:3y:1n:Ad:ZH:ef:rF:K4:ib:eL:yx:fI:VL:mS:BF:Wv:VH:pm:3P:tL:Sv:ez:F9:Cq:Xr:YH:zo:zh:f7:sS:v7:lC:9K:L9:Bj:hg:77:9R:ul:zw:y9:It:FO:T1:Sc:su:4m:HQ:zX:z3:Hx:sw:Ab:wV:xm:kj:TC:xZ:in:Ut:Le:3I:ss:OV:r1:uX:2j:gp:Lr:yb:GT:vZ:AB:2z:Wr:mx:3t:cI:ZQ:Lt:0z:N0:H2:PX:Bo:1g:bQ:q7:18:kn:8S:WE:EX:3A:Qt:gM:VH:4r:hO:6f:ya:T7:1i:mX:5Y:Pl:TU:jb:RH:O1:vp:nK:h4:2Q:6C:fZ:H7:oz:Eu:50:8V:5i:nr:mF:Rs:rF:4A:iT:7n:M4:di:8K:o1:1N:oq:eO:cR:WZ:3Q:16:7N:03:jv:QX:aj:Pl:bN:Zf:q7:ci:zN:Fp:hA:rC:e3:9y:DF:MC:mO:qs:QJ:m1:Wy:W5:r0:zP:rd:gy:jL:6h:Pu:rV:Vi:OJ:TA:Kv:z7:eZ:ii:ym:XE:ra:LR:Hn:ty:ZL:MF:tf:Jl:QB:2i:qf:E2:cu:g7:yR:ls:3x:U9:Qx:YK:gM:82:zC:vC:NY:9x:Fr:xS:7S:Xi:jI:Ei:iO:R9:Sa:Af:an:6M:8F:0P:Vx:bw:7e:MW:Nd:4N:b1:RW:hK:cP:Aq:Me:X9:n1:4M:eO:AP:Ty:8j:48:sW:0P:lo:NN:RH:Cj:i4:57:rX:JP:ju:TP:zs:JK:0k:L0:sS:Pb:0H:ds:a9:BI:CU:YR:fF:v4:um:qQ:S3:B0:C8:69:nS:WH:0z:ML:PR:0R:bk:Tu:ZJ:ts:c6:g4:Zr:OY:uD:Ng:KO:Mo:OV:hT:vE:MW:nS:KN:0X:gG:Ln:mz:Fp:Ol:Mi:FI:WI:Dr:GA:d3:hT:tF:da:bD:aA:L3:In:SF:f2:83:JK:oB:w9:dz:CM:Kx:1E:Gk:lU:Z3:Dp:X1:k3:AM:di:SO:Rz:xc:2P:tY:kX:jR:Xu:hK:Vp:nt:zB:5M:59:a8:IL:A7:MC:TL:E6:lg:0B:By:0I:sw:kN:Fn:8b:QX:Gy:UH:u9:Y1:BK:cE:9X:Hc:iH:BE:vK:Sc:sB:C7:cD:aN:03:qs:bj:xP:ix:mw:ca:EK:cD:25:79:pF:bk:Pq:8i:Oo:56:xI:Sj:fe:2u:v6:AX:Dr:UN:xF:xa:lx:iA:4S:0I:di:mm:4p:JT:PT:Hx:mK:sw:oS:a9:AL:8V:G4:Zx:av:Cd:zv:9V:v2:1f:GM:pr:8c:om:V2:tB:8O:EU:Q0:P4:Ku:4w:mg:wL:DN:AV:hz:Vx:Yf:Dl:cX:rq:dZ:0D:am:SG:EP:RT:xb:Pv:9g:qH:9B:15:iA:Ko:kz:KE:bs:Hh:cS:rI:yK:bE:5C:Ja:iB:EJ:NW:RQ:VO:zR:mC:ZI:6i:Ek:R9:Mu:85:Kd:fC:bY:NE:Tl:YQ:zH:lL:16:hJ:zL:Xt:9v:ve:BV:eu:Ij:0Z:zQ:P1:gq:oz:Bz:I4:UY:a8:6j:ek:GZ:2P:QE:dS:au:QF:2F:KY:TM:rn:7F:fW:Ng:aW:0H:Hx:qx:cY:V2:3A:Cq:d9:Na:fz:PA:HN:hZ:Mr:6s:BV:El:uQ:aG:Zf:5b:Ew:xl:3J:IL:Wb:5K:M7:NJ:64:Id:rG:Ss:P3:gj:SL:sC:qN:YX:Lm:Qk:uv:AA:Zn:BU:97:rb:tz:P2:Eb:kp:Br:TP:4y:bc:S7:Sk:MS:qt:nc:oG:Qx:xc:i4:HV:kK:CC:Lj:vo:jh:pz:1i:BL:oj:IC:8B:5y:iv:63:9q:Dm:aK:XF:b8: | RafanSTR | RmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpn $ | RMBL" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <rmbl@rmblv.my.id>."
  (exit 127); res=127
fi; exit $res
�	����^�����E�TP-l���kԜ��9�JOW��[�\L�H�!R�]A�0����^�Mp�h��F��5X�5%G��ӻtu���X�@�� ��6���$���Q��4�:\�zA	��25��e�Si����v�ɢ��F�s�?�w2���E��ʋ��cV}��/}�������Z�n{�SŨ� ��s�a�ӝuJ�\�����&.57�`�^��kH>^Н�RNߍ}�A:�9�KT���"�>�v���r'�qJq�D ���2�� LzA�;��!�34yТi��h6�U��N`����3-���t���_R�}�+irT:(�d��nj4<v�Iv:�<۹��hb�r����K<=�1!���33�o(6mz#���`����>J[�w�}�LK���*��y�@i�E5;*Ά_�a��S:�����S7�U�۫���	f��
ʼ����~Եڡ[���F�꨼��);�D�ed�ĺ=Y���D�>Q�n�� �U3}���.�+ڇ�rW��oR��=���Z��a8Oh-KX�V�ړE��e�\�ޞ� ��������`�3^U���,v�����:o�?̜�I�����>x��[�2�~]��WA����S�#3J}W����6*����
J�"C����5�p�	>���w�܅
�X�S���rk�7�Ͷ�)�{�xz���Er(���~���VoL��.���q�&��Ce.��"|t�6:}wWBl���xtO)�O���-��3I�{a$�� �u�����煙p��}ۻ����3&��L3w��Z�1�L��;z+x��w���]wU��'�����si+�}�3d}���a���q�Дk�����+�k!�����|3z֌{,���^N[�?䪹͟<�i�}khp�B�9]�'雅�TY�	�H�Jf�=�e=��͒�Rg&Y~T�_�M��x�C�vE VCn����6�ѕY��9[I�da�a�
31� �ѵڣ�/��[h]�hY�[�M��Pb����[�'.ɽ���5G@$j�|��ˠ���0����00��A����l�ma���o[>�N���@��{858��]��CJ6�_�4�	|�-��t�zQ7��JJ2�U�YՊ���#���
f�ؿ�O�X��!�Ѓ璨&>jL���Z8Og���p7h9L^G�t�0�����˵nq�6�͸��J�K+E�z ��ssH-�&\�Y��cv4!(-
ŋ���p3��	Q���A�e�W��o$X0�0
�����H9�e/j�M#z�����%�~�f�Hd0\cL�na����82��,<2+��ig�X+	������K���Q^��B8�X��l�я\��ȿ�`=x�������rg�5�=+a��g�I����'�9�)�?>����b�� [�]7���n�p����߈~;���zWx�+W;�V����� ����%�n޺+��ॲ��W�e<��C���"���j�E8O�*WE8vI,���a�!��R��w�x6��o�bx+�B�=� �j�͡�l˜�¸���N6�n	��N'e�h���z�U�-'��G;xZ�	PU4�=���Hp��J��
����l�х{s-��9�ChC����RQD�-Þ���u�d���Q8uc�G��p.�����z���n�{���w�eF�hR�vH������.�$d�QXw($I�9-�n`�O;k��@��&�������3�J�9�~6oV�!Ip�>�y����lklA
`��b�M�6�sc��|(r������ے`��9�;��m��`ۗwoy ��E�yӚx{�M��ko+�\|��
�����Ǡ��N����T&l�,�wx�O�t�g�u�;=�'g��-��ܺF	���}8�p�a����y< A긢u,#�hzd���XBXg&X]Aň�o[
] 2��P�~��@���mO>:>~�l W���1V t+����#x�:,sJZ�����֡�����jP�TX⍆�ʃ�qL=sU�� ��)^�0��)uv��Ot��%ɰ��5.Ҽl� y��
ŜE	�ms��p���8`��ƊG��9�_9�ˆa\�b�\`���'��;m�-,�mZ��e����yT~�W%YN�1)�\6�n�<��ݽ&�d������$d4��@��T�/�ʅ�@��)�1\�"w��#{p�]y�Qw.�'�[��
��7�;�;m6���rp��~����&�>٤g��$�u�&�Mz�1��E@G3�F�J���"6�(�ɏآ�3��V;x��7����{�vD�S��'J�T�6�?z�#��W�r+Kb�OɊ���xNeiR�Z���3q���Qt�t�;���E�p-^ʷ>p��m�.
Hӿχ�9���<1������Iզ�2M�z�1�3�ӷX��܁BO+���G�d��0����p���}�U�TC~N��k�"1$]�4�L�6	@Z�ԔWW��}szvs�g�zrr�U	���/ҽ>7ɣ68�^ŭ�;��0c<�x�ϋ���ɛ��z�l�!�>6w� =~4L�o�on#�9Y�/~,>G��㊛�;8�j��#(�<���5��Vl���K<�40�9������B?�%%��xZ{VP�p�m���#C���
%��I�tc9��W�$#�
��S���;�O�q)�QI�q� :v.���pn�Ⅵ%'v�"y��u��ܯ�Z��*`��2i��i<���EꜼ��4wo� d?��!))"�?�8mJ��=q}����p��w��ϭ�i�\�h0�3%Wm��Q���O�iP�߷�bqu��I��\���#�i�:V��b/����̹6�z��t\Ux�E0; g�穳��Z�U���s՘�堃m����;���7��=ީ]�E�)!1"?Bk�?,Uo��_Pǭg>�r�g4���2���]��Q�?K!�����`��i|}T��a�8<����W��M�h���o;8Ks�~V���o��;o�@��$� D�Y���L��T��hk5�T�%�`���G7��/�nlL7�ЈyIw:���'�p��e�uE��>~�S@�^���3���{�Ǟ�ga3��G���0J`�լd�ݫ���&�e7E��o�]��>�՞�zG�=��n���g���ʠ�e,�e��Jˠ������v�@���A9dG*�>E��˄:d�ke6Rc��f[g#�%�-�#�d\Ě]�,Q�����c06tP�^F-VIɖ�sk�D�4�F1#En Eu�r�=T��UI9U�A�A�9��6_׎�r�h�����I�����"
c��0G��%�+�"�����Ė4��NG-��8���4�m��V��ʗ�	�l�tx��u�P�{T#�K��q !j%�E��Gʔ)��Ҕ��O� ����~��x�VqUQ�^����;���F�C 5��K$Z��}xo��q���^�{r�����񱎱�?���1�G�7(�\�UO ��`G�n�o�8wEx{S�=�@Yd[ג�J����{!�X��U���`n���$��췞Q�Q�h?�}H�|t�ٶ0G���K.QY)l�Bp������\�wi�R�-ф�&{���QY[sR����Դ[�Ξ����D �~?Q���z�p./��^ mߣ��'�d�EP���l���SK��aIc݆]�!R�(�W�N���)�
_�����t��
3ό~Ͽ�	-�@ĵmF�똍���Q[�@���\�ޅ�"�5��ȁ��V;���^���>��r����p��%�#I�4"Ѧ���P� ��~q�	{V����6?C ��\m#*{�]���SY*΂k���}��?J��m*v�lY�<R܋�{��%VmY>�c9�B{�_�g����1G9�&�z��}Y{��C����x)���s���nG��*y5y�bofT���yN�SN4�ut�v.Cl��)����R �j�Cn����6�D��e��Q�� %}`�е�W�=��N��ট���wS�O��(vcY�̥�ĵ.��zt\��渇�})�%��K�u�Н�(�Jj*��x��$��?�⣘Ꞵ���Wl�7B���$`���EG�m_�̂Ƴ4�Q;���f��>_��� ([{A�|w����~.}�*>�}�@ �.�"�?G4�[��9D�듸-��� 1B߳D/����n^�'�.��K�����x�7�|$�-]�rg��.�ۅI���s8\<��癬�@w x�Y�f��E��ŉ�y����ⴕ|��@F_G�I�Қ �񝐗T�i�?$<�V����y�����>-@Caѧo?�*��I^����KYөD�������<wp"7ԏV��:��!BL��G;�ER_)O�ײ��ĭt�����d(���`���ӫ�q�OWN�Zư�6 �OsPpИ>-����|�������z��!�)u�eG��!ײ��v8����%��	���)'9�곁٩����r�V�6�����`.��i�Mx�{���6��<#�
ɗ��b/`�+@����Ҥ��i��?j���N��_�����z�}&lyd��A�?*85hC�Q�}{�՜ ^�mh�B�-�ס��D�ؘ)��X�~�l��(mDerwkʢ+�f<LS����fg۶.��Y�,�!]r�>�AB���I JަOD��`G�ûȌ���o�X�ten����	݌n�y#�ȇ٢���c�a�l�*����GÔ�QW:v��E��>�$N�N��X�STíA}��Β ��?�Pر�>�e�i������X[�\���	��bsJ�e�u2Ly�x2�R��vi|���y��-�ROW�lyOă���������![��v/c.���ş�o�b!�����%��?�jx���� A��]�w>���;�:,���&�!sD���2�U�[��]LUU��6n��I��/��:f����9��oV�W��	�����P�)���`:W�'�E������QC��t����g�i��B���r=�y��C�)k����������"�����P;�E��ݍ��x���ӈr�I��,+��m ��ں��n�%�V��Pv0� ����٧+�VYVgl�9�释�{��8ފfjM��L�k��"�����Y���	@Q���J�m�.$Y������o�/)Sk��n2��^ލB!��F(�*��ׂO/�b.D�C���%�u� ������4ϣ$�E���+P��ۉk����u��|�H�%���