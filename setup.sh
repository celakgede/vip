#!/bin/bash
#
# This file encrypted at Tue 16 Jul 2024 07:27:38 PM WIB by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "Anjay password nya mana 😂😂😂😂😂😂😂😂 Rasenggan (Ah lupa ga ada emot Rasenggan) pakai api aja dah 🔥🔥🔥 menyala abangkuh | fo:ok:sg:bI:eL:PP:X1:CZ:FO:BF:1X:7C:Ga:2C:YL:XT:Ch:he:NG:33:h8:98:K4:DX:B6:f8:Fu:XG:gL:ke:yZ:pW:FF:V6:s0:GD:0R:zQ:bM:Kj:V3:oN:7u:iW:Hy:41:10:13:42:vK:bT:4o:8D:ZZ:iD:Tg:2t:co:4P:IJ:6B:O7:Lx:FV:Px:pI:iW:V3:37:cu:e1:II:eh:jm:3i:fi:kv:ZR:iP:fm:qm:Oa:mC:Pw:uS:xR:X6:48:ew:br:N5:Yw:jJ:rj:Ez:jZ:5P:Vb:NT:c0:dx:Cv:G2:Xf:su:GA:qo:Xo:Ma:md:10:Rp:X3:ex:tu:NP:mG:KC:XM:be:BL:zS:Q2:yN:gH:5K:0i:mN:KY:nd:yq:72:Qh:a6:F2:xB:0p:pe:Iq:qK:kj:Is:u1:NP:no:cX:Xe:Lk:wz:aw:jA:OF:VX:ke:Fi:vH:JI:ig:Ne:Mp:0k:MM:6R:vi:Nj:cB:4H:XW:3E:tt:DR:fA:cB:ls:Ea:UB:h3:rW:VS:jU:nz:Vk:tv:yC:Y3:jn:4T:so:Qe:I1:zn:Lh:jX:3Y:r2:F4:Ms:cv:6q:BL:9j:7d:1q:zj:s2:Tr:CG:IH:HW:hs:9b:Nu:Le:C3:Wq:zg:Gf:XK:BT:2u:e2:Z0:Rc:bN:ic:ep:Ha:F8:8r:ZM:ct:jI:rB:cm:xt:AX:yJ:gB:Ul:sT:V0:dc:Vj:Dg:xT:iD:Ab:md:sC:UV:dW:0C:yU:JC:l5:o5:8L:XO:eU:sn:Bu:4G:1m:T5:nM:ph:n2:SJ:Un:Y5:18:Yh:Fh:0Y:IS:TN:Xc:GH:nE:cY:vf:JG:GO:09:1P:gA:XV:P5:7s:kU:r3:XP:wq:1q:wL:kc:S0:YV:fS:yl:SO:oK:EI:wY:5N:79:20:yn:rp:M0:hP:Wv:B0:nY:8L:Vz:bB:ik:Qh:FJ:Bq:Bt:g8:YM:9u:XP:S6:xt:0H:VC:J3:0O:Kh:El:oE:Qh:Ew:rA:jV:JI:9C:h3:F1:5g:BS:Kv:ML:NF:kd:m9:jN:zn:3Z:oq:k6:4D:gq:jo:b2:pF:OK:ma:oB:a0:ny:wW:Kt:eR:wn:2b:hR:tW:qL:OJ:zQ:pf:t6:xa:Ya:qa:bx:7I:fT:41:Z3:J7:07:11:fA:sU:Kw:0F:Q1:8F:oq:Cg:K2:5b:ZP:L8:Uv:OX:f0:zQ:NP:La:nj:Le:5e:aW:2p:xI:A8:Ql:OM:lG:dr:gr:pv:0q:oL:r1:Md:25:hG:qo:Tc:Gj:Pw:4E:Fn:4F:DJ:qG:T6:mO:bc:r8:I8:wC:3m:SO:s1:zK:Rr:hc:zY:vB:1Q:WP:Sc:qI:JQ:Y7:dR:Xv:Mt:d7:Cz:LE:4z:z1:eE:GO:yk:yZ:Lu:v1:hi:Oi:sL:pu:kb:x9:w6:WN:on:Ug:ep:g8:Rv:qg:Tu:rF:Fq:OI:bD:Lu:Ru:Oi:hM:Ey:XE:NM:wa:KL:7I:dW:xy:61:Yq:Q4:Ov:Cf:TH:Yu:J0:3J:nJ:oH:dM:Ud:b5:Oy:7C:Vr:99:IQ:Mr:H6:I1:9T:Ts:Dy:9u:3q:kw:tg:92:86:qE:YZ:Qh:Ex:j8:bZ:dg:nk:cl:gD:8j:S8:K7:YR:4q:xu:rp:WO:hP:gG:lc:3R:29:fA:6K:Zy:Hs:MB:RM:e6:CD:rR:jz:y3:7z:4i:Pv:Td:Yq:CZ:5N:TY:uA:5H:Zp:K0:t2:5C:5i:cR:AH:IZ:qC:CW:Zu:pu:Px:CP:1H:7o:VN:gq:QM:J8:UY:7p:xT:lU:np:Xb:DS:z8:vM:ga:B8:Nq:n0:OV:gJ:Au:2k:CL:Yz:bA:6R:M3:GH:Fs:0x:Vm:7D:MQ:jV:PC:on:39:p3:MP:fu:J8:Mk:80:4G:LK:Q5:rZ:PY:Mk:7l:1s:te:Wa:Ce:FW:by:76:cc:bY:wy:Db:qr:eO:3R:Cu:rb:27:9z:Aa:Vn:JM:JH:4t:4J:M6:MN:XH:s5:w0:hH:aA:oE:El:AD:kg:A3:n8:Yw:bK:Jz:qP:Ry:1L:in:Ym:SN:l5:wM:JK:lm:ez:gr:OW:Tx:YW:Di:Fp:rG:qI:Dj:5A:zD:Eb:uR:FS:Cg:Ar:ao:kD:Qb:5M:dF:cG:b3:0e:Lu:xg:18:1z:P9:t2:xC:4a:Mf:ow:QM:rM:VT:6Q:Qe:Qq:8f:kB:cN:3T:hw:49:gr:so:pd:74:pO:9Y:Nt:x9:g6:cM:eC:QE:0F:Kz:dJ:Zi:jd:7z:cb:WF:EC:lF:wk:FW:zL:yJ:ZI:w9:zx:QE:ep:22:fL:Ld:uT:dC:Hc:u1:ZS:Ux:lJ:dR:nX:RF:OI:HB:mU:aP:8H:2k:xX:kM:xj:2r:Kf:mH:7a:jV:hI:Yf:8j:Wm:qr:xd:o3:9G:T9:4A:Om:CZ:XD:Qx:yh:ha:lN:w7:ku:ue:dz:GD:E9:5q:Gt:Vq:t7:bL:8l:rQ:JQ:nm:Sk:KA:Zd:iw:2D:WI:LB:4e:Sb:WL:jU:Zd:Gv:Jc:VM:UZ:75:CL:kh:2A:vC:Xz:Lv:9o:Gm:M3:p1:76:k1:Lu:IC:s0:rz:ax:Wr:6u:G0:dZ:nv:ow:lI:D3:SU:bX:FZ:WH:6P:3n:e2:h7:qs:BW:Xt:t5:Zs:hc:jU:Ge:uG:n4:Qr:Mu:Cg:aJ:Gp:da:cL:XG:Ne:1G:7K:b4:19:Fn:O8:TB:oG:br:Cj:B4:Dv:ol:6M:L6:LK:oH:GD:vD:gZ:GJ:dN:Nw:nf:Kw:CC:kJ:Mp:KA:Rc:9R:Ng:kd:zq:8m:SS:Kc:x1:kd:yd:Ah:5A:e3:Qy:zI:2Q:ED:b8:GF:ex:7H:KF:BH:Xw:lE:7a:PH:pZ:JC:eU:Op:BY:FS:pk:cM:wO:xu:wM:ij:ob:ED:hZ:L3:Gx:e8:TX:vz:mj:AP:4L:Dq:QD:P4:zY:lq:q7:sp:K3:C7:0t:lE:LK:cJ:rI:yX:tO:fV:Rq:K6:E2:Zu:e3:t6:uQ:hh:Fw:CQ:YE:vY:KN:Jc:gj:my:ZQ:Z0:yW:Ek:SN:GT:Xv:tn:YG:z0:aV:bD:FR:D7:Oz:Hc:HC:Vn:DJ:U3:j6:SR:6M:h6:bU:C3:d2:zs:rr:fW:Jg:I3:Mt:Om:jm:3e:lX:xn:xW:YF:SD:o5:uc:wT:Ej:2U:WE:Ah:UP:uO:nB:Au:Gm:pq:BN:ty:Cq:ol:J8:Km:Er:Hp:aM:Tr:Mu:PR:Jr:XY:dp:F9:8u:Jx:Ye:97:yh:c7:R1:Wi:Tr:FN:ov:V2:ML:Nz:Ug:Vq:wQ:3c:nm:MY:z6:px:KX:uj:V0:sO:Fn:Ut:xN:0Y:L6:iO:qn:Ja:eY:od:qp:az:tq:oP:iV:zJ:GN:Lo:dF:Hw:kc:DM:tN:MJ:TY:Du:xY:eA:w2:hr:8L:gq:Ol:F4:b9:fA:pT:hw:FQ:jS:3z:JU:CS:vB:ez:aj:I9:fN:Of:to:CJ:4K:cT:y6:3Z:sI:Yk:fx:eY:zW:rt:F4:9C:FD:mR:bd:4M:ED:Pk:KW:jP:q7:f0:Dd:4A:w0:Y8:80:hz:v1:F3:gf:Vi:rk:XU:4Q:tU:mx:bv:oi:eL:wE:ZO:QX:a6:bz:33:no:76:vp:g8:kR:17:FK:4x:m1:MG:wK:mL:aH:KE:Rv:32:IB:Om:CD:BH:UI:u7:la:jM:2L:R6:El:kK:6D:q9:hc:BZ:1i:y3:2t:go:2z:dP:mc:DO:Ml:0J:9Z:Mv:HX:Bq:EX:qE:1r:29:w8:h7:Wy:ei:DW:p9:tf:qv:lD:7V:qe:S7:Xi:1N:zY:a0:UL:gK:Hq:Gk:1d:DV:vI:gz:m9:4P:yS:cR:nN:jb:ZZ:G5:Hs:fg:Ci:8P:lx:NZ:4P:KL:vu:Yv:bX:vh:Cj:ML:UE:Eh:CJ:X3:nX:k5:OJ:MK:ai:fL:Fp:An:lO:Ys:Wk:Dk:SS:fU:S4:qf:Il:8x:Zc:sL:d8:xy:um:hV:Ap:nI:7t:Hh:La:by:3b:ZE:Wy:J6:ft:1l:ek:m1:WV:fa:6b:k1:dC:5q:p6:mu:hs:a9:v7:F8:2r:e8:gf:Wt:oJ:rA:va:9O:So:Qa:T9:Tq:BZ:0o:4v:fi:EZ:w1:bJ:xa:7m:sA:Ut:DW:Bd:rT:lf:92:Dh:Ia:Xl:Qz:OG:d0:DB:E5:hS:0F:F0:N2:Lb:11:9X:ez:B0:Jl:Hj:Mn:Km:Sc:A6:Gv:yX:Yh:9w:N0:aB:gZ:6T:oC:kH:Ss:uh:Ue:QX:aP:DY:Jo:o5:gG:ml:8Z:IN:Fj:NM:tN:Tx:dt:KX:om:45:bJ:sz:rH:R9:bw:IA:pI:xN:uG:2F:XR:8E:ED:bv:DT:lI:HA:yE:AU:CO:U4:iw:Lr:qV:5h:59:lB:mL:yf:uj:P7:O2:0Y:BF:T5:oo:8T:6v:94:w0:eI:Gk:id:U3:qe:Vt:Pu:Dx:wf:8h:PN:kF:zY:n6:23:TE:SO:Wl:EC:i6:un:Lg:qs:2q:Sv:5y:uL:CG:tX:iX:Ml:0P:XC:kk:MS:ZW:PK:6X:Ow:ih:SW:d0:al:jh:1d:XE:jT:ga:P1:Et:ms:BL:Hr:zK:Uc:Ue:zu:q2:Xh:17:sl:N1:fJ:15:bq:pU:dM:sk:SI:j7:sq:sa:ni:FO:wH:zq:ut:KE:KG:p6:DF:a1:zp:UA:oS:Jh:vd:d8:RS:SF:sF:RX:jO:ZU:Iu:HN:1c:Xp:LG:07:PK:OX:Xs:6K:MU:4E:m9:mZ:ih:d3:vB:B9:YQ:Dv:vx:rs:v9:cF:U6:cU:8k:F2:fF:Ls:P3:4K:OB:0G:48:qy:HM:aA:p0:f8:ae:rG:zF:RX:bV:Up:VS:He:y2:WP:5x:Ka:xP:ib:WT:5z:sz:I1:DM:1F:am:2h:8I:cg:lM:yo:fo:WL:wV:8A:zr:8F:v6:0V:dJ:U0:iD:Y1:tN:3X:Jc:wL:ir:RO:x9:Tg:LE:pk:mv:6K:va:MI:jz:WO:Vt:Sm:PX:sf:ll:2D:tP:Ug:fz:EL:3Y:W7:QJ:UR:h1:Mp:kZ:z2:ri:Z5:k2:nj:xo:Ib:NX:DC:il:eT:sh:jM:dI:co:qZ:Rt:Q3:8L:T1:Ry:oV:UX:aY:KN:vL:gi:2L:qF:5O:0c:cC:UV:Iw:F2:id:dS:cq:4i:6D:CY:BU:Rk:2u:aj:xY:q9:fh:BN:Sp:Bq:D5:58:ft:nM:Ix:U8:2l:5H:rZ:dN:6c:76:wO:qH:b8:rS:IH:eY:LP:I1:tf:vM:yw:bi:ey:zH:kK:7T:sB:JL:sW:8n:4t:sT:kv:Xt:Cq:7z:Cr:4q:ku:5Z:FE:Oi:1S:7k:L1:NF:JD:Dq:mt:QZ:mH:HO:7B:dk:j0:Mx:Tu:36:Iq:Lx:OD:Eq:E2:3T:2U:hy:Th:6k:3w:Ga:hs:Om:ca:0E:HV:21:NA:8N:y3:Um:Xo:kH:on:Ew:pZ:X7:2y:A5:13:HS:iz:6I:BD:QI:T9:xT:ur:Xd:xe:CA:oT:Cm:Rd:HN:nx:IY:0a:4C:2I:8q:xE:nI:az:YG:tw:l5:gC:i5:32:2J:rO:V1:Q9:hO:um:dn:33:T1:MP:sy:Ov:k2:Fl:0Q:qy:vf:E2:fi:iN:1K:5X:Hi:XE:9J:M4:s7:4e:98:oH:xi:3X:fr:Ql:LE:Nv:gN:UW:NP:GK:6Y:xM:t1:Rq:c3:xN:nl:jZ:or:4s:ui:F9:vs:8D:z6:2L:KB:Vw:5p:TD:PH:dm:1T:my:j9:nz:W7:2N:md:1Z:GQ:uS:6f:MF:jz:zg:PJ:Kp:Ah:Oc:Wi:7u:R9:n7:qC:g3:CS:Ek:Zn:hb:y5:3E:qC:9K:9s:bI:qe:PG:fs:93:kj:GE:4h:NK:y5:eq:KF:aW:wh:nl:mW:0J:We:ND:Wh:X0:OO:Kq:iU:tp:jX:NV:KM:S3:GT:D0:Ka:bE:Yd:nq:AB:F1:2p:Mz:gw:4v:So:kf:b8:f7:kd:r8:ys:xa:aE:eU:4H:zq:96:ed:IF:d5:Lp:E6:mt:4X:Oz:B2:P2:HX:oA:ns:Jw:wI:V4:Wh:qQ:cG:mw:Jm:xl:rc:Em:to:Ns:Ya:8h:QZ:IE:kM:PU:ub:So:RQ:Pc:sP:ay:cW:6U:aE:9k:4V:CD:tw:kf:AQ:PV:v8:YK:td:fO:0e:Ej:QE:L8:uH:pQ:td:Qq:iL:45:Rw:4n:lW:1r:p6:mH:1N:Uq:lS:uV:Gb:8j:PM:BF:S1:eA:qn:Aa:n2:YS:Bj:3B:j7:4y:xL:7n:GM:oV:gK:b3:EO:Mv:KN:14:0D:mE:ou:Tr:na:Gb:GT:jl:Nx:Fy:Yy:NC:mJ:8d:Nc:Ax:UD:5E:VX:tZ:11:tI:GA:Kj:rr:j4:tr:xK:Q0:sm:hw:4F:M1:5C:jS:tU:wV:Sg:ZQ:hy:XI:sf:4F:tE:M0:Z9:d6:sv:3I:Ek:87:cB:2B:TF:jp:qp:Gh:0r:vr:2w:8V:jr:br:Wh:Gp:iQ:Ps:W2:jy:z8:g0:KN:ov:ED:gJ:SE:4J:bZ:nN:eq:Gk:P0:Rl:5d:uX:By:Xg:wD:2h:gY:fE:ad:lN:eA:cU:He:8d:wG:lX:Bk:i8:2h:Ic:DG:6j:m5:LY:ai:y1:lq:Lm:z6:Cw:si:gb:La:cB:u3:QI:xW:pN:cQ:8x:Ua:Qp:KJ:TL:z5:Ck:Om:iA:Xa:pN:5p:vC:VD:x7:DG:0b:YZ:Ex:Sp:fB:TO:A5:sF:3u:mf:6O:2v:hR:kn:zF:ww:oR:Ft:Jw:4j:ht:qU:BC:Xl:EA:R8:4G:9A:ss:5r:DC:wc:zO:VW:Mn:AX:UP:2x:UY:s8:lp:kX:yH:yE:sA:yk:fk:WO:Jo:fu:hH:Ev:gR:pC:L0:ST:a5:l1:MO:M9:qB:uW:1Q:Pz:yB:wF:1B:cu:ak:EV:sI:jn:8j:Eh:F8:wD:OW:Iq:OF:O7:FB:5t:qz:Ce:HM:nA:bF:Q9:s3:VR:QQ:S5:py:rY:UU:Gb:z9:32:VD:SO:lW:PI:Yg:6R:tB:Pz:l2:T1:oB:GI:RK:C2:gw:MP:rC:PY:By:oM:mw:a1:Y1:ZV:BQ:Fi:Sj:Od:v4:QM:xf:wr:D0:qM:sv:TY:lc:bF:q8:Rh:ed:Wk:h4:Y9:AQ:Ze:iY:h6:Z9:xW:JD:Cd:5v:Aj:Jb:QO:gm:9E:cW:QU:7H:JC:aI:nh:mU:EC:Mt:md:H0:vo:oH:oe:S8:AP:iC:xi:rC:Y9:47:kO:lX:EL:hA:Gu:Bp:m4:UJ:xk:yT:iB:MQ:NU:Ke:9H:ms:rl:33:cL:QZ:Hv:aa:ko:95:zN:nb:sc:5d:zJ:oE:hx:Ps:2h:XV:UK:wS:jB:VZ:El:ry:mH:uT:e8:cu:0r:OE:3a:rU:EU:fj:IS:h7:nr:gh:Zo:01:XM:WQ:us:Gr:SC:C6:ZM:1h:eC:LT:m8:B0:kM:St:KC:7H:G2:P2:Uw:u4:RZ:Be:r6:rQ:NY:O0:8G:0s:3k:vY:5v:rw:lQ:E8:Kg:sa:fE:wB:p2:fW:NZ:Xh:82:ld:OU:gM:Df:YQ:NF:Do:fG:Kc:8T:lC:pO:Mt:BT:iZ:H1:yX:O8:7B:rO:lS:ji:bP:Yf:6g:dM:uh:jK:gn:SW:s5:W8:NK:bf:GR:xA:Ez:Hs:Fe:Fp:Zu:Sj:BN:dt:JH:rW:Ql:K7:Ge:qY:mZ:8d:nW:DQ:wu:WW:UQ:Bd:fK:UJ:UA:VO:vm:vd:4j:tx:N1:7Q:hz:Ea:sJ:C6:nF:Dy:R6:Ge:Nq:HK:ZM:Pa:xC:mz:4o:we:2j:DK:f4:7C:KF:rH:BL:O1:4M:wx:00:AN:DF:n8:lq:vh:GY:tP:R7:GX:On:WU:MK:nm:Tz:pp:ln:1r:Up:K7:S6:5B:Qq:wl:qV:79:kr:dk:5L:ax:MR:CK:QW:Wz:Uv:IT:Yh:HW:DH:oQ:RU:c2:yu:o3:f3:te:KV:fu:4n:J6:In:7W:Ew:gJ:Qf:9E:BF:sY:IT:0A:EQ:LJ:ek:J7:0o:Fp:Dg:iH:ro:gD:VZ:NI:ZG:BE:ym:A5:Rp:y6:U6:sB:JP:YJ:kS:H2:ST:dT:zs:0R:6x:QA:fh:4H:YS:Je:zE:5e:r5:Wa:bF:93:Rm:An:MM:p4:I2:Wk:jn:Ot:Ly:ku:A4:cF:GC:mq:5M:MV:8N:BQ:du:SN:kS:Df:Qf:qR:Gl:5u:bM:eF:hS:Me:uY:TT:M4:Ew:DS:qK:67:8Q:b5:MI:u1:Hn:ge:Yk:oG:7b:Ee:ms:Se:QI:7c:dA:SP:uJ:9w:Ph:Sy:9A:ti:JT:Mn:KY:X9:B1:mT:3P:h5:ma:Qu:ua:TP:4d:oi:5H:sB:SI:NF:l1:qE:Wf:LS:Vs:kN:sP:ek:Mw:tS:BE:dk:cP:uo:rd:bR:d3:gF:jN:31:HM:73:HA:zG:wR:r0:Ux:5o:BP:gv:4o:xE:2a:P7:ET:SR:GR:tA:Ku:Zk:e1:Sk:Ol:Nx:a0:uF:zo:Cb:Bl:r7:Le:xW:vY:Rk:34:dY:ei:91:oE:Jx:G9:cy:w0:sl:DC:yz:Re:Gk:Wz:og:eS:Z2:zm:fF:9a:7H:dT:OD:lr:gr:FA:Ko:Rz:k6:84:Iw:Jl:Nm:DZ:ec:qS:VM:b1:ic:Pb:9H:kw:We:1l:so:qT:H1:wC:1Q:3H:Gx:Od:fZ:Al:RP:3D:HE:2H:1a:Hy:cK:k0:8u:EO:ti:GQ:lq:St:X4:Xa:PF:5o:uO:JN:4M:KF:FP:Io:t7:OS:uQ:gI:fU:Dg:V9:c7:AS:yp:pi:mJ:YR:Ux:J0:Tp:t2:hf:k5:eP:BF:dZ:nG:MO:El:dn:vy:yo:7N:or:eJ:js:eS:lP:e4:lL:ho:2V:TV:LB:zz:D6:np:y4:nJ:Mp:qj:dI:Nw:IZ:du:LQ:Ay:sI:RY:Iv:u1:4T:lO:8m:FD:h4:xj:rr:Kw:r3:5H:JI:lv:3R:eY:uO:ig:I9:h5:Sk:g0:7B:N3:eh:Pd:UM:0p:XE:q7:NZ:cn:u6:vs:YS:sC:Fh:RB:Od:tR:Eh:7e:xa:ga:uK:t2:Ns:fS:BL:sw:97:Fo:fZ:xK:p0:CX:3u:TQ:J1:cG:dv:Qz:nq:aU:sL:kT:fL:7w:u7:0V:IU:GB:y6:ZA:Gd:dw:dD:BZ:mc:cQ:i3:LW:6p:tx:ua:Ba:Ns:WU:6F:6w:c4:sf:uO:dl:3A:H2:vF:JM:lF:4M:XF:NJ:Au:EB:ey:i1:xv:6N:Jk:Xz:VU:Wz:LU:Ob:YS:Wh:JU:BT:pb:jk:LI:yo:VT:e0:5C:HT:jf:KT:B9:sk:vr:bm:i3:KE:2B:vw:TE:Qg:TP:Ug:RZ:Q8:nv:yF:dp:XH:pN:ba:Hp:23:Zu:V9:WD:8x:VH:Ow:oi:7R:0I:52:xu:LA:bA:UI:fr:6i:nc:YN:QG:Es:rL:Ef:mG:ij:E3:xW:m9:ec:dy:5e:ww:ss:8c:Ji:Xm:Tp:sk:s9:TD:HV:oB:h0:yP:Jm:Ag:Xj:Ch:rU:9G:aF:vT:nI:LC:Nv:mY:dR:PO:M2:LF:Jy:x7:FK:Wt:ft:xS:W6:ft:mI:dn:fp:1w:yF:4u:Pz:QG:jj:nb:cC:NI:c4:z6:yC:m7:Ob:Co:rU:ww:60:fE:Jg:go:NV:EG:oq:KS:bi:eM:Rn:tE:lA:Ja:d6:5g:E7:9T:VG:Eb:d1:3A:jS:9T:6R:fw:Yb:ne:Ps:mo:Gl:HU:sM:KY:Nu:PR:rA:jt:ws:Pp:k6:Od:SL:mw:Yj:1f:Fe:1z:NN:eE:8H:iC:Oo:Cr:zb:An:VO:pW:B7:2u:Aa:DI:rK:2X:2G:GY:cS:Qj:wl:Me:Bk:68:fv:Nj:W6:0H:PU:eJ:vX:qY:mZ:6A:6s:5T:7X:TO:cF:Lk:EE:kk:uR:rt:f9:7E:wt:lp:Z1:hy:oa:sd:0F:mu:dm:1g:86:Cu:Ty:P4:A2:c8:wg:Pd:ia:oA:aQ:Oj:WO:jG:tR:r0:ZJ:CQ:IJ:xU:6y:j2:We:mi:Ve:ci:Fp:Em:m0:n8:LI:bu:ig:Gb:UY:Ay:bn:AJ:Yr:Tl:8k:U9:dB:Kn:th:s1:BK:GN:mg:6v:QB:zm:U0:BU:rc:kH:tq:mT:pL:8f:pM:GI:KA:l4:dm:N5:wK:Su:WZ:dn:r0:Ui:KQ:U7:UB:XO:LK:nI:q6:1w:Dr:a3:Kw:U0:sB:9i:jo:UK:cE:Rt:v6:AX:yt:3I:E9:Mo:E9:rB:pJ:Av:Cm:bP:SD:F9:zE:KQ:dR:Zd:hv:4s:mO:QK:if:nr:MY:f4:fJ:o0:II:MS:HA:53:tx:je:tz:lX:no:p5:PS:Vb:p1:Ad:N2:i7:Kq:YN:St:vO:1n:Rz:bi:5c:6z:RZ:iK:Ym:A2:pz:IW:7A:WP:dK:0L:AZ:Eg:la:XR:Yh:2P:7u:9F:HB:0B:bR:4L:qM:V8:Yb:bX:f3:V8:8h:5Z:YR:Lm:ut:z4:dr:xj:tV:vI:dt:Ir:HQ:hx:rT:Pk:gy:xH:yH:bC:eH:Ie:fd:lA:hZ:G1:4E:8I:ru:5p:Sb:vJ:xi:ar:Zd:BW:mR:NN:AT:A9:fj:CA:Qi:jf:HM:pa:iX:qB:RE:hf:jY:Ta:Ss:YP:8z:qr:8Z:AR:ld:HX:uy:21:AS:ye:LH:Ca:8O:7k:4K:PL:ce:Wa:1w:8X:ey:VL:6f:iD:uN:NK:4p:lY:mg:1J:Cf:xD:WA:TR:vY:Ox:Vy:xA:Hl:85:7M:uM:tT:WA:3C:yL:ib:3Y:7U:Sz:wL:e5:cy:qS:v9:9X:Ej:sW:kk:fw:Bc:r5:t4:bl:wV:f0:P4:xm:Ge:AE:fa:jw:CK:qX:LQ:13:5F:SO:uW:6e:qN:1y:hB:BD:ic:7a:0u:mr:Ho:q5:nt:Pv:u8:vq:88:O1:0f:iU:lJ:TW:ix:tl:mq:zq:OD:D4:P0:gG:8A:yf:8o:cg:JU:Yr:XP:MW:Zd:zV:U8:JQ:jZ:K3:h6:2w:sS:04:oL:ry:12:Cn:nD:Lz:tl:IQ:iL:vE:jm:Z6:El:7p:Mi:OX:uD:m2:Bp:4T:uR:k1:67:5k:4B:9m:Pr:3q:eF:jm:TD:6j:wF:72:m9:lC:ui:7w:Xx:5m:SS:6H:zU:cR:P0:RM:0f:G3:EF:iB:bf:w5:qu:U9:vU:lS:lW:OJ:XT:py:SK:4g:te:87:rh:Hv:VL:NB:ed:V0:4M:WO:Fn:AS:x6:AO:xX:JL:Rm:ex:aO:Xx:Uz:JN:AN:v7:Vi:Le:HG:xh:My:HX:jP:St:fJ:SP:pE:RL:vA:22:Li:Ng:cR:3A:50:GI:iA:kj:tq:nu:HW:Ap:Rf:3B:cC:Sh:i5:9e:No:BT:YM:Zj:lx:nT:aR:Wl:wg:ho:dc:3w:CL:kK:F7:Ja:Jx:lR:l0:hP:hA:hz:o6:yi:q7:sq:SI:py:AR:ll:GF:Mu:vh:Pj:H1:ub:eg:0I:35:O3:tb:27:NB:SK:Cw:N3:wS:pQ:Tl:jo:mb:3C:p3:ki:7W:jL:6d:GY:cp:qM:cB:bX:G0:cH:PO:8X:a9:Zx:4Q:9Z:iO:FS:UI:PD:NW:3F:15:ci:T4:kF:Zn:fQ:Cs:Ff:6g:mI:qb:Uf:sm:ml:sY:WC:6d:Qt:kd:MO:yA:3r:Q3:Ug:K7:Yr:S2:Br:W5:UP:x7:68:dA:Uj:3n:gy:be:JT:Q2:T7:lz:5C:lw:qc:IM:IR:b0:ez:En:lB:dV:TH:SG:7O:an:od:YN:Ae:qV:mK:RM:I8:b2:5D:Lx:GT:1D:pW:LN:AZ:Zn:V6:vk:Og:w7:Ob:RJ:sS:ja:Ic:RA:ah:EN:tD:h0:cl:5L:lM:sK:GK:in:JL:KP:sq:or:xA:OL:kH:5R:lJ:tz:n2:nQ:NQ:2g:YK:qV:5Z:8S:ua:P1:Ch:np:Mi:jk:Ya:ZA:df:xB:B9:lm:3l:Ru:yn:gH:vF:Yw:XF:py:zo:H3:wx:Af:IN:Sr:ZL:iZ:La:27:EF:8r:hP:kd:e8:1v:Mr:aq:1p:Ba:fh:CK:jt:PW:aC:9o:ax:Mz:5I:zs:tL:JU:Pp:9E:w9:eG:sF:7d:6t:sa:Ey:Zw:0T:dr:RK:FB:uJ:lA:j2:LZ:jA:sj:3D:8N:Bp:IS:Y0:QX:al:fx:D9:ol:Tm:uU:SK:vE:H9:NT:UP:8k:XC:aq:UZ:OH:tU:nj:NM:Io:p6:Ao:G3:cF:SK:vJ:UV:ho:ih:mD:qZ:Ry:EF:gy:4T:C8:v3:Mp:9p:ev:Mx:10:sy:Nf:ny:Ui:FJ:MV:Bd:AE:DQ:gE:UY:MB:3K:s2:mF:Hw:Fq:G2:dp:Oe:cK:pE:YB:cL:SD:yD:7R:iY:Py:bf:tw:LK:cj:Rn:gv:3C:gb:1X:0l:fS:x1:ez:V4:VR:zc:pv:dv:qx:rX:ck:bh:35:sX:xh:eO:O5:EE:Fa:uf:0u:1q:3o:Un:VU:6e:Ac:uA:8C:jm:ED:Ua:08:xk:vQ:Xz:ip:bH:BS:Ud:vG:GS:Pv:nz:1y:0a:ev:8n:Kz:ab:3h:aY:se:EX:43:xB:rF:WQ:NZ:8D:5K:iu:Lc:11:PT:JM:yY:6p:pg:eG:dG:x8:FL:Ak:SI:ic:il:p0:0v:t7:pV:h3:4B:MF:4o:tU:es:40:bz:jF:Ed:Qy:ZV:Ds:lv:Jx:z5:xD:OP:Xp:86:c9:82:UJ:pw:zp:JK:3y:IV:Rl:RS:Dt:Lp:BV:Pf:8r:Er:s8:Li:Vb:9R:I8:z7:KE:GV:AQ:D5:J3:XV:Fv:zk:jl:j4:A9:7l:QK:1q:iA:xa:zv:UI:Gl:jW:U4:zS:Va:7r:si:IB:sD:58:zR:7W:L4:oK:lz:Kg:2o:Zs:fD:c3:8d:OF:Rt:Mo:03:h1:5l:Ae:uk:CV:pj:rQ:p3:x2:FS:3P:X9:H9:zg:12:wF:Nj:ML:2G:YE:gN:7d:gl:2z:zk:nM:4x:Ai:kx:Zu:iI:zE:1D:Fc:Eh:pY:wh:wf:cc:Yi:0J:dt:7g:PB:Ms:fH:fM:xF:dg:UW:19:hA:sr:ZU:pI:be:5D:Bp:zN:Ei:wH:Lg:7A:YC:ff:Gj:Ry:cx:z6:sV:vH:Yg:oM:5k:pN:vZ:QN:3l:jS:gm:b1:uq:7p:og:Ix:1W:IS:TQ:U3:9R:xB:HN:Mr:GX:8h:KR:kl:Q2:m7:QP:7O:Cf:xN:jY:cp:T1:WI:oG:hv:SV:NT:3p:JI:Cw:kU:wx:Yn:LS:3m:Ra:Po:6e:xZ:uF:W6:XU:oz:bL:cR:gX:rY:TU:yx:YC:QG:Zl:S9:dc:GN:EE:RU:bc:DY:dj:H9:jv:MY:xa:Py:6Y:G1:ES:ri:eg:LL:F2:xy:fH:yw:IA:80:KU:zI:n7:oj:KS:Al:ow:k9:hF:9j:mx:XO:WO:by:5K:7Z:10:2q:NS:V6:Vh:9K:qr:d3:Yg:kp:tL:bL:I9:c1:bI:2F:Ch:BV:cs:7K:Zt:81:Bt:QN:Gn:Pp:8R:KS:Jh:Jm | RMBL | RMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBL $ | RMBL" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <rmbl@rmbl.my.id>."
  (exit 127); res=127
