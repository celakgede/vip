#!/bin/bash
#
# This file encrypted at Fri 30 Aug 2024 05:57:19 PM WIB by
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "Anjay password nya mana 😂😂😂😂😂😂😂😂 Rasenggan (Ah lupa ga ada emot Rasenggan) pakai api aja dah 🔥🔥🔥 menyala abangkuh | 7I:ki:ge:0N:P7:Ca:Qe:tF:3h:HK:OA:Kf:Es:0s:Qy:dU:D3:1z:3K:UT:ZO:6e:dx:vw:Ni:3v:ud:tk:Ng:Vg:jL:ym:nX:AY:Ud:vB:S4:Az:qr:6q:tr:5P:DZ:Hw:dx:5P:jF:Wr:Z7:sP:rD:EJ:XX:Zr:X3:G1:TI:VO:fd:Dx:I1:5q:3N:E6:tP:io:gZ:l6:eH:Sf:as:XW:lS:cn:iq:4H:77:D5:RN:7c:qD:Qx:gb:cF:6B:Fe:kG:T6:W6:U8:IN:AM:GK:nm:te:4a:Sv:rW:kb:yd:rH:Oy:J6:W5:5w:tu:Cj:rO:QT:eK:T0:uA:vc:F7:vh:eS:2Q:9j:ay:Pu:Mv:aY:Jv:ut:gY:WA:Uj:mP:5U:gu:Q1:AU:WH:4S:Li:LO:2u:Dq:PQ:te:v4:VR:XC:Jt:CD:cf:7D:Ml:rQ:Se:ob:5H:6N:p6:gC:ph:x6:um:m5:m9:xq:Au:1k:7I:DC:NB:3I:BW:gC:2T:rW:Jj:la:Wf:T5:o7:MG:L5:1Q:WX:lG:sR:lz:Is:Sw:0v:ec:aW:Uo:mM:8i:0M:Y6:FQ:Aw:s5:4x:aY:6z:Yj:3O:Db:A8:oV:7h:0V:nb:Fc:ro:Bn:sp:Qm:RM:5W:4q:lG:BY:nk:2O:1p:Yg:T4:5C:Il:o4:TZ:2m:uX:pQ:Cq:VH:T7:fT:dH:yQ:sA:6D:nH:cs:4E:HZ:tW:Sn:FI:sC:ex:43:zY:Y2:N7:pn:kU:kb:AN:as:bG:ho:w7:K5:7d:Db:ak:up:Vh:vt:sb:OG:Xr:xV:et:wA:u9:8o:l4:iA:8J:We:yF:J4:bJ:5l:fa:IE:fv:ZQ:S3:av:EE:PL:uX:BN:s6:cV:6z:nn:Ah:Dy:UE:rd:Vv:wl:04:fV:Ag:LJ:RR:2r:NR:y7:8d:XT:hM:CP:AH:ft:us:hO:5L:Md:Uu:dF:tO:nw:Mt:b6:au:yH:GN:qa:Ou:un:VY:8l:fJ:5f:rm:xz:2Q:3a:mt:Nj:vU:6t:BZ:eM:Uf:2u:9t:pb:F0:Dh:HK:LT:S0:NQ:T5:nm:du:jZ:Nj:dC:py:Qr:Ux:K1:DS:wV:ED:Nl:DW:Ez:IR:Rc:om:zd:mC:x8:1Q:sj:hu:Ap:MF:pq:ON:8n:zo:av:Sx:B6:WD:dY:5A:ZC:4d:ec:1q:1O:WL:Dz:nG:ka:Gw:Kl:pK:IB:sr:O9:7r:tS:jm:ok:y6:nX:y6:c4:dq:3Y:AL:fC:qn:IN:o0:rU:kG:CO:wO:XM:RF:mq:Vy:si:2h:vF:C2:Nw:YS:l2:C8:gz:Lc:Cf:KF:Oi:WX:4H:q4:Gh:pO:nl:cK:qz:DX:R4:1O:ny:Ph:dA:rM:Cv:72:2m:no:bq:64:f7:vM:I3:QC:I4:Y9:JQ:cb:LN:Yj:EF:gm:0V:z8:6B:vf:zE:hz:ch:Sm:xg:6E:cj:sK:wa:1x:A9:XQ:Mz:rR:lB:Jh:do:kc:t3:eW:S0:0n:q6:Mk:WZ:iB:CW:6o:Ot:Sw:CT:uZ:8L:Ms:hc:v7:EW:38:nb:cl:8E:Zh:2z:7q:sF:Qg:Wd:ik:ma:O7:M0:ES:tx:rC:yD:31:Vo:1N:9Y:GR:Z1:1X:I8:D7:Iq:g7:EL:nL:pZ:2R:18:HP:d5:at:z2:F7:sp:B8:0E:ob:pJ:fF:yX:nO:i3:U5:Q4:0z:0n:3L:7f:Fi:zv:1n:A0:My:vm:0o:Qi:i2:Bl:YQ:eC:gy:Mj:ym:Tp:xq:49:oU:mF:Ey:t8:gb:FF:P9:dv:mp:fh:YQ:hY:IV:CZ:0k:6T:WJ:Nq:Gp:ns:r4:c8:tt:fK:Ui:kf:UC:mw:ib:nS:mV:Bx:eR:h7:AE:kr:SF:AH:Oa:2r:EN:gI:Wj:D8:7l:hI:HW:9Q:s3:US:k5:Qe:pw:WX:oO:T0:yb:TS:dV:Me:sU:Fm:tW:Us:mq:by:8g:xz:Zv:oU:vK:WC:PR:mg:mW:iK:en:fH:Od:B0:0W:np:L1:yS:Zj:Du:w6:GN:a4:x2:VG:mE:fB:Kz:ks:S5:BS:RY:zy:fS:xB:mS:PB:fi:DA:Pj:4t:oO:LL:f9:J9:Rb:iM:X9:kn:K5:24:Uq:WD:gf:lF:Ut:LD:ju:51:DD:rf:Ss:tk:7m:dP:vB:St:PK:7q:rU:1u:rm:mM:Yv:uZ:Az:7i:PJ:mB:jg:G9:qu:NS:7D:MR:Nz:K0:dt:Mj:Ai:XU:98:0H:3Y:y9:N5:dU:WT:mE:sy:2P:fo:QF:Vl:nc:2o:Gi:Jr:Hu:oo:kS:Aw:Kf:4v:yH:kN:0q:FK:8U:XV:Ww:RC:eV:3k:gC:1a:Dl:um:vl:e3:GM:AH:R5:q1:iL:C5:fH:9s:0J:gZ:2a:sp:Vn:qK:fW:zh:1Y:aF:D2:NN:FT:GK:oN:f2:Lg:2D:9y:ra:j9:Yb:3Y:Ui:0w:UJ:dq:jY:63:8t:tE:fc:MS:Ys:x8:bI:Gv:38:ot:bd:FO:XU:fg:mr:i5:3H:6F:J8:aa:6v:hP:wr:C9:kQ:pZ:WF:kH:tB:7B:7K:Ss:zE:Xr:hi:Dy:2j:YB:eT:2U:39:E4:rj:sv:Wg:rU:Gh:Sk:xM:4X:NY:uS:hg:xF:HD:2C:aw:4g:lq:D7:TJ:QC:xG:CF:ds:jW:R7:02:ak:Y8:jl:6n:AT:da:jO:4e:GW:8V:ij:EA:55:7B:R9:w6:sp:d7:Cl:MQ:Wt:hE:Ib:LO:a9:95:EW:HK:xF:Rb:3f:7R:6k:u3:mU:C6:GK:9d:lS:8n:8T:m8:mD:9Z:7C:Df:Y2:0h:eR:X3:ud:9I:1A:X8:UA:NP:sp:1e:Fu:yx:BO:FN:ot:z5:Vm:JJ:1Q:iT:k9:Tk:8Y:x3:5G:wc:gd:Wm:dh:JW:7U:D3:yA:vo:VU:96:R9:HH:gi:y0:aC:qm:BA:jx:4L:HF:YB:56:l2:Hw:4k:tS:h9:rC:Q4:On:7D:5e:4e:pA:6C:hN:mq:SE:qE:eb:cu:Xl:Hp:5l:dx:l5:mT:he:kT:N1:r0:uX:oW:EH:o7:AN:u9:Te:aE:X6:g8:AK:Bl:YN:oN:4j:Ua:QF:F7:CU:mj:Fe:Ug:He:xj:t4:xV:U0:8z:qM:dB:fn:Jr:eD:bB:qP:LA:G1:NT:Qx:ad:Ri:e0:2O:S0:8o:rf:lg:cd:Ff:dQ:ED:B0:Dx:Fn:gO:Tl:4q:k3:bE:9F:WR:0S:lB:Vi:lX:YM:XI:dK:RP:ks:Ah:5U:dx:ox:Dh:js:Pl:rY:bC:zT:mu:bv:DU:eO:KW:xW:o6:cP:Co:Yd:3O:BO:A8:8y:Hs:9H:AN:of:Jq:sR:6w:mb:On:qr:R0:IQ:n8:HY:mV:aM:R9:tL:zQ:0Y:ld:eF:ee:Z8:8J:Ij:Ty:Hl:sq:QX:C4:X7:mK:AY:ld:VT:sY:OK:ND:fQ:vP:yr:iX:R7:2Z:sz:Nj:0Z:ve:Bh:vg:Pb:3W:bH:vE:GG:bK:EL:Uw:nA:20:Kt:hm:c0:ly:nx:eH:7C:05:Bp:5a:Xh:oA:XH:7p:Pz:w1:DL:el:rb:g0:UN:ob:vI:DF:Xi:RA:NI:3B:Hk:Cl:dG:64:cu:bq:dz:TW:pc:75:PZ:FM:Bs:ST:Qq:qS:ts:9K:Q8:ks:W1:w4:OR:FE:AM:wS:st:Ge:zt:g7:aa:pH:ir:Z0:Og:Te:Cw:Td:Ep:F0:5L:5f:rO:10:ua:yN:zY:F1:Gx:Jh:9K:xm:n5:d5:nO:8c:Fz:4X:tM:Bz:XA:ec:ao:Ih:Qb:UC:iQ:u0:lJ:Xa:os:jk:HF:Qd:WD:Se:lr:J1:v5:8z:qA:VC:vx:iy:Mk:NR:Ye:KG:SI:kC:44:gw:6F:Pm:9o:x5:38:3X:Fs:2s:rF:01:NR:gC:R8:V9:kK:dE:vp:tT:99:Q4:c0:V5:ze:Cv:oC:uH:vf:8u:rt:An:Jn:0p:Pk:3Y:XF:iB:Am:3H:5L:VT:PW:06:eb:1E:3n:Uq:4x:sE:57:pO:Wd:eI:1K:oQ:Ok:vW:s1:B6:hX:Yg:8K:lw:DI:eI:O9:4r:nR:1l:mK:O0:hJ:ec:43:xd:eO:Ux:AD:MK:u0:5c:0q:kO:5u:EZ:OW:0t:42:Mb:aV:fY:LL:Vf:eX:7s:As:t6:U6:BU:Mh:IR:60:PO:oC:Tq:2U:oq:rg:av:T1:B9:Yx:QK:Fi:O1:eW:dP:dX:mt:YO:6D:24:EH:7L:zi:su:Hg:mX:UX:iW:Zc:R9:yf:F9:tp:Dj:jh:il:00:tg:Jo:gT:HI:nw:re:Es:YH:Mw:Jc:F7:HG:uw:qQ:jr:x3:h5:6x:ev:d5:Ox:HE:wr:ro:AO:yy:yy:Vv:wn:vB:WU:AA:io:2j:gX:1G:eL:jR:y2:T0:du:6n:NN:kc:tW:Op:J4:Lv:kr:2C:6q:SS:4q:bx:qJ:mW:cT:oK:eK:qo:Ny:X0:EB:ux:G0:iL:0g:zG:nE:hj:wY:bX:1i:mU:tZ:dh:7b:SR:IO:Ah:Fy:cU:pT:wC:eT:lH:6z:U7:CK:4I:cU:zf:Xu:KW:9n:KB:Qv:xT:5v:vj:rk:Qe:Dq:nQ:8W:Bu:Fr:rn:R2:US:XN:Mh:2i:Qq:Ao:Fi:ya:57:3g:BU:va:pN:3x:hd:wa:o7:8w:ec:m6:hp:Kj:PS:JI:8D:nM:Qx:hT:dI:AI:bV:Om:X1:3u:Wd:aj:6s:0m:Qy:1b:Di:97:i8:5f:br:0S:QL:qR:fr:1O:BB:DQ:8U:kq:Hd:DU:P4:HZ:0H:ID:0F:6W:y0:4f:ej:cI:Iu:Zs:v2:mz:Xt:qc:nt:qs:CA:x2:3J:Uo:ED:lP:sx:Uv:uR:X3:PW:mP:8L:Ja:u7:Lm:2f:2C:BF:8y:GG:vu:cG:WI:2O:rR:7B:PG:y7:3j:YZ:eJ:Gy:nk:rA:aA:U8:fD:rp:EM:3Z:4N:Hq:0x:wQ:ZO:ic:yq:2V:S8:NQ:zz:Hr:q6:Jf:G7:IA:NS:xM:FH:Dt:Dt:NH:V7:74:Eh:qp:Az:gm:ni:qJ:C2:5z:mw:9w:TD:vs:KA:tA:jZ:2Z:WP:1S:Pi:Qx:ZS:v9:PH:e6:3n:v7:sF:V4:Ps:si:I8:Ex:Pb:is:ps:b1:WH:8g:F6:po:UK:Hl:Iy:pi:4x:k8:Q5:Ze:qh:Mj:Az:R5:2g:Pw:8I:84:Fr:xQ:uD:UP:Pz:B1:aA:hO:mX:gM:GC:5P:bK:r4:Mg:ma:HH:3y:4q:rw:Rs:Fj:t1:0H:lx:N3:Yt:0P:Rb:vl:ac:aZ:C2:nZ:uc:jQ:Xc:YU:EI:X8:Tm:HK:Q6:qa:Nj:3E:m6:d0:A5:Ln:iF:CL:2U:Gh:kD:ey:7r:GY:uP:7V:dM:JA:jY:9S:Sy:8U:uX:6X:zs:j8:SI:0G:tg:H6:jk:Ov:kK:h4:WL:vW:VW:wU:2E:Sp:gq:vR:8a:4r:oI:qj:lf:J9:Gd:uq:z8:ul:YH:lt:lM:dj:XF:qD:wF:Xw:iQ:T9:PV:Og:P6:bq:XT:JL:FJ:zp:No:YQ:pC:T8:oy:IY:0u:x3:NL:Fw:HI:gu:mI:XT:Dg:Ya:gY:XD:Tl:uJ:1O:4a:5Z:6f:Uu:L0:J0:gu:ZM:6F:lq:sU:X0:Aq:mi:cS:f2:cy:AI:3j:iq:IO:Di:Mn:K0:b7:de:Xi:7A:bu:sp:8A:CY:Nl:AS:k8:2C:94:Ha:jo:de:CN:dS:xX:QG:qE:vv:Hd:rQ:li:o1:Nl:MJ:Oy:E1:kO:Mj:M4:5I:FF:DW:jM:Kj:pg:QQ:oG:lP:Lz:pi:dp:uo:C9:DH:xD:fW:AN:dV:66:EK:AY:qA:qo:jK:MK:hD:XO:hb:dq:Ob:lp:By:0P:Tr:Tx:J1:rq:t0:nJ:yM:2J:s3:Av:0U:G9:FP:3F:Zz:h1:PS:o7:0C:km:3u:CY:Vr:KY:jj:5U:lu:gC:IG:AX:TM:fP:Eg:Vh:z3:m1:rg:NH:r7:z4:hl:C6:nw:MT:MO:PG:W5:ac:KR:tn:dY:ny:DV:zK:Fx:Zf:5H:PL:BD:Zo:7f:NV:Pd:YX:82:Al:29:dD:oQ:wZ:Zl:7u:DG:7s:IH:NJ:zZ:0j:wE:sd:It:xy:Ml:Br:Mm:gG:vN:uH:2L:3p:ng:pF:f8:UX:c1:eX:Rz:M9:rR:Gc:d9:EE:8M:eb:VL:bp:V4:qj:F9:Ri:lQ:zv:vg:A4:hk:a0:yz:YX:6j:dz:l7:59:Ze:Wd:YS:Y0:Hl:eJ:MF:ED:jW:pA:mZ:GD:eN:L5:bM:wn:95:7u:vo:kF:28:lY:tw:Xb:nZ:KW:F5:4f:Ym:dd:S6:0i:kX:Ck:Al:Pb:DH:Lv:jn:sS:hP:ou:wF:zR:La:jA:0Q:Ql:9F:3K:Ch:4u:i3:In:Mg:Tj:Hn:eT:pu:EA:XE:KZ:Xl:9P:P5:Hh:zs:L8:cm:Ze:sm:Rc:sG:Ot:lu:Xj:xU:0P:ck:dz:ls:v0:tl:Q2:LA:LO:U9:Dd:Kg:mz:57:Ud:UQ:h3:wj:Zx:ih:qT:FU:YM:IK:4R:iW:DZ:Gx:tH:X9:fG:Qm:Ik:pC:Ii:U2:sO:lQ:gl:sa:XO:W5:pP:3L:NO:AR:Jx:34:vW:II:lS:hP:7Q:PS:km:Kn:Sq:mb:jA:RI:v4:Ya:Wf:OL:Kz:tI:Ie:ju:xM:NP:IN:jY:Sr:qc:f7:pe:No:d7:Ft:ia:kE:Iw:gK:79:nE:bh:PZ:28:qS:vS:OC:hX:0C:ob:xB:Hy:oy:pb:gh:59:KN:YT:Gk:9J:2j:GC:pc:JO:DM:F3:NI:UI:mO:a9:MZ:sl:bY:Fu:xS:HI:H9:Fg:ir:HT:Mh:dI:hj:Fk:Pp:4R:IU:c3:aR:26:by:5j:Mc:wX:nG:4C:qk:xW:oh:nF:zN:Fz:uo:Rp:lS:0j:Nj:Ff:Sm:pj:2J:Bw:uY:pv:fg:1K:x4:7p:ip:WA:tI:WU:e5:aw:nJ:Ci:f2:8C:db:S4:Ut:Dr:NM:Ry:HE:0d:qF:L1:7X:93:d6:fU:VW:Dv:5C:0E:QZ:Ao:rO:qC:rr:Xe:dJ:4X:Nh:Q3:Z3:IF:u3:n4:uY:Ql:YB:FD:EH:zZ:GL:2q:LX:0i:yZ:JJ:2c:mg:21:NG:tt:yL:8Z:lP:l1:Xb:Ox:rT:Bn:bq:XW:h2:Hp:vB:sb:Sy:V2:kq:7w:Kb:ha:gI:J9:CE:KK:k8:Ho:wc:dC:ks:7m:FO:Il:iO:4x:fz:qf:yo:dW:mL:br:ai:j5:8H:Hb:87:6d:FV:8o:Q8:Or:ad:CF:GI:vq:vZ:gy:zH:m5:kG:Ho:hd:u8:hS:Nk:4a:zr:6h:nB:Pz:NU:EG:mY:fj:On:4T:um:EF:f9:zM:Hl:vO:48:0k:Mq:WV:ms:jv:9N:25:vi:pt:LU:is:ar:Jv:Dc:g7:8y:EA:uZ:VZ:Gz:03:0O:f1:rn:jS:12:32:hX:0b:FZ:50:AG:ZU:RB:Zc:Ni:Xi:dS:Yd:lB:GD:gC:rS:Sq:G2:F7:qS:g9:W3:9p:nZ:OS:z0:9t:z7:r2:U8:il:je:SE:oc:ge:89:H3:60:wD:EY:yE:yO:U9:eb:OB:zx:te:7r:YC:0m:ut:OR:tS:bl:Mw:c3:Xx:yc:Ia:Qr:Sm:GQ:Ns:9d:Nt:uH:Du:pq:73:vy:nF:ou:gz:9R:tL:31:qa:di:hX:4y:yF:l7:19:Ib:V6:y2:0y:P2:p5:EZ:T1:16:CL:qH:IP:aV:aX:xx:bi:yM:8b:wW:BV:aj:Lg:JA:4Q:4n:qg:2F:0B:YC:0Y:Av:VK:6I:Y3:gI:qk:0O:Uf:xj:7x:Xk:Em:qw:MN:7y:9w:Fd:W1:hI:Rk:el:vM:mF:V7:ZT:8N:yY:cL:Qe:Ox:0d:mN:84:Qx:Ev:kb:MY:Mn:QP:7y:wA:E8:V6:wb:WQ:SL:sc:SL:WR:fk:eD:4q:0O:B8:PU:JT:Mf:DV:I0:bY:8d:EN:Sn:RE:CZ:36:FS:L7:yv:Wb:Tw:qX:9x:JJ:On:t5:vI:MI:Yd:9W:tX:Ji:mt:xr:kh:BZ:tt:Z0:lJ:1U:2u:qs:Gh:MR:e8:Tw:A2:OI:O1:gr:3F:LE:0a:Cm:lT:j8:Hm:vo:tj:5r:X3:E7:sR:Cx:qy:St:86:vX:YR:w2:Yq:Xb:ib:Yl:Or:g8:eO:cd:Ot:Rf:k4:ZV:kb:FQ:6i:mV:4Y:KM:Ms:YQ:95:ei:BZ:Vy:al:QX:kE:WV:4D:pC:7r:uR:xw:5u:PC:hV:Xz:Qd:WB:W7:si:uO:w5:WB:Sw:qJ:AM:7t:C8:Lh:4h:Qu:O1:8q:Nh:9E:U2:EL:JB:bR:hq:3m:Je:DT:4q:RW:9Z:va:i6:3j:08:uj:Lf:rC:Zs:vc:BW:Gc:08:R8:Ov:tQ:j5:08:Nf:Js:8c:2h:Qm:hK:pP:gv:nQ:xW:C0:de:cT:ep:JC:kY:rF:RK:nc:w1:hE:Vj:xv:Vw:nK:XF:WE:FC:on:1w:qg:lC:x7:8T:Mo:ox:S4:KZ:Bq:qf:Hy:uQ:Hw:FD:qb:al:hd:Yb:eQ:zG:LJ:Cx:XV:DL:Vf:rz:eg:qK:um:Ak:l8:F9:fc:XI:FM:AW:b4:a2:fv:8u:h6:14:M6:Ya:aN:u9:pa:H2:ep:VO:2c:8e:Ib:ns:kY:93:1P:P1:hv:qc:V4:qN:EH:4k:xu:CF:y7:3a:dH:hx:kW:NJ:pq:5C:pZ:MU:fQ:z8:Fs:nG:AT:Db:Tj:ch:Jn:0E:t8:2S:Fm:a9:gz:BZ:Co:Bu:85:P9:Hw:D3:5F:sW:6W:7B:Jm:eQ:er:tC:6V:Kc:ht:1i:j9:gL:ty:8k:il:fP:g2:1D:LN:1b:bZ:fN:WV:qH:PZ:g5:6U:Ms:b2:ea:u4:ZY:eU:dc:6A:Uu:Ag:ey:P7:WT:4W:nk:V3:5r:xQ:4H:eg:uX:gy:QV:5a:lv:iY:WZ:PH:Il:5d:Qw:5U:oE:bO:W4:yK:bL:K2:8W:DA:RD:zc:LP:Jd:Cb:4W:GJ:hx:xz:7M:QH:3F:ar:Tf:Tu:CV:ps:St:X3:OP:ZX:FY:1l:py:WW:tH:eZ:fk:KB:Ff:uY:GY:2D:fg:bc:hj:8U:9n:pF:7V:8j:1V:Dj:y1:Z6:u0:h9:6r:Mo:fa:6u:uq:Ux:vm:zK:6o:WV:cx:Ol:kL:cA:1C:W3:pZ:by:fu:lJ:s3:0b:e7:Kt:d5:d3:NY:ts:Vq:yQ:oz:XO:CU:l8:AW:fy:CC:Dy:XP:PR:9G:tq:N9:mI:N3:QB:Uw:gT:Sm:LK:15:nn:iZ:wI:9Q:Xa:Wf:lL:CS:OK:hr:vf:cL:lI:Sk:Cd:4Y:p2:V2:3x:TM:Fi:Yc:eb:tA:XP:ff:IA:p3:VZ:iB:Ho:aQ:1O:ok:dN:0u:a2:uW:XF:16:vO:fe:gV:Ws:he:RM:MP:5M:5M:5U:XI:nY:3J:Q2:8I:sJ:4q:wa:fl:5D:fi:4W:gh:TS:3I:yn:uO:W8:Gk:hG:Xh:Vr:51:QF:7l:EQ:TR:oW:A1:Lw:pm:jQ:Pr:Wz:vt:DL:Jp:ox:Pg:xj:kh:FH:lD:VU:Or:ez:8K:SY:J4:q7:uL:7R:MU:WU:8q:6g:zY:wd:as:Jo:2T:h3:mW:BT:z2:ua:87:d0:pQ:EM:zH:VA:XW:e2:ds:Q8:hd:pq:dh:Pr:Ef:4m:pV:yP:4o:Bw:jk:9V:Af:zm:QH:ni:se:ZN:a8:iO:Pu:Y5:hh:o4:fi:Q1:TZ:m4:I9:lw:a6:4k:Cs:v3:z0:4b:Lv:xt:5o:PN:fx:hN:BL:eU:GS:6C:cN:8q:1C:uq:Fu:gc:4v:qj:0Y:vt:es:Fo:7G:uB:nq:Aq:9L:Dm:uK:Mg:5r:GS:y3:AT:uI:UO:s2:f4:Qj:fK:G4:Sm:SN:sa:LK:rt:gl:yL:al:ZS:y9:Fw:1v:JA:ok:PZ:68:7o:jv:hy:br:eo:4z:pf:ca:SK:Fg:Iq:6O:zp:sm:EP:r6:US:Yo:qX:2M:5B:PW:EU:4a:Ah:Yc:xn:6w:m6:7D:O7:jx:EC:5x:yt:xk:7W:9o:xr:3g:wL:Re:kL:hn:u4:YS:gH:WD:kv:NM:Re:5j:ip:qe:OK:DS:vx:JD:fD:23:Eg:GQ:e4:VY:OJ:h1:qO:3S:Bq:3T:bV:ra:Mu:1H:z5:xQ:In:WZ:j3:Rr:mQ:i2:hH:Ck:gR:Sf:hT:5x:01:QM:PX:Wk:Ow:e5:qF:Zj:JE:8e:9Q:2p:Lo:C1:Sd:2i:7q:6u:OQ:VZ:Ti:D3:5J:eH:NP:ET:vF:V0:Bk:B3:Ba:PO:ZX:PM:cN:t5:7j:Kg:sM:q3:rF:dB:gd:jW:7h:8F:ds:bs:b6:dt:Oz:Dr:Nh:q0:Te:17:xf:Lw:jC:Aw:Fm:J2:3w:kQ:BR:LU:7P:Q2:4o:Ew:QO:45:Vm:GZ:Ai:qh:Px:VF:3n:Ku:e8:Y2:jg:th:fn:1D:Lt:wQ:SK:q7:Z5:hU:Hw:RZ:sY:qv:st:mh:Aq:4f:qq:TN:5Y:li:eX:q3:XW:8l:Pb:mL:eY:J1:q3:V8:wb:wx:2P:av:bM:6M:8T:Qd:o9:Gk:dj:HY:Zb:pt:jJ:dh:zL:52:Hx:RK:fe:hy:U7:QW:uW:5U:50:EQ:0K:1k:jx:z5:Z5:P1:ic:js:oN:Rq:l9:LA:eq:ml:NA:7G:X4:ye:dk:do:At:u0:eS:qn:SB:2O:k8:Qf:Rp:3Z:K7:Ob:j4:wz:Tc:L8:Sg:Qs:xM:IN:m5:F3:er:ps:tP:ji:ry:BR:8j:Ce:om:6o:Z6:OH:4B:4t:nw:2P:fT:76:Bm:p4:vb:34:ka:Fv:FX:1A:Zh:nt:ml:ra:tb:Ry:Gf:hH:TC:q8:eA:6R:10:ys:bb:Hb:hK:BA:DQ:8M:Rk:vm:pA:VE:LK:xm:yU:8F:6Y:st:x6:wp:ms:Lk:5y:0p:MG:4B:eH:Pq:2U:ED:IC:YG:I6:7L:bg:4J:SZ:DY:At:sN:LE:Gu:JO:yr:DO:N6:5Y:Pp:29:F1:xo:3F:yj:CN:9P:FG:oa:Ur:Il:5Q:Al:3v:5J:LN:T7:qB:zq:qm:wo:xu:XD:2i:Pv:3m:PR:bX:0k:HO:P8:L0:SD:d4:PG:X4:Zn:jc:IT:DF:lu:D1:q9:ZR:AP:5v:c9:8i:8U:ko:j3:3G:xJ:Ot:qx:qV:wI:Az:Li:NX:fI:Ik:ti:xP:bE:0j:25:PH:yn:As:JO:oV:5v:MA:Ea:bQ:HX:DI:Zb:bo:T2:Gg:0A:6t:r9:A0:7f:uT:0L:PT:8i:RV:hG:00:AZ:Z8:YT:YR:gM:3F:Ma:Xj:i1:K1:g2:9H:2a:lv:vV:BL:vS:df:pZ:kQ:9Y:Z8:bt:As:yY:v8:X3:ZN:Lf:LM:1i:o5:XV:p6:0i:fp:sm:bn:wH:IX:fp:Oc:qj:Y3:3N:kk:TT:IY:Wk:6Y:Pk:ON:xj:MT:ot:QS:9i:3P:Pk:ln:Dd:F8:5M:Zf:YF:qH:7y:KR:ZI:6A:If:oR:1z:ij:NC:uL:QU:2O:Ia:gp:c6:DP:Xc:zR:To:wO:Ob:Rh:oy:QO:cR:F0:WV:jM:th:by:fT:JL:AU:rC:lM:7z:oS:DU:i0:9H:y5:oj:2J:Mx:Bl:1q:PH:cw:et:EB:yg:4Z:uW:gC:lf:jJ:ia:hY:pI:1j:LC:PU:yu:ea:6g:dk:hh:J2:oo:Ax:tS:Dw:Mn:1V:0c:gU:9J:IW:N8:XI:8z:Ff:uV:SM:30:Cd:8E:7A:6D:WV:M0:Dt:6X:OP:eb:CJ:D9:L6:Xr:mo:rk:k0:cS:RN:3v:eL:3p:Hs:ZQ:fp:U1:NJ:zo:nQ:CN:FQ:90:RJ:FX:H8:SG:Dn:yM:Ai:jn:5F:vM:m3:v5:mt:Pt:8p:Ti:2Y:xZ:re:RR:bm:lI:wN:Ub:ck:hV:Dl:2E:Ue:5J:pa:EL:5X:Jb:Cx:bg:CN:bJ:t0:mY:hS:JT:6R:84:iC:j2:AX:XV:mR:cZ:Ly:0j:ns:MU:S5:2P:XD:Uv:Gw:J1:P6:Ad:Ue:4a:Aa:rn:jL:IA:Lc:50:bA:4x:Gy:Xu:ZK:t1:pN:uN:0U:IJ:M6:CM:VV:UG:1s:HZ:LP:Wm:kY:9H:I9:QJ:5m:Ga:ob:5S:2j:di:UR:Ry:H5:5h:ik:yC:Oe:2l:Hu:PZ:Pb:we:B9:7N:tE:r3:63:Jf:mS:Iw:WS:lb:NN:KW:VY:Ia:Ti:ph:C9:4W:rY:bE:P1:mm:fI:fS:T4:Mw:2P:t6:Pt:nE:j4:QL:bH:1A:XA:QG:OY:El:JM:4R:LZ:1R:ej:pk:Z8:L3:i5:hp:xg:Q9:bY:4q:In:xV:Tx:BF:VX:RP:JP:ei:Pe:Cy:rP:Wj:bv:JB:Iu:i2:kl:Tk:4B:ul:TW:RB:eZ:tX:kw:cA:Cc:RW:de:iA:Qq:1v:zK:ow:Jk:7o:3F:f9:Og:Yr:a1:Nw:V5:Wq:0Y:xx:ig:wp:xh:kB:8e:Cy:Ad:hK:GT:8B:g2:z6:kh:BB:j2:v5:pe:iC:Tw:NG:Se:WE:Xr:SZ:5j:S0:og:gh:hN:Cb:uA:pP:Sr:k5:Pb:8A:5B:Yo:Y8:48:eq:nx:fq:nV:RV:At:qC:lI:FY:iQ:sk:vi:az:Dp:Mn:br:jN:dn:k4:Ym:wU:ZO:Nw:Az:t8:Mp:xN:yd:qV:iR:O0:ox:jI:LN:7H:47:nR:mD:jK:jE:eV:bJ:8A:b7:3g:N8:H2:2N:A8:rj:l4:p9:QB:vm:dK:Yp:dx:fw:7U:4a:gf:EW:D1:kp:kg:G4:V1:0X:eH:62:rZ:uW:Hf:vW:Ck:7Y:mG:j8:dJ:a4:J8:vM:c8:Ww:br:JD:6s:N7:dF:3u:nv:JA:cE:Tk:k2:5p:Bj:Lz:pl:9n:nD:43:6K:xO:Gm:EU:RI:HB:St:nH:pj:e5:ph:xI:3Z:CK:rl:xm:IG:QO:tC:gl:Fc:Ke:xK:bi:QX:OF:gC:vD:tW:uX:KE:5G:Mm:Vq:u4:qp:dd:7M:lK:Or:wK:oE:hX:0U:PD:8F:5t:TF:Nf:q5:MZ:Jg:05:L3:Hz:zn:CE:dW:FY:26:Fp:Iu:Vl:x2:H2:mr:Z2:uu:1S:DV:tH:iJ:tm:Iy:TM:kr:c4:Bj:5m:CI:ef:ev:Vx:kB:41:kH:yq:Wz:fS:16:M1:zq:On:0o:Fs:5D:Nj:X4:J3:Fv:zB:jX:4o:tE:de:u4:uJ:hm:sH:l4:8p:f4:wl:Oz:DF:Va:nV:Ai:NF:eN:lj:uf:Rq:TF:D6:Rx:xO:ey:uv:Cx:7h:wo:ev:6e:GB:Ye:vB:ds:Bl:LQ:23:9z:As:tW:IP:m0:KI:6a:ZQ:xY:JC:EX:rh:pe:R5:1e:tx:fG:aU:qw:7G:NV:LD:TZ:H0:eo:jY:sQ:Zp:i6:PD:g5:DY:5T:ga:no:x4:f0:o8:3S:Z3:eF:9l:aW:18:dP:39:Ad:MJ:5p:zQ:30:Qs:Bu:4u:yo:VG:Qr:SO:qO:ul:V6:V7:gA:os:1X:nb:tL:7w:Ud:Cg:bC:Ia:so:y6:C2:WR | RMBL | RMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBLRMBL $ | RMBL" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <rmbl@rmbl.my.id>."
  (exit 127); res=127
