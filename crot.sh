#!/bin/bash
#
# This file encrypted at Thu 15 Aug 2024 06:02:23 PM WIB by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "Anjay password nya mana 😂😂😂😂😂😂😂😂 Rasenggan (Ah lupa ga ada emot Rasenggan) pakai api aja dah 🔥🔥🔥 menyala abangkuh | oK:ev:LL:zj:ce:gO:WN:ww:2i:RU:61:fk:wv:8g:jw:01:sP:Lj:b9:oG:TN:IA:I2:j9:U0:1M:TY:Hb:2M:jv:a8:6F:rv:HE:Tx:Fv:bF:JY:5T:k3:PL:GL:YP:m7:5j:mB:9k:6K:Q7:d6:mG:7L:Pa:Fw:1y:4M:PV:Tn:GK:QM:zI:kE:qC:mM:ZB:nF:CO:Ke:AD:vH:2E:D5:aP:H2:8s:rK:VW:yy:W6:U0:s9:SU:0y:Mo:jg:Nm:fS:UK:ej:Tz:7a:sS:5B:Kx:vZ:aA:3u:BA:dH:Zw:ur:1i:FQ:Sc:ai:Q1:ha:3L:Zo:kP:9b:2h:a1:4Q:1x:Gm:Li:qr:CJ:TZ:qj:D8:SN:pv:Xu:Yi:4M:xO:8f:0y:e1:dX:bx:qC:fp:dU:Cf:uC:1F:dT:tB:ZW:Yg:Jn:3A:CE:C9:8C:g5:aD:AE:qv:8m:lR:tn:vT:i8:8f:GE:kd:aw:Jg:my:Ho:QT:al:n8:v6:eK:S9:1l:Bk:KQ:rT:ws:SE:EM:1j:ig:N8:H4:82:JH:Qt:2j:o8:5y:qw:dT:ep:eE:QT:1b:pF:nc:FX:9P:UB:8h:4q:oP:q8:f8:A4:U1:nJ:qR:fN:3l:aR:qg:fR:td:ZL:xj:a0:JW:oX:Sz:pk:OU:ym:Ay:mw:OG:mQ:Uz:6u:xs:h8:Sl:BJ:Gs:pv:0l:Kc:3Y:uZ:fI:hJ:jj:Qp:93:aW:t3:LQ:i2:f2:JU:sT:sq:DW:gq:oP:si:yS:B1:Tl:YB:Fu:UK:TL:4i:Qa:oz:LN:xF:iZ:lU:2u:lS:qH:Vk:cI:HT:ZC:0k:VL:2g:Xt:Vn:35:4D:iH:Ez:ye:i4:2o:U6:DX:lQ:my:RH:wS:l3:eC:Ux:0T:7X:nv:5z:9f:M1:BB:pd:vY:SH:Sy:6D:ZS:pz:iz:u5:16:ri:fO:bW:Yg:I1:3m:Tv:sA:o3:NJ:Tl:zU:dA:Id:M7:Qh:Kn:u8:Xc:xk:jn:o5:PO:3y:VK:nV:MM:sz:QB:3v:uq:tp:sc:v6:3A:wn:xI:DW:nI:L5:5N:L4:Im:ml:RL:Lv:H3:mp:iT:19:fw:YG:ml:Rw:bY:oU:PI:rx:Lo:FJ:0V:mx:6V:xo:O2:Nz:2b:in:dc:gM:RU:b5:Su:gV:zz:1E:Ha:n5:dz:KM:ZB:8p:Tf:5w:Zt:qa:9p:ZP:vz:r7:vM:WL:UF:YO:Yu:Ek:uy:aA:Wu:AB:59:j1:qx:mM:Px:bD:wD:UB:gd:ve:mc:1N:Wd:nT:Qv:Mu:Jp:Au:LX:d2:kr:m0:nx:2e:mC:YP:Jz:4C:3X:pQ:kD:Bu:Km:uX:5c:4R:Ix:kK:No:3u:D2:gB:MF:3P:Wy:vL:9r:zK:bA:b5:24:U1:NX:hJ:eI:SJ:tU:AT:Re:an:Zv:rr:nN:z6:Av:Rz:29:SQ:jW:U5:XT:bl:Zq:yS:Ng:Ct:fz:kp:ZL:oj:TN:R4:z2:PD:Ps:zf:JY:4l:RF:7j:9f:Fe:OT:ZJ:VE:36:Uq:DK:wt:Q3:cb:9W:sl:Zm:XT:A4:bI:iy:JK:vn:oJ:HS:RC:DC:pR:RD:Jb:ka:QY:bj:s3:5i:Uk:AC:c3:1f:Oe:UJ:nE:8E:6l:Gk:1F:AU:nW:lC:HW:hR:jX:Sj:6S:5w:jh:s5:uI:5l:go:14:fH:yG:cB:cC:uJ:60:wd:jE:WJ:BR:Kt:vI:JI:9H:5P:eS:Mq:E2:5s:AN:EY:7p:uO:n9:lm:5n:T3:zz:A9:0a:P6:Un:eJ:jb:JI:MX:Rk:EF:Tl:RH:72:qn:Ko:y6:Ry:uR:x6:gf:rH:rQ:51:qs:70:EP:zV:7O:qj:BY:XK:PJ:xU:Zu:W4:rp:xL:jH:SP:N2:nV:kY:4W:gq:oH:Uj:IJ:co:FM:sC:Nq:w8:e8:35:id:V6:EH:07:pS:44:Fq:Md:Ee:Qj:OA:aX:xq:xy:3p:Pe:iw:9d:Ol:Q7:J2:aU:3j:l4:FM:f6:9K:9U:lK:ff:77:Mx:4o:r8:dG:op:Jo:Um:DW:XG:pG:Qu:GJ:rd:nH:qD:cO:HX:gO:qq:hD:9j:kD:de:If:ee:0l:aW:9K:Wi:FF:vZ:OM:OQ:od:kn:4m:RE:aZ:bK:EM:64:tN:Jh:WV:9D:ov:eF:Rm:o9:84:Cb:wj:55:YI:ry:cS:oJ:2C:CH:P2:xT:zK:bV:zU:QF:oA:Bk:3g:XO:zj:Pk:Ok:Eo:xi:8N:t3:E9:8V:14:GH:KO:TM:lm:CO:o8:gB:72:Kr:PT:Kp:US:Zs:l8:XQ:va:Yi:Hw:50:nJ:Hw:pE:33:JO:Tv:ur:Hh:Zm:ZI:In:Gl:G3:Fi:8F:y7:HJ:vo:h3:om:7z:lk:yb:A2:Ku:lG:WD:wc:TB:cC:Y4:sB:tA:QP:aN:eY:ms:m0:BH:us:0f:vR:Jb:Un:zu:QX:y9:Li:ft:YA:Ny:5K:IA:Rv:SL:w3:lL:d3:RX:kU:un:we:SW:Nb:eb:M2:93:yP:OH:VT:O2:6J:d9:5K:Kf:OB:BF:VD:rr:Vr:uy:A7:IG:2X:tT:EH:Hg:hY:r8:SR:4L:Tz:XL:i2:Td:R9:lh:6n:1W:Is:xU:vg:nE:AV:iq:dO:Zh:OF:vm:nR:jU:HY:5V:VZ:Wf:UY:e8:Ey:7W:6a:JK:GW:DA:il:pY:m0:iA:7o:w3:Cq:OQ:8v:kg:Xl:kq:r3:9Q:bX:A1:UM:uo:2z:qB:oi:Ie:nG:GL:8D:lE:6I:R0:8P:WO:vl:VF:vZ:Os:fp:MA:cW:kN:Vi:Bb:FH:Cq:hL:t4:QY:9C:vg:gk:ga:zi:Mk:Yl:aA:IM:Rt:hv:5u:QE:ZK:NO:By:uq:L1:vN:Sf:t5:5r:vD:bk:yU:SL:QP:rk:Zt:xN:SC:YI:oy:ZG:wX:Vk:YD:LH:VN:Jn:jU:e8:9y:d9:5L:pz:Xx:YU:gs:An:jK:v0:OJ:HI:QN:NE:Bc:ra:5p:mp:70:EF:QB:rU:l8:mN:5i:e4:s0:Ba:rD:zJ:aj:Bz:Yb:sW:Rd:O9:00:kd:I0:xg:Ib:L1:7i:Vb:Yp:hb:P1:d0:p5:AH:Sg:nN:mw:Et:yt:u0:YY:57:IB:Q1:ac:Ci:xt:CU:Ph:7R:3v:CL:ZW:LW:1S:Rs:FQ:Fa:iw:tb:Rh:fa:mC:6W:XD:Ki:GZ:Rk:bx:2D:4R:Ys:oh:zn:Wf:8r:Eo:Lj:oo:kK:qn:NV:vx:K6:bo:tH:k8:im:vo:aZ:OS:qG:dy:85:XD:a1:V4:J3:kQ:QK:1a:2L:aw:Z9:JM:l4:Rk:MC:mJ:Wz:Yo:JM:Rw:qn:H7:mt:1Y:D1:Tv:2a:XP:Vy:dA:AG:Fm:gH:wu:Rt:C5:it:Z4:7I:T4:Pu:Cw:XY:DX:VN:tu:Ev:2k:Gt:GQ:Zz:r4:Wk:4t:LI:i9:ad:2l:pU:tO:E1:hm:bU:82:GJ:Ta:os:am:2E:hJ:QC:xj:2C:t6:a4:Fp:y7:ko:rN:Zo:C3:Tq:0t:AW:3o:lh:i7:Iu:J1:XC:yK:MU:Ih:28:2q:qn:MS:CF:3T:af:WL:ye:KT:JU:C2:ZR:eS:Hw:9T:r3:7j:sS:4k:li:Jc:LK:xr:dU:Do:V1:A7:tx:Vt:Ca:qU:HJ:6V:0W:bB:uu:rS:M1:i5:k0:xb:TH:Yq:2O:Y7:GG:eE:mS:LB:72:Il:uw:d4:u4:Xw:AE:jh:M3:Ve:Eu:cb:HW:CL:cY:JL:Ao:0v:e5:bO:OL:1A:Q9:x2:SP:Bu:cy:AD:8E:rD:VB:P0:QR:Go:pQ:ZF:kE:G9:2O:jJ:kW:lK:8Y:8h:aQ:Mo:Jn:9C:qA:sm:kq:cs:F9:k0:8w:Pk:t3:BX:2o:u8:Gn:dA:Uv:6c:Os:qE:I8:YX:tJ:h8:60:1P:Ey:91:iU:02:wi:yc:vB:3L:zO:6x:o7:aw:br:RJ:Qp:6C:ci:y9:0k:IM:Eh:XZ:Z2:fd:mJ:aP:IM:AA:Ku:Ct:ZR:vb:j5:TB:WK:KW:XR:hh:R1:eU:hd:Df:6y:TO:t6:Vy:IE:oV:FL:l4:lF:rL:3E:kK:wU:pf:pT:si:92:jN:xn:GW:si:lE:dq:yK:V8:QV:fo:K3:Al:8g:Tk:AE:Fo:ia:XD:C0:fv:Wf:QC:Hi:mh:Zs:3k:dc:4Z:xL:wN:uu:11:1z:Hb:q0:Br:50:SC:Q3:D8:De:C1:0N:bO:hK:HS:mu:qG:RL:8D:eT:ud:He:dy:Zx:w4:1G:rk:3n:oH:DG:pJ:l1:0w:5c:Ah:GX:Yf:aN:qc:R2:IR:Vd:YQ:H4:OZ:42:bk:jf:yk:Yw:ZO:Tb:Nx:MZ:Cj:es:pL:TE:Dh:7w:ov:Xz:yf:nP:DG:UO:SU:XW:9G:A0:in:1o:7p:sW:mY:sk:NW:Fa:jL:lw:kN:3y:By:hK:97:ZP:vG:Cv:Np:fS:Yq:Qg:gy:pq:1H:eI:k3:ov:Lb:XU:KY:wE:oB:Hq:Wh:9w:Tk:07:7f:ol:cG:BD:vs:P4:wZ:nO:Yg:11:fm:q0:KN:cU:SN:Qm:VW:6I:U8:AG:Vh:6Y:E3:GK:1L:hh:TF:17:VW:6y:2s:LA:Hs:DD:s2:ZE:Vj:jW:cG:Uw:4c:eJ:pH:f9:r8:0W:iI:Qe:sw:Q6:tT:Dh:A2:tw:Pn:3R:Ql:Dk:xk:RE:m3:1w:1f:x6:6x:YI:VS:L4:aH:CY:MD:nI:le:2d:BO:yw:vz:Gn:4F:IM:sI:gu:yR:DT:PG:bu:1G:rP:0y:eN:Nf:L8:hw:uC:y4:2I:7H:H7:sP:cO:nM:YK:Ny:ce:L6:jm:Zo:ju:Rc:3J:aW:hH:s9:cx:2Q:Pj:uJ:lg:A0:EJ:St:u4:bq:bj:jk:rp:VH:4S:DS:vx:aC:tC:NM:nU:17:yt:Hn:oc:58:1D:66:nb:6t:Ez:hQ:0I:JP:9M:a1:NO:lx:WU:MG:Hh:Gy:xI:t0:Ag:8P:Nz:3r:0P:Fp:0p:kX:FB:X1:ao:KY:bB:1G:Ea:l0:Lf:9O:8k:Y4:kC:b2:2j:6A:5U:1R:T4:gQ:eU:Ky:wt:r1:M4:QW:GJ:c3:eL:hp:r4:4N:8n:YP:Xr:lp:Gi:r4:Jg:ae:fq:qQ:BE:pJ:iy:i1:NU:2u:B7:m3:te:Tm:z3:Ei:sQ:H3:TO:nu:Qu:l7:K4:Ne:ni:by:9o:nS:LN:bM:lM:lT:KK:qH:au:HT:Mg:w9:NK:Yu:YA:pt:LP:SK:lj:S6:pM:Y2:Ym:1c:hw:S9:wx:4n:eg:8o:MD:xi:9U:HP:vQ:nF:ZA:MQ:9i:RB:0u:S9:8X:Ek:Pg:3p:8R:WU:3a:Gh:SZ:ev:7C:8J:o3:37:7S:ed:gc:Wj:vR:Rh:Uf:Da:95:jW:Bn:yQ:L2:5Z:mR:ad:1R:aC:cd:CV:Mp:hL:uL:un:oI:eg:L9:V6:fR:lg:Lb:Wo:6x:OD:Ip:vF:HS:FT:Mq:8x:yA:Kb:uw:G3:Gk:8t:kq:BU:13:Pw:8Q:Wf:U7:XH:vY:wS:6k:O6:Tz:Mq:9B:v4:oe:Os:1p:R6:h5:8X:vn:tZ:YV:Ty:Q7:dn:Ku:ow:nC:a4:FV:Hw:MB:MN:33:BG:RM:FD:aH:MR:5H:IZ:DL:Rc:Zb:N5:Oe:Zd:B7:Ag:uk:CT:Xf:nY:BV:za:CE:QF:aD:79:zn:PI:9F:VJ:Cz:BU:LZ:XV:hF:kC:dU:wV:oo:2X:oD:xL:qi:RX:BF:qm:zf:P7:ow:DC:xr:l5:oA:pw:Ut:MB:Ug:bR:qx:2c:5t:aa:4U:Sk:MY:HI:M3:xP:BU:sl:pH:pH:RT:LW:AW:8W:oy:3Z:QJ:jI:P6:ix:Sz:XL:RE:Xr:Ir:JX:ax:dc:1k:1X:GN:th:5g:Xs:qM:az:mY:Ob:L3:Q8:BZ:Kf:Mp:G4:8x:eq:KZ:vp:po:zK:Ny:ou:4e:Ep:Rj:Yf:H0:u1:xR:Ow:OW:0C:Oz:y2:f5:nO:lG:E8:ux:sY:Id:SY:KM:5y:RZ:G5:zo:Dy:QY:Im:rs:lw:WP:8l:4c:z2:X3:zq:t3:A9:5U:ki:I2:pm:tQ:fc:Xu:Ee:rT:32:78:qt:VM:Ue:CK:HJ:JS:ik:Ad:nf:Po:Zy:2S:JE:L0:P2:F3:vR:mG:o9:Yw:bh:Ot:Iu:2a:OM:SJ:xb:TE:vY:xr:p6:uO:VP:Wo:2H:x3:Li:Xb:bj:ug:An:Se:eO:x1:As:ao:Xs:ff:hS:lq:un:Rf:sb:P0:xz:37:Nc:4I:AW:JI:lH:rd:EO:MZ:oD:rF:ea:ip:Jm:BT:Ck:3s:8W:y1:Q2:vX:jz:5N:yI:SP:Lg:Ed:rn:wf:lT:AQ:7i:M2:VC:xM:lV:2E:sS:lR:Qv:cH:19:3B:7b:vJ:qf:XY:wp:f3:XZ:Na:3b:Xj:6W:Qe:fs:FU:PP:Qa:Bz:Tq:rx:LJ:QX:YF:iW:Qz:gf:85:P0:le:kv:Za:ck:My:31:ic:ps:Hq:yj:2l:aT:2B:mK:zW:1W:Cr:d7:CO:K3:FI:YN:PH:4n:dA:bJ:IN:YQ:Ps:I3:4r:ix:cX:sW:yz:z1:Xz:6j:um:Ny:vj:Rr:RH:gd:p0:4k:yZ:zD:o9:6a:Fj:am:Eb:ok:q7:z4:1R:qW:LF:wH:4I:4G:lJ:0K:xL:wC:SM:2w:gs:03:zr:PI:2F:e8:yx:yt:mn:B9:1R:mI:Ad:sD:Cv:zQ:Ss:Y2:Xa:vo:Im:ng:mN:J8:wL:4H:Iq:op:V0:UV:Vr:iO:9v:mU:nm:nq:Kq:e8:9g:cx:cW:oX:Cl:Wn:TI:wz:Dw:uF:ZM:cY:bU:Z8:TI:Ni:3p:yI:CX:23:Lp:r9:dH:dl:Pd:NJ:jG:w0:7E:P6:Ti:bY:jL:bq:Ob:Je:rX:e1:54:XF:EY:sy:VY:wa:wb:hZ:yx:Bi:2g:Mo:FX:m7:qd:xR:WN:PK:Aa:80:wZ:NM:WE:Bt:GU:jJ:0V:dw:TM:fT:Rw:Ss:iM:ho:A3:K7:kB:Z6:YD:Fx:9Z:JC:t5:Bc:Mc:MV:OR:18:I3:2o:Tk:2T:I7:fD:l8:Wq:8a:WR:uk:4S:vT:rs:wy:Nq:0l:lp:aW:dr:xy:Rk:na:Mn:kJ:pR:gH:MQ:30:Sc:Vg:EY:H3:dl:B6:HK:dz:Tq:um:SZ:7j:ye:9r:Yh:y7:0O:RG:90:h3:Zj:dG:us:VG:48:CO:Ov:zc:4w:KK:Z5:1f:qn:z8:sK:WQ:tD:t6:WT:XG:dE:wM:vg:NF:Rr:Um:hO:A7:s1:vU:Gu:Z3:DQ:F7:Mw:dd:Rr:TU:as:vx:Av:6M:3s:oh:AO:YY:20:Aj:d1:bq:Oi:uQ:XM:Gr:dA:8M:6k:gm:TE:VP:aB:Ke:qa:dK:VO:To:n9:cX:LN:cX:ib:YZ:pZ:Sr:BH:WL:xK:h2:Y2:8x:t9:jn:2m:1U:95:Cy:hG:qK:TX:FF:hC:Wx:7d:nH:3b:dn:BH:vZ:8l:Lt:kR:B1:1M:8n:F6:xY:xu:kJ:Wf:0n:IY:Du:R4:OU:Fe:s6:5j:98:Ry:zZ:nQ:WN:lW:Dm:7U:w4:2O:jl:QY:Q6:oN:Hm:Vt:ut:HA:7W:iA:5i:24:N0:wb:Em:yr:cO:Zv:IF:4r:RE:s3:sp:J0:x4:Oh:bF:XB:yH:DA:Vq:sa:Oj:gw:X8:yZ:Ny:nY:Qh:1A:is:X0:V2:Ri:DC:Xh:TK:v9:qt:kQ:55:z5:gB:nI:z6:Pc:9R:0Q:21:nj:L9:nS:Fz:xz:9s:Su:vW:wZ:Zr:aY:Qp:JL:9q:K4:XA:Sp:t9:pY:mn:Or:gA:WD:pr:aM:rL:yu:Hl:IU:ew:89:eu:op:b8:Sj:cA:gR:9O:yG:yn:AB:LF:4B:me:cy:tP:LC:CW:Qf:0K:wu:2W:fd:tj:Ki:8v:dS:pn:Cn:aJ:5c:J1:Zw:BO:yv:zT:n9:Zi:15:QS:QT:JH:5Y:qk:Ce:Pe:yC:ld:Ic:Gu:lO:W2:wA:z1:9R:xL:Ew:jq:pV:3c:CT:1i:rW:Xf:iz:S5:D8:ow:vq:lL:AO:c6:qe:QK:PQ:9H:sl:Wp:s0:rM:8B:cQ:Hj:dv:yz:7S:pM:23:xo:Wm:pi:JW:41:Iy:64:md:rr:uu:CE:Pi:lr:mo:iD:Rp:BK:ZP:u0:Bu:iJ:oR:TR:lz:Pv:I0:mx:zn:zG:jb:Jn:8B:0A:ra:tC:Cj:hv:Kx:bE:f9:JV:JF:JP:5C:EE:qO:hK:wT:qq:LT:gi:vK:ey:58:lA:W7:A3:D7:94:dh:OY:Ww:0V:qh:cB:XN:FR:Gz:Pv:fQ:PN:O2:dk:sj:Zi:5G:cM:ig:Le:vQ:59:tL:tg:jx:Ui:ja:aP:NA:ki:n5:lB:ei:J6:NO:Lm:Co:wq:NZ:Jp:T7:hU:VS:vi:OJ:Gz:3W:My:IB:US:4u:Nc:qD:lb:LZ:pW:By:tw:SN:Rj:KE:ja:Cm:ac:nd:th:jh:B2:zR:CU:a6:2Y:Je:yv:LF:45:k6:8p:62:gt:VM:qP:je:uy:g3:ry:oU:kK:aJ:wI:uP:4c:E9:0n:ol:pR:zM:Q1:mo:5X:0I:Ws:AE:O5:NM:wp:DM:Yr:od:Bb:VA:O5:P4:zn:ZA:Wf:9p:Bm:kV:Wv:8x:TD:yP:gm:8Z:tB:FC:Gj:QN:Xq:en:et:Jw:v1:Nd:KT:47:Pv:7H:p1:JO:UA:iU:ho:66:XS:44:Ab:7k:lr:om:3i:Le:nU:pz:LK:sY:Ek:5C:W2:kU:av:YJ:S3:U5:RP:Pi:51:lq:0H:2E:l0:cZ:hg:jX:so:Fo:Wf:zY:KN:TT:PM:sU:rz:aM:BL:jm:s7:l8:fe:Uy:6R:cL:wd:fu:o6:DL:9V:38:O7:CE:uP:Xl:a4:4q:6x:pH:xJ:Ty:c1:hK:lB:Bo:QN:MQ:ph:3e:ez:tc:BG:Iq:sO:91:sp:sh:7F:x3:1B:Kd:an:DQ:GD:kG:oo:qH:pB:nm:Ok:is:pl:SB:Ti:YB:1T:ns:1w:Yh:C7:a6:RG:Rp:Je:xx:qC:jt:m5:ME:SE:wk:US:hT:dq:sR:wp:Lj:bl:vV:BF:4v:q5:4u:JG:Rb:2z:KV:dq:J9:jI:YZ:qz:2C:2q:o0:Mv:Jh:4D:F3:T4:JJ:If:ai:IQ:jJ:uP:kZ:BU:Im:3Q:t4:yl:8V:r6:yR:a3:Xi:kI:WL:NA:qg:tG:s2:Fa:v9:4d:lk:iT:x9:vz:iF:TG:v1:Gm:Ee:Ag:3E:7O:1Z:A1:UZ:MW:vi:5s:DG:C1:5h:Lk:QC:7P:tH:Aq:nX:va:wE:Dd:Xr:PO:SX:nG:Yk:ee:7K:iJ:KM:in:dP:Y9:13:Tq:pw:27:Ii:hc:pi:nC:Op:mZ:Xg:kA:cq:G1:ie:yn:VV:jA:va:BE:nZ:q3:5G:uC:uv:Md:jU:J3:Hs:zs:mW:Sk:kV:di:eh:pt:wa:ww:r6:bg:tx:6d:eR:Ft:BJ:2p:aZ:mK:fM:KM:LM:Rg:A8:SF:I4:hG:Gi:ax:CJ:4G:mp:go:Pv:o4:Ol:b3:nF:Y4:CH:qx:34:2A:pp:YV:90:xK:nC:u3:yq:cB:UJ:8m:oq:8h:fz:t0:MW:AT:pa:6Q:UU:G9:1r:la:yV:Qy:sm:eK:RJ:u2:8Z:jJ:p8:iz:JG:jp:8z:Rb:3C:gi:cb:mM:If:SG:r7:YO:BQ:bE:vW:KA:Xx:yv:ZM:aj:wv:AL:wz:8V:r9:Qj:hp:rU:i5:3u:mw:r4:Qy:uD:fH:A9:wn:Ct:eg:GG:Ik:zx:PR:mU:LT:Sy:kS:ra:Rm:vw:l6:zh:b9:Lc:sS:nL:t3:PJ:5W:o3:nc:Ju:cq:5Y:MT:C4:zp:8c:9m:Z4:F2:eX:0o:vJ:iM:VM:QS:kk:6O:nX:F8:7A:u6:zv:JI:Ia:1h:uu:PH:Oq:xs:MS:Zn:5L:Pa:UW:TU:dC:Mx:YG:sQ:p0:2w:Sf:g6:lR:zM:XT:u7:TR:gz:Hu:7r:Rx:zR:lD:6l:0H:OF:u2:6n:w5:Kv:DM:yJ:Mr:Vn:pZ:q0:Qz:oa:7m:BB:DX:SW:bW:Lc:ws:e8:6n:tn:uj:oR:Tu:t4:po:He:9j:kR:9M:g9:mZ:2L:dA:uK:7B:gj:xg:Jg:8h:l6:3K:Qu:lN:Qh:w0:12:4Y:Q6:yj:IF:Kt:Uy:mS:jr:5D:3K:Yu:TT:Ri:cv:Pf:ME:mS:Tj:S5:Fo:L5:98:QG:Ah:cw:Oi:cn:u2:AA:k5:Gk:fk:Je:MU:WG:eq:ge:lN:GM:L2:pp:F3:S3:sg:OY:bC:Qv:Ym:jZ:YS:uu:Vv:IG:zU:d7:wi:rI:ZO:tW:X3:q6:8I:u6:Xk:m1:VZ:3e:id:cK:yp:DP:Je:sU:1D:rS:HX:nR:vu:eZ:ah:kz:DM:sT:7s:R6:Tq:G2:ol:vx:0B:LZ:j8:Kb:Qw:bs:XO:TE:eM:qT:dm:Bw:qZ:m4:Zw:6L:T5:Wn:lL:ZS:aR:yn:Iy:7r:3Z:Bn:XK:AM:wC:ei:nt:hp:n7:zh:VE:Nv:y4:7I:Qd:u3:Oy:NG:bO:JP:X2:ol:YQ:0K:XQ:TN:h8:WH:0t:O3:qb:Th:iR:O8:zB:bl:DF:br:CT:6Y:mS:X3:7x:Uy:H2:yb:dA:VR:hc:2p:8x:Zw:aI:b0:R0:vO:Gn:WB:XH:07:rH:DE:wN:yV:HN:am:Wp:86:GC:oB:yX:qm:B2:7k:Sd:qZ:qa:FB:wW:ZC:fK:vT:Eq:Lh:cc:Ef:6u:iI:D4:dy:FA:TU:g3:eA:tC:0R:8y:Qp:fG:8R:Gb:20:im:up:gI:Cu:cH:oK:7C:GB:Zh:aB:jR:KR:CH:jN:cm:IK:tP:QU:nd:k5:wC:Rj:7H:KY:Ag:Pk:mS:Ex:1k:6W:I9:M0:Oj:Ac:P2:uE:YY:tM:z9:7S:P9:8K:50:5h:lw:LK:6t:Pe:Mf:M5:RN:Dt:hm:Y3:X1:bB:Os:rP:gR:zm:CH:Ds:xI:Ou:7I:aa:Zw:zw:R9:wN:gZ:wa:97:Bp:A3:iu:hN:7D:dn:0J:ME:iP:3h:kV:sF:W5:n3:r7:UR:Av:YD:ak:sb:1X:99:QE:aP:5A:aT:5a:Cy:YA:Aq:xo:Kp:M8:ah:bu:SA:tE:jW:kL:WA:CP:x6:Fn:5s:ko:fT:p5:oV:2f:L8:xP:SM:Jl:SZ:DR:k8:nC:vY:jV:Ly:5C:n7:Ds:6L:gq:Wl:OR:XB:50:2u:DR:do:5n:ck:5l:t3:aS:wu:ye:Gq:nO:xT:oz:BW:XG:44:Zo:it:0u:DJ:PW:Av:H0:zs:pk:aF:Pe:Xo:9U:9S:aY:U8:9j:di:34:h6:OL:gj:FJ:LY:XX:Gk:G9:J8:t1:9g:x2:BC:xj:kj:Ee:Rb:EZ:5f:SG:j1:9w:CA:ff:RN:23:Xe:Vk:vn:8v:NR:8i:Mt:bJ:rB:rB:90:sC:qG:Xk:v4:lA:5e:Uu:Rb:GY:cQ:PK:sQ:od:fs:Yb:3t:n4:aY:TG:TZ:aL:v1:kF:Kx:x9:qA:kQ:BU:KJ:B0:HI:7U:h7:iB:uZ:cH:cC:De:lU:kp:3t:eE:hS:2e:Ry:yQ:9j:Sn:WM:lJ:Ro:27:CI:ru:vl:YJ:3l:4R:I3:T3:SE:G0:m0:Ds:Vh:9Y:qV:hV:JW:rV:ZW:Ht:NZ:Jr:9B:TK:gG:A4:nr:pQ:HB:9y:uL:0K:lW:xg:Wt:M2:da:XX:JU:Z8:Jg:pn:BH:Mc:eZ:7U:pE:ym:vz:9Y:Bi:1p:yz:Mk:QE:2r:iu:H5:7q:P6:ea:lw:2k:Lr:oR:kz:hk:md:N5:hE:ri:vN:fC:BP:OO:mY:0e:F2:Wr:cG:ZA:KX:4v:K4:66:6e:Ds:sU:u5:IS:Zk:y0:nz:S3:nJ:tz:x0:iu:xK:CZ:9S:gL:tI:dc:4c:5Y:qa:Ov:pJ:Mg:GR:qw:8x:3D:xm:0t:5X:ms:EK:YG:UX:9F:Qe:OS:As:f1:Fn:ve:xO:8g:N6:XK:8Y:X8:gD:FM:Km:Ub:MI:T2:2e:4K:YG:pr:Hs:9t:Im:ZF:dx:Do:Is:uE:uc:65:aF:cw:3A:Pg:2q:Y7:sw:6Z:I3:CJ:3m:uf:nF:Tm:nc:41:oy:G3:HF:vw:at:QT:AW:bV:Js:rI:rC:n2:Ju:W2:Kq:Zh:05:61:fI:1u:vM:tB:Mv:lO:tn:G1:VP:za:D5:oo:jq:WD:aR:VZ:WI:ht:Qs:Iv:5Q:Rj:ju:Sv:OY:Kf:O6:Ke:YS:qa:NK:PD:pJ:PC:1F:yK:Ty:V4:Zk:2l:mJ:xz:Z3:OU:23:E3:Lm:b8:Gi:zC:Da:BR:u5:MW:gd:xm:9j:uT:pQ:BR:bV:LV:lS:xy:Np:qf:dU:rW:Nm:ro:NN:sC:1M:Lc:lK:ug:0f:qv:sY:gE:EK:QP:Fp:80:6j:eH:yu:v4:57:cS:C1:uT:Vt:DI:vh:iO:eI:pH:u9:2h:cl:B8:PQ:iF:Zi:5J:JY:in:sg:4m:hT:DH:6R:lR:KY:tA:S2:K1:mQ:7Z:tw:qn:rq:LW:h5:2r:fd:Bs:93:xN:my:cv:ES:7w:I1:4U:gW:BL:WY:vA:Yi:k3:ks:8B:uw:67:pq:DR:Md:U2:NO:vt:rY:7m:I7:iO:2m:nV:7P:di:8j:Ay:4s:Ed:WE:QG:Kr:w8:3j:4e:Ev:qh:Ro:l5:9G:jO:o1:th:Uz:sI:XF:wN:8N:ja:2l:5J:cQ:CV:5H:Hh:3y:Du:CF:Am:eK:jd:Q3:tC:RI:Co:4M:52:u3:Ty:yN:Sv:TU:cr:kP:kL:LC:dO:Na:i5:UI:6r:K5:ZK:Wi:8d:8S:CJ:IH:MO:8c:Bb:p8:e3:qg:KU:rm:Mw:uA:Ne:sL:MG:Vp:P8:LH:KR:f3:mt:i2:mm:5n:AV:SF:xs:aq:Cl:SM:qg:PF:Vx:CA:2z:CI:kF:jK:ZV:zM:Lc:ts:4m:Tc:7C:Xm:dG:j4:18:Za:WI:do:Pf:0Q:Un:dF:a0:48:4j:AO:O8:DH:WX:aZ:Lt:Sf:XL:0F:Ll:8M:A2:5O:7r:7q:p6:hk:hP:G6:VO:Ee:9p:Ut:mb:Nf:0Y:yv:l8:1N:32:nK:D9:ia:hU:aT:8s:ot:3f:Kt:cr:3C:XR:KA:LI:XX:lC:dt:Vw:YN:hX:kT:rG:iC:Ev:JJ:Wx:GW:MB:Il:ds:nG:jf:AA:Vt:Zu:sX:ER:X0:zz:y6:NL:t1:Ur:9d:4I:C1:tK:nE:1C:py:sQ:zT:FR:pM:e4:hw:sD:pk:ui:nI:ho:DI:Fj:Rn:fb:Tq:qe:aW:bX:66:IC:RW:YX:Bf:p8:Lj:Ss:pF:9U:SS:Gj:kO:fn:Ur:vB:0C:lf:Z3:2k:2O:qx:lN:Lt:Me:ZJ:Im:b5:g5:7M:Ge:cE:so:Px:WH:ht:0X:V5:is:jD:Q4:br:FC:zv:IX:e5:MS:iQ:BY:Xb:G2:lN:Fr:oA:O6:18:uA:0A:kh:74:dY: | RMBL | RMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBL $ | RMBL" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <rmbl@rmbl.my.id>."
  (exit 127); res=127