fi; exit $res
�
$����SZ3�X;�:����DJ6V�u��]���WX�����t���t�g�R@�d͞t�FH���Ǧ�7)4�;��\��("� @�f�=N�U`�]��R$#<,ޠ�0����C����6W���ŀ�o����Kh��;�ˠ���Yf� K{��FK]Nbҙ����ɽ���w�
b^��#\�����`T"���lǕ!�>#����BT2��5�iVm�X���Fa�D�ܜo*��K���9�j��P?J؅-��g�!��Ղ�ӥ×��'�]�@��ށr�)���Y��*���{6�!.^F�r|�"�u��t�wp� ���]B�A�*�@'"i� o-�G�k�O��3��/1�Zij@�I�n39_�.�j�TK��YH����g������f�?#�j��~��K�4o���h��7H{�I��-���+��%K���0��fk&$ FS��"�w�����m,��z��<{����~�-e�3>~��6t���@RH�#ψ���Y8Gi�WR���,�A���^ۧ�~���xф�gO�T�'M��v��&S A	"4�-���	sK��#CB�(��
�K ��/�4���o�
G/���Y�%=�Z�P�`��l��
��9:y��y�S��*�[�~�K�-Q�ņ�9h-r����;�;�	T��u�`��>3�|G�T����n �#�%4¦�VlԬ�ڍm�ͨ(�S�^j։�-�;�f�d�>4�6���Z�Uȗ;�otx���7֋�Y�nyǠ
�h�M�l3W�:z�n�w2zh���%�Ў���,��[�N�t�t�'9Ys� �����%M6�~K�����ak��ܴS�S$�3�E9������7��BHc���ۂ�Ӈ���t����i���#�+H&.�=�R܋�`?�%7Mf�gQ�9e�[@?E�" �;��d�y��g���^��A��?����Y�V��I����]�J�R8�%6��k�*���=�H5`�QT�<i
?�{��Y�k�Z���qF7����`b���VK�u���P�H���m�ߙr����p9����4���I�
�<��n�$�)��Ϡ�p�hl�K�:�.9#��j�ӖS�ĉo�;y�r.�ɬ�D��r��m��D)c�O��`��uB靺�i�#��l����l�����6uB=*�Ux�t*�u���1F㐎����ς��+6�~�+q���-�G�9�'�8ju1����v_5�xI)Xm}�L.;���
��M7�XQ3z<�SL���c9�oO(O�LA�h%���8b���TI��M�JQ����z��b�/���@���]�V�IS��!����"�oaS�o�"<�\\(�yR�}���ɫ��r���k�����0&�R��6d0S�Bz���v'{���'�^l�}侲�j���&��}Xb�B�+�O���:�T̽�nw�QC�[�a��	�&�[����E;�+�G�*���8t?��lM���Z�o"���}��]��8�Sq���X���3̌��r�Qn�Y��|��̩��Eb-�.�,�]1�"�z(<!^���5 ׭'��t	N�ZE�K:������u������bT�9hɬ/����Bw��J��&����W�M^g�*�V�F�ZW5	2W*2�(׿�?��5�ƔRZɮ�o=UL �ڊ�#aT<�D�����	]��>��Ȝg�����P���q�K:��3M_���'�b%=����@�9NR�����zRPN�:[��
+i�D
̐qE��B9g�i�T�����:�z�@�]Ȏ�4����}��6ѓ�]�����E�-,_�_�
�!ȡ�D�9�9 i�q�gR�Y{)��
S����!���Ή"�P`�~4���d��tH��
Q��Zv ���K�v^���^�5u�>�	��O`�,����7kpZo>z��q�Z�M4j6o�{��y��6��?����NI�(���F�I��s܏�8�H�(��k�<�u&LO�s�VQ�E��K���b�g���а6G��F?hx]V�����̉�*�W!��
L��"�����x����bm����Uե�o_�ރ���f�@�7M����I�R�<�@*(�m�K8��;ӕ0�c���_��G�ʔ'#A�A-��0���`�[�*�E�80��hμKq�D�N����m�g}d�����耽{h��Cl(w�Ah'����&6GWT��S=־B-�"|k06I?��_~�÷��	�'jBYg0tD
5�kB%s��I�O[�]��Z	�-�.��)-{�yL'���
 �1�xYh��W���s��P�C���w?��ޝa��
��<elv��.W�Ju^ո$|��{HBv������_��3�n��5����w;N�w�:-[����A$�2=���pl�:�y^v�:�J=��r���!Q��gQ���N
���껌���e_��kv���xȃ��N�Z��)z|+P�1�D��E�Z��'���kr��e.�H�Ȼ��u��[���d��fl�
T���<�rax�$�E�����ROrU���+�2sж{�e �8�s0����"���N�~	/��o4�2�dR��yʂs��@9����z\��m_�p��f� c^�̈vơu5�=.i*��#ϡ��;*ީ;f_���t�yO��R@�!���pc�#�9�6�{:�����\U��O)B��*��\pZ4��SL���_4�_�/L�3)T���x�KBJ}�ZGE���ݟ�����y�J��z�a�2O}�V)�r+n�n�^��f�L"�Z7׬�"DEq6xg
��wZ�!�/�����ܧ�M�3>E�Lr/e7�_M��5c�)��GǺ�&�V�dȊE�����Hw{�=L��7���ץ��#�K�"c��r���e�&�|V�M
��:F
9Q4�����5jKw�����w�2_8�B�U��)��qɏ\jm��uTͰu'�9_�LTHBbT��/��pi��
���ܟ����ݡ��C�{)wR�d
dE9���힎c�9��������g�I������ee�=19}S�Յ�p�3�T��1�$U.�����Y���5��D�ah�C��`��*�qD�bQo���	�b=[u�Y;l��U��ua����+#$1����Hg�fW��*_�h��3�` �u�ny�]p�ݷY��;=��
���u����0�$��	��}�A+xD�d�?F�CP���.7͒�.�T-c"�i ��+��C��
L�4�'(	�zr�j�>z��I��SIA�6u���{"���;��i&P%�Hn��ҪybM��ք�����{��w�.:�|3Ϸ��B�������T��b�� ��N>���䷃�O@�f��c
i��M꫒�7�Ƶϗ��InD�A(�X����~3�Ojme |_`�_:�:5Չ�SB�Qv���W &�g������=����8����M���{=����g�Z(�;��c�Tp?,7\��!M5ݹ24H�,�o� �?��.a���U.Y��9{׹�%�+�U���Â�W}Ys1��.��'�YJR~�7��Z-{�	W����څN���\؅G��
�?G=jTKQ沨�&����.Y�#m��g��ބ��[��W���!������ F���N������}Q�&�n��\e��M�
8(��n"���~)4���b�C����e&�={<����R�r�ƶC�a,�&h�T1���X"}2�9h��A(�}�6:��)F:.�I���د��<��"ʯ+ͯm6�U-i�B0y8mpz$�8�`�p��tj��f��2z�e��X�}}�.A��ϗ�1�K���
�W	,�M�(��X��D�v/
��>f������#�-:�C&Z65�t�] |�w&t�i;�"�ڿ�#���bf���������
��a�t%�O &Q90/��k�{m����b&Iq���*��ܔ^J[t3���	�K�ۣ��:���P��#�R*�7�(D%��	����Z�������,�L+�C�4���:^��+��y����ޠG�
���*`�Ҧ͛X1��M.�ef��(�# �ςI�c���_T	x�FWn���Z�p�9{<�_?0�UT*����Q�r4?FF��#����f
v�A�v.B�J���#��:όrƵ_�d�2G
:�+��v轭�9���'��JX2(ּ��|pO�=�.qFw=��߯�]Fs�.Y��5��z�T��r7:B�Fu��LX:t�8	���<B(������)V�Mɽ��q�m,/{����j!�x��5�@�G�mD_�}0�X�hh`�iJ ����]���Bۀ�9��Pn	�ߢ���f��1*����_u����c�]���h�,,EmTVRt=3QM��=7�0qY������"��N�mx��@���U<���dh�,v�q7�>�S$R�3�Jˊۄ���c?��姦1}<�Ȝ��,�oĜ0T��p�+e-g�-��Ia|��Ҷ�}����KT�hW�3y�8g��gs�y3 ��T���h�*�QY���%s��<D�t����V��� R{��w*d:���ޢC-INb�6���8����#��.IN�f�nT~I�&��E��
O�^-{����AXF�N`��Y���)�f��[? �)�t���Fָ�-ܖ�Ag��l�"\pһ���x�s���L�,T��@em�8 ���6uh�a��<*$sɛ"d��,��!H�k
dύ�q{\�}#g�gd)�;{r黹k]c�1k�sX� f&���R$P������W�!�$�A��@��'-!����`I\T��~���>_=��	�2����e��+[+ܳ*p�[:b�M�Ƥ������R=���&/��|9F�&R���)-�K��|.��� ��뒿S8A��,�5o]}��V$�r��|������8B�s�.S!��l2*�|���Y��4��͏@���=��ʣg��e��H�'��<�|�i�m�R#���M��W�鬹%VLԻ�9׏�Mm�����w�KD2@�B�D�i��a��<x��X֬�e!a��jF��a�t�k��/5�3_Ęe���?I����<"ހYآGj���-��d��"dӬ�c��j-]�>�ã�uD8�Q3���bx��9�lb�.�rq0�$r	AC��*��cP��V
����C�B�6_�o�@C L�X�f4V�Ȍ-�5�<�p�9�?cK�!*Uƀto��C���9Ԩ&Ky���T�Z��Y{V��z>���{�3�0�:)�p�e�����=�j�S����.1���]���FiG��̓p 0�}��B��~t.�{ؤ��VT�ÚCIK��\�:?�2<>nw9�`xR�c%�J�Ħ�L�����c�74	8ף��[���
�եK�f��Y���SIn4��lK��ZPy�j��g��ǜ��b�G�-
�2�����E���p�޶��s��Y�A+F+�}#r�������KF�K4��=�֕�
��� N+���B,���`���{
��N�W���WX�"��Y>5Y�ʻ\MbB�t?�y���8�v �>m�
Q��d6Or�vN���9Z�r�n�%���Fy@�$�3�j�Y��گ�y�b�̤�R��H�q�= �
��?/�ŗ̢��Vz�j�pJPs��Q!oDᠵ!8���
�
��|Y��/�!��"��\[���L�ͲOZ'4��-�NzVL��A�6tD��m�d��N�m�d{�F��(QH��d
0��.�elQmG��l=��`�y:�g��1Ќ�^;]�0�?�����mV1́zb�Z��IF�В��)�ӎe>���g��� �Wg�Qi�c����r���W�h5�8�q`]��~�
����;�y�k$ ߥ|�m	\���	ne�� o��n&����	d�g�����s;���?#�M[L��]j�,K^@~�h�m���_�`���q����!�K��w�ވ�jΠ��a��Jr�v��F��������/��g������1p��ąհ���@l�<.oǌ��1)v^	�V!I
���a�U�3�ߡ�.V�eJԼ��dN��
�j�.������4z��^n5�y4���7�'
C����.��
��a�,�"r�ز�	�����	�h�R�|sS|��\�A�� j�i%���7���!izB��Dm+M�n�V�*.�|	Q��3��U�"�ӈ�h`O�߆X��
�7K;H%��N>lAH%��g��Q��x��i)����	5�X �JW��;�#抎'DF�ĩ�6��3Q���8Q^����@�	�:µ���w`�ŕh+�T�t��ro��4<,�Ȟ�}�N������8%)\�ƣڟDrg7x���pi�t�F�Zq���G|t�P�>����ڎ�o��x)�U6d_.k���u�hi��߻DS�^��ɆS�&R��i�7�����g�P:�Y��L��c]
��,��i"�1���X�X���5�j��?�7�Nc���9O�]�i����Ѿ)�)��+*JZU��E����������v5"�=�ń�Mf@k�6,:m��i���d��^e&���6�3�Ł��pݶ�����\�)�mW��(M
�3�,s��H�����K��#��S����U�h�$^�i�[a��c�Q"��3;��<�Uóq͞�M��j8��8!�����=��Vt�F���9�\<D=�5n���q�������n����!��1�aR��tz�J�C�/B-CT!}��Ӂ�L3��4tԻdO�L�5���X����q,MY������cG�,����Tl��Lc5_ڣ��iߍ;��T�#�5�}���3�ڋ�A4?p�o��3�S�H�m !�nI��t��'� ��K=�4�2^��_Q.�7�44�,X0XYbe�&M*��H��	J����C����
���ohl���)�m�}|���Q�E0KBď���+�,���4v���-é�>yadh�_�SI�'B$k���<�/g8$����(���`f|纣��y�&ݑ���O���H���8�iWcF�qE����' ����>%��3���#����<q�,��^����n�t�1�G�_���&Q�G
�voh=A�������EHؒ����1Lpi�{CIߤ�H,?KF�T$�E�\�KTM�>��υ�?�6�y��3�Z��rK�or���2;T�Ј;���v���n_}J/"�$ I �����	$%Ǯ!_�߿0u�+|hO#�*+G���'�5fW��	lQ�O����vb������N�n��?�y��E��*1!1=IunQ�!�&9�Gڤ�i搐2� Ͷ~[v�a���՚�<؞�±{_;��m��q=����C��������\uY=�>���7NE�ο�Dw3:�绬4�F��
�σ!��AYi��~��� ����S�Rj�!?��
툠Q�5������^iu��"C���
����oɦ�5a���)�S��ͳ�:f*QCY_�M����隀�)^�h���;�D���yC�^me�v�d�ӕѼJ�/[�ׯͩ¾=�G@:�V8P}'M�ϟ�3��`���T���²H	�T
d�ͨ�^�p�&�J+̕�^�G�<(hE4r�mQ�
ȶ��b��iS2�fw�V�v�wp�W9*V:.5h����O�^���ԢE�vk�5��%X�jf����u�iT4��%#�����G�^�F�
���FP3��.�1����r��@�F����fX��Ǖ<8��S(VJO.��J��ߕj������Z��sJ]�Ѐ�Z	R�D�?`���F[��Y��>���.�͚��+���D?��ʉb������O�����F<ÿ��'j��L�n�,syP�0�HZ���!�Q�wW������#s9�N�{�
6
�x�	Αb���f���(!%k�'�r�g�QX��W�
m�&A�Y��7I
����s�e��	>�pm�f����9 cƄsi�ۭi�ȊN"Ԇmt[�7��GQ?ƽ�
S���-�*]�� �N h��M��h΀�MDxN�(h�TZ�Nÿt#��J��
���V�#i�����U�^8��d��8ܴ�c��������N>�Lº�{Y?��S��	@���53<�W�qX��5�0� )F���?�O�1۱��_��1
����ъ˒�
�,�: a��!��?{v,�=�W��`���)@��u|�D�$�|+{�nJ���C=���tm>	�P���j��0�k��|ûW�}v"P��s�5�'�Et��7lɧ�@<)n�Yy8jnZ���@�/�D�0�*�G�S�� ��:�^6p�� 5Qa�cb�[����Ч�꟪G�j�J��(�w�@A��n�<�XH9~�j�y�k��Y���@mJ���&�%Ȑ ��[��h��NQy 9<��� @T��1�jO�1������w��5Ͳ�;4�z��KQ��R9���+j�-�XA_��d�~��7����+��`���j�n2��\Cô��a�G � �h&��>g�IR!��<ˁs�W]�d�ΣK�u��@A�d���|��$}��@��:�:�P�v�r�D������P
Q\�g:��j}��~-'� ���s1�a����ܩ�m�
&�l�W[ )���#��2��tZxt�����x����Q�w�S�fM΀����L���%c�t�Tg0�	
�m�!�i�=�s,r����z��a��l{�� ��H��Jn�UIn۷��tn��G��.����O�WM���Fx���)�!�Hk���L+�ǣ1q/K�B�����ZTqA\������	v���YC��D:撀Ϋvf��τ��-��)j�>h��{��d^و��3¸D��%G�k�����y-�n� T�붰8�LRO�+�����23��E��Ќ���=��f��w���Ŵ�dO�)א6tE2�����V�<�N������G[�]Ę
Gf{�Uq���g��Ӽ��	����s��E�1:?��W;�ʊV<��x8���[+T#o� �Ѩ��6Vf��L��/��0�����;^�e[�D#RQs��(ߛ���<J��hv3S�j*�t����H�x�������@�}�е^J�`d&ND�'�mC/����ioR5BW�"C
޿A&||�"i?����$�nb��C%���Z�@~;trq\�R�T��������wq9�NP�g��nBN�a���&�'˽[�ϮI��4ޅ��
�u��S�1�,����4�TҦ1�r��Z̩K�4"�o�x�v74J/��9�k�����W�x��@���J�U�>��I�oB-���������O˺��Җ�	�F�g�|�� �F�'HR�g�7}�a4������,j�0�*T���,o�hg�/��(���4{W%�j߳��*����Ѱ�IY�>���+� �ɔ[wv�5.�~���	)��p�D���Oq�D�!�M
�w�� �q��Gr$�[�@�V�/��-���
�
MWU����?	b^��R�ڗސF*1}�x����_�h��P�e
w���,t�
�	���܅sah߯�U�_-�noӽ���u�ͬ$�x���Lo�RQC�RU'Ż�xA�Ŀ�:ϳ;/���u��P�0yA|R;�q�(�ly@.{=�C!���0�� I�d9+.N&�2<-sds構�A�~m�#��u��	�K�}�J��b�
ߣUB���c�/~z�io�����S��8�V��2��XRu��8%w��fwذ����v�D�SN�|x�87�1Χ5_I��Fݚvn��"	y�4�G��`�G�P��X�<��;�0��Y^��b��=J�v�.�;�w�&��g��	�v1���AD�p+%�_�+g���wQő�e�E�/��L�f05��h{
��*X��@��R�L�ȯ��]��d[����ɛ��nP�O�.�r�9���-�	�y��g۲~Ձj~t���z�!�҈l6->�_?�g����/�&?XIc�NԸ�W����ʷȾpV䥛��&#)�ۿ_q/@��ۜ���\��"��K�\��bm!�����8�f��,���z���S�� D�u�\��M�, �9'��`Jp�Fx\�3Ik�eeN��8�	[���z���¦8����Y=���U֓��>��\��b���/�S��H�V� ����{f�Q1T\'ΰ@ï���W���@��
�t*��̴�^n�	��/�{�wp6�-i��L@�vO�8	��Uun����/�er�zr