fi; exit $res
�
ɢt��C-�8�����W!����	�MW�?����0I��g�
s��U�"
e�Ї�+՗1�ݹ�FtW���P&��1�����u6���7 �H�N_�hf�U=��;�� ��Qo�к �o%�Zi�g�l�Lj����$;��2��|��X���Mߺ<�a���{��v%C�zl�Ԃ{ޜF{�'�m,	S���%�7:�:����T����A8��N���l����3��)y�/qQ����c(���4�:[6���yJ�M�6���A��?:��{xN!�n�,�}�F.E�z�:�1jy:'XJnZ�o�������*.�˛�,.�7rp�(������ej��skU&�D��YS{gAf��F��p6�����5X	����m�'�}�6��_�
\n�͋���qKubT�x.�FP�����8�r�����OT��
�m+�z��1�ٟ*dtT)����.61�ɱ��V�iě4cx�XF�'��2��O�`^�}͑�1�����D�aq�Vk��Y�@J.����-1`�����槙�E�
zI?+A`
jgX�3��W�@Z���Uy��u�_9�h��|�9ň����� �_��s2O[j��`&��D�
-�:��E3,Zi�uO�y�uw�JV�6Tv6
��ۖ��4���� A�D;p�����}^�#�\��z�[�:ۅ�!<Z}F���?�!_�е�x�G�����^��ş�T�x��!
��JnܠV �����@�Q�ś����/��d�+�?���n�8�R������
��0�{e-Q÷�"��!R-�K���`��G�9g��^�gHaR;��l(��ݤ�o�����5�騢�*|������o�@��M[�̲�x�L�,V)-p�R6��t�����?�	�M�8c"��I�Uk6@�Ϊm��S��.���B�7$�z�=�" ovnW9AV�����J��y�˨V���������+�Mx)|�W+=]��Y�ʞ5 ?I�2���; V�eJ��f�Q�xԖ��IXMC̭�쐳w�#�u�"�(B
�yӢ]rEa!"��@fV���6f��B�L���[x�����������y~u��T9�܀����M���Z�a�^�O�1:��@
i���I8� ]AY ǂ8������J�R�tF?���6���Lh
3ÆEG��ծ8�lD��X"cm����Z�d`�?գ��5���\�b�u̖��tpIr8���+C��J_���
���B��R�bY�
�2t&�Xgl��
�F��P�}��$c�o[N��j�w����OSbmD&a��`۳ʀ���	��|c����l�"�m߅r�Y���&��Ѫv�'n�ЮYc_J2R.��y�3Q{�(��;�ʂ����@[��4�Q�ۧ�/g�ov�z��~WjZ��h�#�����E;WX�.��~?��兯�wʝ�	c�㱴:���"����(�`ܩ����ޟ���f��cX���^�������b�(�cu`ֻ�Yl~�A���َ������8U|wt9 �БX��||�����ٱ�_AW���sp�� ����>�����P�xJg�U_��y:.�����$�j�k�Š0�GM�4���r�9�ֶ.���48<K�"->�)�v�'x��p㎒���rM��)�[�̩X�7̛�i��;~|�S8�e�#5�eI`zV"�S)-,%>=��L�v�:x���=�-���2H��uW�����P�,�;��Y��u�|X��L]�2�n���
5�a��is�:�i��z��;�!ɹ�kTC�C����G1�"�h�8v����L�L�M�83h�l"��� ����d���O�j�i�^t�ji۷q;��9:�g!a�,�'~l��bU.�j&�)c�nb�i�+�G�NM=2
�.�@m��Jf� s7�Wh���b���%�h^��˒�5ļz�iƭ ,�#-�Zż|�H�4lb�'�掳��jNF:e`�Pq	ԦWj�Pn_���%��62�7Qqz�C�c��	-v(���8�s_�R��ת����9 ���i��1�e��)a�W�Sx��ӏ���(eT�4���
��u�������]� 
� ��KjVl�cͱTSEE���Z�V�?�O	��)�fX�_�d���6�)��&I�߳�g@��Yk�����N�:&R�������Q���o�%��*ẍ́Q�~j�1{��(�Zb�}$`@���Y&��H�
(r�te��!Ǩ0����ſ9�:
�c�J:�u��{�AM�4B���f^ET�f����weD\�H���wƷ(R�Pl)8�i#�kg�<�S��<��
��N�B�~�J<Hw[�ޤF��y��sӍ�~��z�#��3C���R�A�E�����~=������e9N0�Z��O]J����ؑO���P@&#����s~��*���M@=��~�T��%�1ίh��ELO�/�7���[lEQ��VT�,y��7�m�:�N���>�Wn�����RT5� �H�<��ıu~Ax��=���q�]k

��P�@z��vZ�͏)v!�c���i�
�p���Cئ�O�s�+t�W�4�6.�����DS�^�:i�a�0���6���w���똩�qB!����T@��4��Z��,� l�T�������������諜샪�ib���z��yp{%�xm4��
��z-LܪeG
��ꖣ��ZfC�?Q����)gZ���qy�%��|�WV�Z�.���%�p� �'�z�8-ۻ�sV0�\�W�@���WSsnU�Li���?�b�EΣ�:��M<UrŨ�Q��2���.b����Gқʷ9۪���p5��`�5O���G��&2�{��5�X��G�.W������*��v'4����4�^����5�}X�"`��r�AfL���O(�O~-�'���7�����>Ơy�b�<L�!�E�Iv��]�k7�x�2\^���	���H`:��w6���z���Q�"��a�⢏aBB]������t�J��lWޓ�գr�#���4�#yt���Y�_k���p[��~�M F>Wh3"58��TN�5�mF*)�'�1��g��!���(���}|������o:�|��J��i��6�E���v�GD
��= ׂ�Y������l �ɴ���4���E��X�= l�XB�WY� ])����Ka=/��P׿0�j7[c�������X*5�_��@Y��q��H7-���`�5T0�&5��}zz���p1��^sjy�6 ���Y����[9 K+�0
�>�I�'��t�t%E��	xG��C��Y�	�,����N�W�K���b4KN
�'X7��B���Vn6�2��o��
�$��;q��{ƌF�[Ƀ�V��C�pH �QEͿz�=4�o��� �$3V��B9g�m�l`�M��+��#.{-[���nZ�220�,u�VZ1�r�3�gnJ��A7�F�5�!g�>�RK��#ٳ5�Hi��E����&)<�uqv��9ȴy��I;QX��̈���~89��.�H:#��V_�ˠ��#,�eca��F�������G!֑H}�-��D��/�q]6�S�H��4ܔ[��3eP����K� ��g_Weޫ�Z�����1	��Jh��6�B���ҀƗ=���H����}5dL33�xv@
�`-�C6��&E�)I��l��	���mtU�+9-m�.l!W(�Im�v��ѩ��q+�E�Q?��^��t���,��<��!L��#b}G	��׮��4)P�R@CN����O��aG�܆������Zm
0��R��gE��:����`�tҲZ�%�<C"��
i�/-!�W�/�Kw&�',��S�Fn|l�ԽMJ��f&ܡ��2�siw&�������2�O���8���S�B��Z���x������*d���5�f��OJ��9�gSL�w�
�S:	їYX�@�p��O��f������ބ�+�
3rJ襦f����}�N�9�C^��'��Z���YjC�O�c��6������H"��c���"�~ꁗr��B�\�mK�D�.��|�t�%.nBZ賄���'
<��|3�ˠ���	J�#o*̠����H�3t)���x_Fch��{�!�pl����� �{���B#7i=)n�'�_�����5��`��<8܎����1�
���@5
`�a4�1UL��r��ܝ��>��j:�\���O'2����
�.�9	����"�J<ϑ�~3P��Ͼ|毃��ߪ I�W��?���:axi�r1��wf�]a4}[|�)4�h?�;�^��#�ږ������)[���f܎o�l�����%�}�T&U?�1�Ț��b%.��?\�(��$�`�}]��s���I2�y�1ǭ���nA��5��w����<��0wD�#�I��3�&�I��i�K%��>����3�G��I�3ƨ���(S�>(��(��11r�D�{���z;-og�(̱u�f�3������mi.0i��f��Myt���V��36ۈ���nMwV:������xqܨO��ê�?3 ��t�;�
�#��?�ׇ=;|.�6���9�����yEA_r�c���J����{������7~��>T$m�b��ߧ�?�)�fG A?�I�@�]�}�TҐL=l�1�q�Z�0�o��l����S'|9U����j!ӡI��N����f��i��
c�@x����0���iS<ݺd,߾��Ȁ���-�'_�Y�&�XH{-90F��oB@�sT/�*Sn�À�Dk,k"y��8�B�Gm�U�?K%�2k�R�O�nm;����g�+�|�����|tv�J��t)8��T��mF_����o��n%C�$���tͮg8R=`n�R��2?V����%����Y
��iCy0F����㝐�@�b�\ߥ��(Zxu*���t��S8�Q��9Si���A��Y��E��E���z(qqNӅ�<�\��,z$w�����s<���Lm&�B��@	&�o��-r.:�c^HN�����N��k�c��bX��Mث�w�L���,f��6�N���L�%dE-C%QB�Y���`�F�T�� �4+N����/j�
�`Z�Lp;�K�䟘��L/��=T7��H�2�"��E����c{C����3�����͸EE�%�;6���tu"�
`����yuf��XqTHB*~n�ǼI?i�L)�+���c��!#�댖m�W}Xb=�-�X�2
��`��оq�h�
q`��9���q�

}F���3�e�8ʭ�\��<�z���	�%/FFǛ�qH�(�o7�+������30ܣI-�wԺ:�����5��󱔜@��%5n���һnF��1
ax�o�_�u�����_΀"��a���8�7�v�g�g��)z3=��?\�AZ�gX��?�B��4����3���2UI�Z�)��+�VG�|�����}gԅ/W��/��ށ0�C5O��6����үr�4[�1�J���
�-a�}oy�
�#6+x`smi�\��d�W�~���`R��^/w��
�߮�[������M�%\���x�np���īB~��:��� ��
�~~[�lO�+6�vs�r/d/�n@W]Uܺ)���9��X��J��(+�>QWR�L\,<�2B<���Rc��
��g��\ƫ%���:Ȓ`~�&�+�b�w�zM&���ȍM�7ˆa�G�ٸ���D�ïF�)���R����-�a-,b/���fֶs�_H;GON\]���ޣ��腊�`�ۂE��9�I��Xc֪����XP�W�nL^ȝ*�����szg`ާ*kf�q�={����k�<�s3�\ýQ��҂�6��*Uj��g��߿U%!f0{�'C�Ϩ�s��98cd7�#�p����fׁ ��0�w*R�+LԵ�;
�{fS���ca����ù���?�z���kÓ�99=ȻS~�����.��y9{SR��p�]E�\~�>�h�<�� R6F�S���\���{腝�6/�-���`uu3��W�a%��	@ÑM\��C���/7�e2(�u���p�,�=蔇G);O9Ћ|j4���A����
S� Qt��HH��޸hq-j��'D5-���}���mJ:�f�ό
ȳ8e��
x����g�o?��pT9�����Ge_��RFi��vS8�j�;¢!W/��� )�>,o�4�R@J�0~��	�&[\�!T��zQ��k["h�
�(י:N7���*J#����]�KӤ���Y02����u]�0�����!u���m��p���℆�h���c%sf���)�>Z���|h���Z?��|
5�A��C�Dw� 7�u�.�s��з�q�L�Qc�'̭��]X��6���b�����ગ;��r���E�}����>JE3=?�ߺ_~lUx��k�XZ�TW�u��w�� m�S�b������B��8&J��
�l�ؼA�4��3�y9�u�&�5��em�����rd�I�R��	QQW�����	��W���d
��w|� Ǫ��&;tu�'7�S7u�N@�R⮣i���m}�c�),���"��/=���=�\L�f��\Ƣ-G���h޺Η�Q��^���W}(�p�Co�����=!I���c8 1�D�ʶ��`�s�_�D��y�ţ�����d-�bH��(`��s�?�ܱ	K)Z�''��ĭ��*��`�l�t���2��?IEpnlY˗�j����#\G:�F���Txt�(F���R�:\�'�(<�	������;$@�䮬���W�s
���8��I�I�W��V��	��Yz��"������8_�
��Z{���2�������`���n!�3�=4 D܈B)3fr�����S"?�)Qd��Gh�#���YD���P�˥0%r$�1�z�o����X�����!f��A|�"Ī�j(8mv1u�+�Oy�"y4�i�s��-g��@�:�9ddz�-���_��p�=�P�@�Cce�b����:8`��h�>U�̊�����_��x�X��m�I����!�&�o�'f��P;���r2��x�Pޏ?X���j��OD`s�V�Dho1ז�;7��M`�7D��5���lpC�w����h���������ۯ��U[mCxFOP���oO�I�L��W�V4�|�9�VTn"^nz%'�j96׮jw�:>�y׈rϭB��j�&��m��V]�^;�,<ߥ����"0����
T�����Tn��;@���m�j��.��_T����$U�F+�-0���+6H#N��nQ�Fɳ8����V$w9�X�9S8f_O�K�1��m���$�Y��RԒsb��iQr[*�/ڊK
b��(0�V�+	=dD���\��h���x�ơ���a�]=ߌ�Š�E6�6=x	 n'���@�U;Zv����l^<SaQf�����^��˚.���/=1��2����Z;��΍�V��ہ}f9�� *�*������ʂHx>���z}�9]�pEr�1����V(/H�H�$M­pu��[z4Չ'��'����e;6�LD�wUd���j�R~��ay�]i'�m���Ա�7�G���e�ʠ��yv���C��Ŋ�Tӏ��x�N^Z�n���Q-�LTW|�*�����3��������YO<p�m�qY���Tu���Uuz���Zf��kc&�6��vE��Cz�4;�Z��+��`W')�&䞆[ yS�W,W�QGi��*o�p0�Fõ.߃��myE����RH�?�
gU�ѷ~2y*�
�5rs�N�YW�+��	����"@�-���x��o'Q�F�������V�#�]�vk���$J����0r$r��:p�t��	�}�T��U��+�D#���V��O����Q��H1M����`ާwo,l��6
�/���4N� F�*�r
X�=W���V���E��_|Svk��#�K�3Xi
��Y�������ftV�����ZJڵ�M���L^�"Ƴӑ�~�%�8�E��@�3S?T�✀�zxj�V�M�"�;䛃
���ػdBU��T ����˻�
����d�O-kXw!u���\�Q��S���ŗ��M��`�:�>��}�n�G����+o�i�-I(0%����B
�Fe=�L�}���H.s�F'P�l4�ވ"Āۆ�浢ɆT�[� ��]�E�O\�g�4�{�4K�h�2��/�F-���@�O�7Pp�a�j5q,�qķ�Ӣ�_�6]m��I]��L	���=����%���0��@�,5�XB.�U�x��� �kf/Bҳ|���W)��~�C+V�Ny)��|
�B6��5�*a�n#�����2\j��Rw��!�!�MB
7uuҽC\�oF1 ��==t&l�3�8W�͞��ա���ݺ`��Ӷ��E��*V8o�9OB��[g���Yt���wɍ����G!�P?\�&;Q�
�F"��
��c\��@u���^�l`L�N���)�H~�y��mY wF�q�����u�fo�0�=�Dۺ\*-QK�B%�|�@�d@�QK�8�,�����)X��s=��k񆘢-ֵ��e��8��� �+r �����:�|鳆�� �]e�Zq	����rJt>�o����׀�~ͅ|��pi�'N��!��������Z��[Ů��=/��}z� g�f1��������N%P����d^����,t3��9�T��|�NFۭ]]}��_6�Y�����7�0�Zi��V�z��H�J�:\�.l��>���X�(�T����\�"�X���3�������^?<��Z�7��g\����S(ۅ%����Sm�췑�`/�M����y{|�x��s��9=A7.���Lt�?w�*ɭ��
���8J���61�r�;/̫'�FF�'���uy�Ű\~q�v���j���S����Y���I(}뿨\��~�4���&j,/7�e�)d,iB�5d�c�6t�y��I�u�������� ���S�p�/����=u��r��<k8KUT���zB����y�G�|�X�t�y���
��P��7�ܘ��Xh��z{
g���d} ���l��
�US���� �P��L�%+h��m���CaOU:�I4�.�ɾbk���#��1^25˨�5Y��U�_��i�"+C(�ix�E��EA[xݵ?�������
BX���6+"4}�@ji��M��*b�w�=x2ڕ�O����6ʘmuq�*|�Z�c��VPV�@l,���4e$�G�4)�O���uZ�e����xtN$91D�vT^q�m�%
:� hP^D9L�
u!���H�F�aQ벺V;�����M�<P ;;�ǽj9A��M�`O�IC��`�'�����Q!s[���d��oW��m�rylĥNb]Ο%�pa��~�͔0���TTk�\G��]���A�����x��	�r�����VI!�,'�6�O^�=޶#皡@#a�;�=�#������4ST���TN�K0�AC�Xf���}�(2A�O�謃��ۈ��ܗ!+.Z���Jk�<�xS�qn�σ�!Zi��6����� �a��i&����qw.
���xS��)3,;��;/9�J9�ױ���7L�0����N�_Ȧ��q�Kа=�&��!�q{��^��>.[����
�R)}�@��	u"���q�'^1��|F���P�L�����6)������,Ȓ���(�ً���_F�u+��Y1���g�x��T8؜ߓ�6#A��d�|o�o�!�a@��ۤ�����:�k���q���*�!�X�2P���Φ`�|�0�%	+�.�r�����Ԓ���gJ?��#�)��aT�!&j:��mk�+c��:�g��w8i�������}�K�zJx�蕕��P�V�ׁ����Q"���-f6Ǟ��]Nz��.C4ig�`��B��A%���AוK�5��ygE�^�v�q���]���S��>�Wͤ���k����|���ȬQx604�Ti��0�>��I6��?h�մ�n�<9�_���qhEm���L������k!!�'��A��1�����?�UF��Q�S�'2bC�J��/�k2�,�b-[�)�,s�!�飒���jk��m���H�X�h�k?�-w�4u�z�C���0���dp��]T/����G�{��(���̤�k(��`?_���n��Q���d���ͽ$+
�P�nh���"f��&�T�O�C��oN�S�`�(:L�	��Χ�ȋ���:�B�J���^U�����S,qp�J|6/�>&���3x#�
��O0�����d�JK0Dt9�/�� Ud�?I\��ߍo�����&d��L��� P��Ӵ0/�]� �7�.�3�_m
���뗡��k�����%;���[���gO�&~u������G�u�)%z3��}@�>Pt�DΎJ��Ų$7�����n��=�9��L����$)JlE��3s��+v�;������8�U��T���b��Sg��~�i9�CK�X�T�S���w-��/Ep��]�c7�y�-�Y�qr�V�� ��NQ��1��X���f�84��s�&k���"�Q�ã9K%AG�ޒm���s{�Ƹ%���uT��ert�zq�(��� �z����6����C�����]3֎���n����s�?��or������p�*�<ú�6�*`A������I�:���A�ǳ߉�96RVSV)�#5)s�8d��#�Jb��h�+�Se��4�kT_t�a��1����0�B�o���:Ꞻ��������S5��GIѻ��'�-ߒ�ȅ�޴���(�8��'���HBg0�4HH��X��ƏZW����F���u�<i9�����7�G�Uġ�㻙��[��i�%^��&V�F����;�Vk*QR;͹��e5)q�y������ڽe�V�N�*�c�&U����l��J�:�-���<�>]�v�`���a0�~ZA�`7�enR
�T�&��{Nr>���E�JH1b]i��a ���0�8NY���g�M�Q�Z�r�ٓ��SV��m����T�
��;.�d��ͅ�ƥ������������+_��Z��]A���@���_�k��
k�����Z7�|�Z�:����L�H�d�A`���F����cݼt�a��	����bY��y��+������h|P��&��ѷ� �������P��gߣ�_i���uz��`,e��;��o�,t6�*�|���+���}���q����O��z���B�Xĺ1w۔늈���IF���j�d޿��5Ѹq}�z�.M�*��Y��-�� ���[`K�<[�+x���X��U%>���0]��y��*�� �'!�@B����
���H�a"i�[�%�w��������^Gxj�o�h�c=��d����b�斯N� �(�pL������"�x�0@�a:ΘܨW��+�W.=�Jw���M8+��Ts�]����x��<9
�By�"����K�:cgZy���O�art���c|S��5��S'V�<�zP�@�$�i��@��Ԉ�^�R=�;�Oר,C��ӓ��Iv��W�iU7^�H��J�5ũ�+U��{�Z��Ý5�yZ�ۺI����W:�� _LIр�������"�rqF�Lͮ}1_��?:�x����jk��/6kL��{J��)pVL��h�V��u���*��QU:S�+���`��K�̊�Fe�-���j��v���}o6�Vְ�;F��'�s�
�J3�����:ב�TL���` sըTU��H⥕K�*R�?}DE���O��s'�Χ�v���^E5��L���]�浻���^�<��zmC^�m�R�E����_����{��l�F�x�����^�_��"r�c�1�S@fF��#9F{�>[p(�YK��L��{ 	y��|z�1Jh���ie�U�	-�|Z�~&� 0=�<���eEC+D�dl��l�����C��z���
/���"����-�j*�q����Wę�`]h�&�gP���+{�羿OSZ!�*��8��==��9}�
�O�3�a�{9�.$w0� $�!.P��9߲%x����Ԅ�q�I�{C����V����yq�jDMG��E��A�f��p�v�e$,fuܬ��[	�vj��ɛ��=�9��q���"J��&��?�S�c!��e
�e����a�� �[�ԩ�ڜ�v�u�{��m�����X�[ҀI�(t}�����e+����'�b�:u1MRd�m�a����T�)m���C�/O��|DQQ�;�9�.�oC�1��_�v뜣i�]\��U 
�΁@����,Nwf���̵%�n�����k@LƊ(�z�R���'!m�UF�|ޣl��%s�^z�a���d��k�O�n</׺��
��h�>a���+{.#G�^Lt1:�Yx�u��-���j�����^�]+����,�ɸ���q�R��`�o[��#�s��V���Nh�0���
[��Q�ָ�/7�WQ]��#��p�t/U �2K�?�Ӽ�����=M��umCN	�U���E��[�2�|d�~��4���s/�EX�կ�ӶeF�5爴b��	8Xb�����E�{��B�y8�0}o��zs<W[T��y� �Y(�_�uװ��^��9Vs�@Â��Ϻ�'#��K��
��Z��54� ��L!�������)�dH}���j��պ�����^����#��
j.*U|�$�2��5e���h�,¢�U���A�I&��(�-��f�|Ƹw4fBb[�]l��[#��K��c�!��������+ػ��d�6�{Ġ?38�r�W��[�I�6�5 �7Tcl�m��@j�} A�LS���̚�)X���n��W��L���s����ܠ���ZjY�x-�|&�����J-M��X�깆��}v��tI�'��\1�
/ 2侭V�2ů�	k�"�?�GY�y��R���_'K����������PAW�$��u iG�^m�.���l�|�v�0�_C/IE�I�Jd�ˈ����8�@V��Қ)�e�Ś/�R��r�$��=�[�{S]m��Mp#Sa���B�1��j*�oV!��cQP�/Im�����_�l֫Կ�e꛰k������@�S;�݉j15�jщO�J�M��<��VwB1*,�����3{�X�CF�Tˊ���P�v�}΍����Ԇ0Sj���":,\�C�$�;�#�ڶw��d悄��{7#@'���j�YU6Q:H4q�1�/��$MT\>��ºX� �{�a?;z�N�O�jgؖ0����XC��`=l�������N2�T%�p^~��:<�w�_O�9)�q�����T4q��Q�-��:UͻK��ܵT �rM��d�lU�> y���g��^���e�n�}������v���U+���v;�}�l����?ѿ��KrB(<��>�8�"M�Ƅ�3)w�ø�͐�Mǯ�xs9�A�e�:Y��a�:���u��9)���	���;�_6o�Ɓ�>)E�C嵼�r$
�`1��AES��,_ʏ�3c.��b7n�l(l�z�:�����.�4����p��H�ǖe�
�[��)�!�7|����҃BT�]C�9��"[��@�xSgj�y�.SR��A�[�bz%#�H��P+VBԭOs����FZ}��pq�h�p��y�J;Q��b,�ì�94���?"�,�'٭'�z�f!x؍�Y�$}�a|ͼ��Ӽ�����>m���ťֲ�M�At�^����C����I�W���A1�e�J��s�Iv�[�i/�p*1Z���
a%׋X���