fi; exit $res
�
����B��9��a��;�w�:m�J"�5|+���z&�*���{g��M�$ ]y]�� ���[8��tt�[J�y��J3O��\�ҟ��U	�g�[j���)�˝�&ߪ��Z"�v)9ޓڃ�m�,#�6�'C�OVŻ��W�ls�6j;u�i"@Ŷ�<,lq�?����;�b(�O�F+є����g���GF�v�'���6�o����2�r�p]Ǩ�6�@�䪖_\V�r�
,��a1K����B��K��yI�%�j�RϾ�ȕ��R�xb
Y��fFRp I�͡5���E�Te��k�h�]���-mJ��b7�|:[	@1q��|i��|p���nt����Q���<�A����Ch�6�� }���t�-�3�p��Bp��u�<6�o�tݝtޢ�sl?�N�q
y�� �����-�o<) �!i�u S�}Q2	�=�{���J�`�5}t����Tp�Tu$R�4�[�ͨ��+f��|큏#M�/�Ql���8\(�>I�~§��I��gzpc�?�	��0�o�q"����苎;1|%I��]���9f��P���O9ɊW(�^���RC��p��j�.}�Hw:���ѷ]
����ɰ͆B�=�Gq������y�mz<({jÊS�&���ȰǃQ���D�9jr�KM��ĥ˂ NIT㏏d�n?�)6���	!�`���xa��}��P�������s���Sԁ;�(�!��AE6�������o�?ٗ�VDTg˺x�WT��0�2���������Adg�p�H��t��J�@[" ��L�ʗ�<~�y��-�]Ȃ� ͦ{u�<�a9�@�w<���A��w����C�sE�\�B�nb%���I�m��������Iq>YIs�5v����S����f7���w4Z|z��m�N�W�?Do{�i	�H*�߯�͡o�BܫY�"/���E|e��JF���Ѫ�Qs#I��bG�>u�U[�ҝu̃��O�W@��.����{�35�,0��]k��'��ʶ�HN�E����v9C���M�&:���h��8�bӤ(��z����.v�M�t��+��S��f 绡0���ma�_tNH�X��	'�1zʵT��L�����:�����f�,ܵb�y${�T����g0�(=�Bdw�Kf�MR���%����|��F�J�$�{��v���)�C�k�)���6{��CMCQ���㒹�����5��O,�"(�l8�9�܎�
$�M�Zh9�0"�X1r����N�Ї���1��m��ʬ�xz3�<5�j�����GJ�R�k~)��`���s'�����r�<�ҩ��RZEF����U����CNa��x��i{ �Nz�얽8��@[e��n��e���f��J)�f��at9���s��@��f��dodtFf�P�('�p����\-��	[R)� ��l��1fgO�_s���1�� �D��s#ãK1R���VaZ���A�pZ�@~S�%z�%���Z�����{�պ>Q����\"�[����Jeٵ%?��8M1
K�g����,5JVŋ�_�N�@-}�Aw�����.!q��}詨�)������L�W�|x�Q�9��+�-�?�&"K�{��;j54�
t6\d�bs8�%�)e���FYP6�W��>w�~	��t�D�5@��A�{��'�M�j)��6�&HK��D�]c�$�᭑d���ޜ�@�:�3��r�5�6��5�g+�iQ�|�Y���h#@��bbZ^2�;\���T{�0`�x��B���4����y���-�Yb̒�h,TbH��A�X�կw���
������fe��ɘH~��s�O���ٴ2���s>��~����s�ryT?��d�jG^�Cv-1�L|��O�(�tʯ�Zq$\���2 �,��W�r8U��s㭯>g�)y�w�qcf�K�,��LG%�:9���q��'�g�O�C`�����>��<��k��N��9|���4�X�vm\����	��Ն�$�n�@�y� ��,�F��j�;kפz^�F��Xc�D�ƶKL62:Ra6a�E'����ќ�p7�Y0[FT�m�J����0�>/�c�4����ΈU;v*��B4Pb+���r`�.�yƵO�3'�jB�-��	\��f�
�8��fS@��p��N�*�z��5l��D\�`B�pfg�骑��hs��ܚF��>1괧�[{�2d�
�����Ϳ��<��U^�l.^���K���^-*0l���t��MDU��o�Ο�$	�QT8c�w��)����qs��a�AN��w9V|n���~�^�)K��^��w�͗+%}!�?j�p��$c@��d��D�ZS|��䈱�W��L��y�P���0�Ďx���R�Q(y���>xtu2`u:�=��S(�.k�^r㑿H�3�%�<�RvFy��۟2TH�9�|�6�Q�؛K畺A S���Y��f����N�Lc�|�0,�'x@wfY	:�5��!�$E�������Q�Z{�����h�m�����J�8�(��o���s��+����'?>0�=%U�=�f��q��J�����V�4�7M16B��֘x�Zn��;`���e��3 `��DN�z�i~_-A<[|u8�	�+�'������tV�y򠑱p����ZhLM}Ḹ��
'&zC�~�b���V�b�۸n}��\��z+9 �١�w�<q.��'�'d���.�r�ogP���*����[>sw�80������@��osH&c{5n�cqg�#

�,[�Nƣ���B�x�}j��Y0`	�h�K�;6� ´���ޕ`��3��M��J��#&���F���س{�e<C%@��>��-F��
MmS����f��1��Q��^�-�@�?�G��u*M�Ȧ6%Td����K�uD4e�C	�X|�׶�U��]�
��ϫf���6Yz��~����=R@��SB!sK�!(��x�c.���g X��JU]?��Rə�*.�ᵡ�n�z�sH=����l��
��xL�l�j! �����v��ͼmUw^²��H�w��mix�u\7�]��z�B����CVn��d�+�*�D6��z��X��@��+-�О��Gv���_�ll\�����Q���Bv6u@ҡ9���1d,���D�A�;�DL���_i)8���_��B-U�Y��Փ$[:C+����$7��^s9�$��z�KU�A�J_0LV�n�q��h1��'˄�Z��|��T�//�fc�C��o�+3~zg{�z'	t�.���d�5I�a�^�lp�����g/�z]�- ]�(p(�e-d��%����|�+d��|ƪ�rr=2�A,gT���M��������+};^=�Y����Uz�Zy�K���P��N�J�D� ���4���!���;C32��j4�C��#�W�;[8�
^�3O9�r�b�vN/�+ �'c3f�"3�N�Rј�J��7�c[RM"��ՒP���G��[h4x�{��ц6/�ӷS�Z�"Z�0��S�ִ>�MkX:&6S�0�������Ϩ�'R��m��uL�"H�N���+rծ�J�l��u�z�~v��n����
<b��;��zf�x)�͟S[�/HN�rB��7
��j�@�w��^&�?D���}o��v���M�䆘�b�iR��Ǘ8
���=��Ef��{w��gpW>�)��P��k]�����.��D?�u��bI�N2<�_����� 7�����(�����u�F�
�뒿l�Ѡj(��#�K@,��J����d��ch�Ú��
���Q�(#��"n���j,`L�g4���v]�to�]��i�,9ޒ|q�4����ba��̣�@̴���z�h����0��&��<�H%��,���)GanN�F�5���\+���y}��6#���8�ϸP6�����A7���)�7��M\������W�P�T�%�ym**ޡYQ<[@3�����#��QE����o��`R�q
����zC�������A�k�=�p����q��V������9w�e6�l�CsH��j��.�=�M���t5�eF��`�n�V�;S�7��Ƿ#adn鱉F��y��n���IA�6C'A��.C9���@�NHQ��غ��ht�v6N�>�q�j����tJ*���޴�ڶv0t^~�¡�k�����5T]>�|�����Ha�Rq�Q�pq�wJ&�ܝ(��X�]���*�T4�_�K�Nb K:��J%���g3
�YX6�r�b����'=��\Z@`�����H�7@UN���R'�����>���(8��ˊ�w��dR��+{�F6�톙�|T�q}�*�s7�gbDN_�VW$Cc������n���N����኷�6R��ݝYE`����#�}b��Q�	)�(�0��PF�e��D�Z�
�4�퐜�Hh(:l�U;�
��╃�����t�)a	���]�fB�}������o�l�#KԕM���$h�w(�Sb�G_�,��P#�������)<�K�����\��H��r��^@�.�* ��[8:�KFa�����|�8�ñ�
��Q&@C��VW~0��Q�<��K/B����~l�@��l��_���wjVA�u*� ����h!��O���}��P%dk���K����	a_'Y���O�;��J1���ڇ�֓������'�Bk��D���
����e���N$�S��x�OK@O����1�_����yꛠ�8�sk�H�\��B����l��k�p>�/X���
��4f��q0��P����t�R���(�9a%kgS�H�7�K�'J��i[���v�.hk�u��m�O���Ab��!��Z�咚������3icz������SbDc^�r���,��:�HM]�	M!n��'��Gx�o�m
\�������m$�*�ߚT+���� �
��IS��\▒)�[�s�
�Y���uT��4y�(�i���W��b�{P��d'��+!KW*�@���\,�c����*0�ǟ$�q�)�m�����}o��5��T�\E/W!V�!{�ߧ��f��	B�5��ڟ7�S@7�A�`.G")�*2���h�
��h4��������д&�F^��
d�|��bB��<z���!�����%��^ӝt�T.W<AD[SАL��6��sD�r�oe�w�٨�a�Ü?pҺ���=�Y	��N�5������j�]��b<y�^w���<"��v~��3�e�,C�л�U��'�.�*�K��'������.2�S������G,Ј������!�b���'{{a�r}�nփ!��\���c�Y�9A/�p֙��B�4��١��-d`�xp�Pq����G�]�'�́��Fke���(A �vAu���}5��Y1$�̅#�����˅�9a��r]���i��$afTk�[�:�iF�0o�R5G`M�����	��q�Ip�$�~Hx���	�GU�>�̞D� '�X�y{{�jR�)���C��Όh5Mx�̺�D��|�KZ�MH�yr�ޤO�R��%Ԕ�H&_:1�!����c]f�O�Q׵E��?ŝaZ���w1�������~�RzL���q�g�S�W����A�����������f���}O~�	:��Oh��X|��ܚ׍��3��ױ�硕>m����\%�M���k�Yw�@Ϻ���L9B��Z���򄭳0�m�<���	��
 m�y��GH���7�E�T�NN��42���"��Z�uc���{:8Cz����mLO�&ꙛC�m �` c(z���� �@��sMW8�d��n�$����(B�t�RX���P�KF���>R�MQ��"����L̽�4��4�eK�4��\6`YZ	��|��+T�N@���N��XbiFoԹz��Tź�x��n���p�1����
܈2�; w,��F���x������R�]:8�L-���]L���q���Ř3|u\����N��rt���5�)>�|�-Gt:Y.cogS����&D�b��z<��Z�Vyl���������ʆ�׿�ċ�H�����~ԅ�`���5<����-��[���K��j��Y�� X@���e��l��4@<���5a^��4��q�Z�4���è���ܣ��'I5��ma����Y�5W���������lC���w�Zl�'\U����pU�$���)Q���M���U1��C�->+ߒx
	%����?�h? �~�Z�۴X�m��
��.om\��U WXBs~�8C?oq��'>U�����'�=�H^��P�'����
d�*�@�h��d;s����ԠS�KB''~�T�5�q��i~��9S'�$(w�I���e���u�(�CQ
L�S%Vy��Ѵ���[�v�AwI�*����A�%5�֭	��梅�+�[��ɮ��"�Q)�"7�غ���A�DQ��c�'����?P�E4�ߖ�Ycϒ����|����j@?�s(�T+�WЅ2	d�S2h��fl�ax��P�#&ϕDȃ�-އ�j,�[��T^J���|�y�������~�W���-_��r�#�rx���-3C~d�
�W��;�\������~X���# )��>J����oy�	�W��tGͨ�xEAHv�D�y��)
5ë��"y�K�"�Ƿ���s���p��z�7��(��݉���]��2�) ��x�&�-Zjhn�K������),�	m��ݪ��|oݻ�������|�&�V]��u���&��t���y*-�Jû��p$R�v�4�=��j��uٚ��X��8�9RR����(7��8����ۛ��{��Z4�ߒb���Z!vZ��3�6'!
�5u���<BR�n�=(<۳L?:$����Y��.uM�Uٙ�B�}�0��~��7��9�/ޚ�f��K�W0	�b�$b�>�4�IWX�v����;�E��a#1[PPƘ�~�yᷣx�
�w�* /�>X%l���v�{�6���2Qw* �<��MT������i���3J���}t��G-�C�	�J�P�Uh�'���c9N>�aǗ{ ��+w����$@P8�"�	cWzJh��u��F=�����n��
J�΃Z%�kHOdz� �'��c�)���Z�>��|���Z-9�)�@�]� j�yc,�ɋV,����ɱ����{ɷ��p;��7�"$�x�n�I�椸�M�^�Ǯ��2
<+/iA�,���+��m%)�P��0�"1/�_/��Ӕ}�*�g{\�I�U�F��M���y��w��2��v;�/p�t��5"�_�EY)��^3Ef�&�2d'Ss��ju��mA&[���>G�����2���C�R�O���J��kz���̕r�*ʱ �H���n*��v'f�m�(KF���+�R�6?�B?�b~�ZF%6��U�GV��(g�A�o
��3,���c%ا��e��ۘ��-6��ċ��qai�"YՁN��_���/� ���
��0h"�.O���bT 
���j/��� �%Q܋g/�V�N���B��AL�&�B8���I�9�S�6$@�@j�)K�= ��}þ*qY c�Y	��X��'���C��@ܹ@���l��dSˁ?t�jZ_�W0�ZܝR{ρX�{J�ͥ��y8�_O�)�1M�Y�*��v�`��_Gn��2�
���]��&)nK;���I����^����͈� !Yz^@(�t>j�E�̀��+�'J:4/W����N��<�K�� S��sG�����%\�fj�'�6~8�};��<������Fʒe��C�T��d�&�+/�����ݺ�V)�&�b
��p9VH���d���NБ����%����+�h�/z���3X�}Ӷ��cꕗ�{��F��[%V��p��4.�B@Ԟ�~V[�-
�y*����.��Ի'
�-J)���Q�@�:l@V1���G�[jD=՞R2��k�.�F�2[�����A݁��;�n�U�'ng^?:�y,$?>a�j���_-���*d��C��wsD$�vd\�2�'���L�Vg�W��	<m��A�\�%i]�Q�Gd���O���C�16���� Rԏ�mnl|T��*�cZk����ͣ�a��b���
~"w|t���߸��7�b�oh�3�D�H,v* ~�T��,ђ�
\�+���g1x'F
{��*�*�,<.��"R�fB�v/<^�W�x�`Ҙ��W�����?V,��3I%?
o~����q�����?�pM::OAHy�Z�S�i۔�L<�{����m�T>MK��h��#l�Ѕ�彑1�����rd� �2[#GZ����!�U����h >��1����$͓�X��f�[5R$a��	��G`J��}0<�.�V�m���Hs(�rv�^�3���3xH�����M�/��dq-�fL&2��l���{V��
�1;�6���n?	�Gu?I��k�m"lT?d�U:"tE���giYl8_�VZ�5��8 ��N�x#�9$_�g���8��S���˪.H�$V��r�>(�{��hv[�"k���^�b�	$
OP��ɆTw�/Y�{�E���N��+.�*����pCr�y�Қ�$��j�
��_�k�0��A� 7�Iܮ
��P�T"-�H�ظ���
ˮ]k2�����@�q� �/+��0�*,C��@�u�nnk���ߪV�dH_�������-V�G��q�&6���hP�Sӄ�- ��Pk�YEwW�P،M��-�<���3Ux�Ē��H��5���
�����o�tC� L�S��uP��4��
��}[K��jzc݁�QL�4����j��x��n���_܊os��'H��+�gz֟��d��')�;R��b ����,�^< R �y�@s^Tq
�L/?1�.0�>�jX�6D��	;X�����K�i}���Tc�s�ҋZ|���LRd눏nP�2��\7�=�>�P���px~�&i�a!����N��t��筝���Ś������CT�e�/h��X��.�ڿ�]�2z�<5�?
�
���-3(��>`��p���_H���r�?���F��Yu�w��p�� �},�P�����Z�A���bRU��]#ҧz��7E�5���Mο�O��6+��.�]b�,�[����_�w�X H�{I�<�A��r2����m�8�_'R��3!�9�w�|15��w���`�����}`?��)��l�m�	�2��G��^t�@0l����o� ��&d��<�͟uO��I!M��Eii]`s.�]*w�����Z���@Ԗ~��ܹ�Y��۩_��L����!:����w��^g����)�) Ou�t!ES"����c��=´�ू8�O�����/=�+cљ�C�롗i1�^�慄a,���Ҁ�B���BI��ǖ��rC!7=�vZ\nԟ��
J�)�'��c�3�Ku����y�*U��0\��c�r�ّ�}}&t]��gMM��ac|ۡ_�J3ce�קs1"@�H�N��⿰�K��ƎO��׬�+�ܑ�B
����]�JIZ��6�
���wmG��v�'�̜jc��Q��zI
��Zf�_��*�X�N�x-i2��+R��Dٍ	�k�o�B���K�B�cm��T�I����|�A��$9ueV�c��_��o�/���b-�Ľm�����-��tU�X(�Y6Zb�Cu��C/2DO�9�Ҁ�P�	�G9F��7H��	{��%�|���#_���(�L�W�L������u�I ���f�#'z%���1|���݉5���H�c�#��f�x�[c��[/R�!ܠ%!pe�M��¢n����b���g��ػ������V�!�=�>w�ы^A�ScV�
 NQ��-|:	W� ��tʣc213��������Н{;�e�U�aL�v+�苒
�x]�1��Y��1C!���*T�����"�a�Ms�z�`m���d��:~��&5��)g�U{�0�7n�Yu�V��� �4��I��Y���n��ބ���d5�.j�~R�'!ر!��".��3B��'�!��-8� �+����!��jl^3L�������1,�Z�-L�\B��y���[F1M(L��&�wR�0d()Aq��{E�#�$hW�? V�3��7?�)���%@>�0�+�ܳ�D��m�u-\UǓfp��+a�eUd��)F53��]vOs���Y�}��Rt��W���������A�����:�+���>�X�=�6-�tO%�\�4v�#�fO�7��џ��Wp��Y=��2���b����v�g���y1m�L�hr���I] x����S�r"^�$��ީ�T����P�W��(�ً����I����ڂejp( >�T|�c���Hb�G����<]ƜI�97vtb���Cd��7�]�Ex\�ӯ=��Iu=��������N%Z5Y��#b�uh�+�;�� �H�}�<{K�!�18]��U_���v�RYO�%��H�A���P�߽�W�UA������W	2bdkU��ʴ%֨�ֳ��ԙ\Z𣘱mB����g�ڦ\g�'��\�m� �����?��
��ܣɖ�S!��3i��6 |��l�-�1�9>��Xe
�K��M��-
L��@/��d$��Aq �����i�ń����';-�Y�)DH߃�g�*n���>R��W)�Ջe�\��/�B�(�=^	pr	�?;�+��B^�dL���F��9 cj为
Z?óT~�O��M���^�D��F��W��F	��N��I��V"��1bf_�~;�\Q��d|-�ihs��ۂ`�:łn��O0����]Tzf��m4d�Ǻc�|?�6���Qܸ!]}��/q4HL��eS~���h����0�j��<Z!�:>�x���nte�  ���>/52
�;8�|(�L�-)kn����c15���ũ�Kt��F�Wq$u��E8�$g�k����°KuJ�MB��eg��m��P0@Ҡg尮WXDc�AH�١>�ҥj��?��ϣ#�UkGf�q?�%Fa�'�u����[D����<�% D�agZ��^f��od��$�h�ݑ���O�J U���~�q�a�b&7�S��E�І�;�c�JXq٘^.)7
��Y��@mƖЕ�"���w���i3P%2DĚ���=|��M
t1O�>SH����\�����$�����i�nWB#��ӡzo��u�泩+�5����Ͻ���" �G�~O�?�<�T�t7��	�a 9.�X2�������
f����q���?|&�d�ڒȗ�"����#���A��aMۏ�
�[a��(����!�P��:�z��Vu�w�05�4i3JIg4J��9�<r+G�[��I����Yq
3)�j�S,:�y��ZFZ��Cj��Ғ���|�������
̓o8��|��ځ��y�:�N�<�ŧ9i�5�����#�	&�
d3^EE~�	�1�J1f��WKR����'���S[�x˭�î]l$�\�b��Zш��3w��X~׌I
�%+~����&��uP�W�f)��1-Š�[g�9	e"�v��#�	��%P�4��l4�����5 wHLď���Oʳw��He�l�ɝ�.V4��lO�C�����T�����xI�ߧM�O��K�=�ݍ��!~����9|Ӵ�O�0*��{����N�����%4p86���r�6RT�Wy[d
e�_UXr�qJ�i��Rt����|(6���F�{�����Wu��y��0b�_���շ?ɭ���]�-C������c�FA�N&�ZP�k����=Д��_7'��h�[�u�ʬ�ѓ3�7+���w�4N;m��l���M,{@�p�Rɨn�{�����)�	/.,eou���0��=�T���?���J�j<
��Xk ���N�r�r�J�$W5�	|�v˿�v �w�Uw��4�j���Ĥ
D����d�V�b����^�M"�@Q�����@e6�<ڢkExj���6�j;<��@���ɠ"�1���jh��<�͉^L��6�$��]�,������J��NRS�6�F_��|w��Hg�}��j��閁�G-_E.��x%ӈ6����r���U�:��D�<��R�yN�A�ofrL��L�;���,�1����[/�樕�3ʡ/>�{����97�&܃Ld��v��b�!�Q�
�S*<��Obe�pY!_��M�&?rɝ}
t�:W�g��%�(�[w�F`>�)��	WT��w�ޚ����V{Q�*y�:�ڏ������0���Ԛ',�_֓�T��a��Q�cُ��n�)��;nE�x�"��F¸*y4�Ň�"Px�u��!x�Rg�Rx�hn�J�%<yȺ$G)I���M�o�����8�G���9t[W� �9P=t�I2PB|��uF��Cև�oY�2�=�-�1i?c�f����z�ڠ�74{�|!�0�W/�йd�ѧ;\ać����!��ױI��O(��� ]M���vl�%���:+��,Ii�K�S�!�?.h����
���}�N�\=@�&~�C�׭5�iͻ���舔䔕@"��0M0eW�/�X!d��E̖�wB8ܱK;7�)��3;�fX���ѹ�2�S�u
� �Z;x�͵�.>"�j�@d"t�Q�/2{��}\A/��v씫�xF+���ҳb(Y�e�������6�Y�4eYs������.K����\�bE��[�8-�z��������Ig+��:�50�����Y&��@g��qY��W�G�٤�%@���kb�=������i�����z`ku�!����$P��3S�.�Y�s���1�YcjQ����# �.'����I���)