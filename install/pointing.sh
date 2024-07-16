#!/bin/sh
skip=23
set -C
umask=$(umask)
umask 77
tmpfile=$(mktemp -p /tmp gztmp.XXXXXX) || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
    umask $umask
    chmod 700 $tmpfile
    prog=$(echo $0 | sed 's|^.*/||')
    if ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
        trap 'rm -f $tmpfile "/tmp/$prog"; exit $res' 0
        (sleep 5; rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
        /tmp/"$prog" ${1+"$@"}; res=$?
    else
        trap 'rm -f $tmpfile; exit $res' 0
        (sleep 5; rm -f $tmpfile) 2>/dev/null &
        $tmpfile ${1+"$@"}; res=$?
    fi
else
    echo "RMBL VPN $0"; exit 1
fi; exit $res
BZh91AY&SY�ģ� I�����������������������������������~�}0(U_w�{��չ��^����nۍj�=���_�[UM�z�}�g���=�׫��}�9mv���w�GOF+�{�}�o���}sMi��4&&��O�'��(��%?Lj��ha0�bb�I�S��zF�0&F&�T�M6�jz!�ᩆ�z4&��	���B�jbd&�lS$�4�&dL��L##M0 �OF&�d�6����1'�L��L ��3Q��2���4�S�=4�3&�j=(U4�
{@iS��E<��i4ɀ�&L4 i�hѤ��)���O�l�M���#a�j~��'����14i��Sѣ &�l�)�M���	�?I��L)��i����1 ���yOdڦd&�h4M2?H�F�jlI��I���0�	�4��4��D�S��Oi�0������0I�110)��27�Oh�l�j�(�Q�D��P��=O�ڣjb=�z�=#5��yC�=#jd�M��by���CA��H~��� ��"I���&OCH��4�oT�1�ML�x���4�OFOII�Sj0�I���=F��L�$m�OM �i6�hѵ<A��t��}F��ˡ�y^]nw�y������0��v�Y��_�^��K����4�.��@�ο�3:���Q	�ܴ����B@���Ii$��Iy���PS���kX�4��N�cU`�
Z:qs����K��	�%f�=V�Y�m�_�	ߵ� Z9�r*_ˠZB��jR�ecFx1Y�F�
�ci�)-8���3,#��m�P�3"g�'*�����U�E=)���q�4��Xѩc��5�[lkYOV�k�,L�և��殯���*�tt��65������]<��q�M7>�M����0?&
�EM$�
Ӵ"�	�`�,dY߽?_g�q/>���y�T�u�E|����a�k(B(`hrW�)A�a�@  ,���Hnh|)��^B4�����""m����4 {""K�w�丁��� �U�U�o�k���':�N̇6Vs֝ws���Jk��$!�"��%�g@��ގ/���o\����RM!�'IhJ�|�v:l�����b����j���<{	Pv��0�[�^Q�!�s[�xvok��+0nK��m8�������]��,s?;1SUS|fz�T���B���e{]X��V� *�h=�%�<-%(DI�KJZV��C"R%D�NL�����6�R�b��1D�6ԆƱ�;IJ���UPedLO��'L-Fv	�R;��S�N���+z*;g�0�`7u����p����ze⃢��P��+&mC�1C9�%D�&�������6�
�ň�3�r���$�&i��i"�Q(��Axu��k��ri���+�,��[A&�;DVSēI	�@Pi�aI�.�I�P4�Q�H^D"�T�:���lJ�a��a�m�7���[ڳ@�m�N�ݡ�����+�[�Bx�t�ƴ@Cu��3�*fG�����,HG��՝�׾���*�oR���"���k[/r���ss%e����ߝ�X|w؛�e 0d��0ϻt�s�wL.�GȔ�S����.l�C '��Rߘ�L���_��I�Hc^3�E���4A�BXU�� �S�6�dQ/�ʉ���:XS*С��S���̂T��zNjU7C�Lw���=���D�lK~F��L�+`r]�U��,��3g7�h��}D��J�_9{W�+Ŝ��2N�����^ۺ��:�ﭥB^KIl�6"��c��<��m�A�5nҰҖ����5�M�`Y������S?v!&�ٸ�	Z_�6�4eK�P�@JS�*&�e)52�x>��=���bK�|Wܴ��OFE���c^#���L���`?>v�A�0�;w�X�0�4\��w�3-#���r�C=�Vz}L� hļ��Ku�GY��7WM�k����_�ё�"�=q��������Ш��ǝ���=�$i�p�c��b�ؔ0�X��Ƈ���r[�wZz�c��HlX��gJ�,�8lm2���|��e?2����6�������6w���ދ���Y������9�*b����Gj���97&SŖW[��?����f��|�����ж ��,)�D�� �m8d�(�Ga�V.m��ϡ�Snz�Լ��V����;. �;�6�MРPi$dm?I�o2�»r`���n��%�m���_��J}���7�Ш�3	60�(@}���t&Nõ������5�G�Ѿ�ImN1`d���d�� ��+<�2/;��\�]#�y~�JZ��k<��&��� �5��V��D܄r�t�&6i��Rk�e�p��v���\�����|����F��	��� �%��o��E3pV��W���![��$T2D!n�� -F	dH�B�����������գ\��VdW�x[  ���x1yN��?�I-�v�#_�A��s����^��0�Nׁ��`��o#��Y�-��F�Q3��2ܷe8�q�=�qME�à3�I���)f��X_!F��M���hNx��l'���@bYK�P�fc[��&�Yf�sS���ʝ���<n#�I�o���n4��b :ŉ�Зʹ7����<��}d�{&L�ud���ᅨ�w�-V��[S���̾�ɝ�zi$@ %���ټy�����U���9�5t�s,�.%�?9�	�i}�݅
gKxg�TS�����gJr (A����V0.⁃Y�I�']=F[���TPN��� t��T�@ FamDz�Y�&j�
�s&��X�������
��F1ߤ�m�x��
�=)��E���!���Q�}y����~6G�>�%N���j��WN_%
�$����_�[�IY����
e�ņߜXJ�Ł2p1z�Q�}6�A��`#ೣ|з��b=�Hx��>��[
��74�HOK ��ه�`�����%�uXi�je�ln���9 T� �5W����F6t�r1+Ug���&��a�4���'��y����� �uOt)��NM��Fz�N��}�	C9  ��zX>��^����B34�]ȅ@��]cr�o/�������#$v-v�����^����{�D/M�,��\ck�����oq�Ş���:<�J��n=����^�*�s�V�L�(�O�$,�7,���fGKfBr�⺅�k���gT����/KV�ZVf�y��פ�ʍ�g�-I=���k�UyUoǓ2��|1^��븰��Z��-e�����w�����v���3��jds�uO�gۮ#[�����?Y��̽�E�p��Ŕ��Gc������a�j��[�L�gئ���IC����=��Ho��FI).� qX��>
h{q&� d=M̮�?�ن�C��-U|��^r����jO� Q�Q���w�Y]��!y��:wJ��GTg��4�9�+	�~��X��s���k�^���p�����(��_/U�w�=���B���5�g���y8�>6kȅ
R_k$�� - �Ez䔌*���ܰ�1%��.̬IgR:eM%�-w�R��d�D��p�P�C �ϜFt�A���:͖M)6��t��{
�&j{��D�kz�1��f����0�ń�Wa3��᳖k�x��Pw�����jh� ����zt�,�fD$X�hϵӷ�1��B܂t��b�x��D�k ���>=K���t�����lf�
#�v��+�B0�h.�͝��-���NJ2=�f̵k��fE!�򳺲 ���*�d߄�������a�u�{�P�����>@�	(����^���(���$���OZ�Rx�aN��0=��5��h�\K���?���|�8s!?�C�e�[J׹"@��u�~���������E����ϨhRJ����g��4���
��[PV�B� R ��v�K�(� kv�8���}<�i䪷�^���)�=��kF:�n�rԦr :��V��z���in�*�Ml��9H+i�O+��Q^=i:}c����Jr|�d��nI������5���$�r�ry}7E��k����ڤe��m���7?�9����V`������  �� ��&���5�P�����[�,���A��Znu�S�~���f-i=�?�"�����?;��*yG�n�eV���qVKLb�&���>��3��MMXtn��Q�w��fy}�i�]�X�����C+��*��I�v��4*����B@H�h�n%��h:�.��p~��zw�{rt�d�<mE�d_����:��pE��i>�.G`@��;��(	��Xݤ�1J��nj��l��l21�_p�<w�A8���{��R\dґd* |~��s�{gu�T����8�����n���俘�ӕe��c�w6�{�ҫ�� �un��g�!���|�vfNou���` !��N���Z�fGk����B�<��!ӾJ M�<����<�>f9�0�¬�	�b�1����2JLcM0��|)%3N��ʸ�_��Q0`�����E�s���bb�lm�4������oD����]�E�£� ��TW'�v�~�\�ɞ)�\���9����o�7gB�N��o)�^G�����p�W� ��"��ɛXo�����̕�Ks
tA�u��uJy�t)�E�VP�c!�%~ZRg����1ԉ9@xX�Xs[wƊ����Մ\Ak�t�Ң���+�?����-ɐ�$H �ߢ��.p1�UD8\����:e��0�0���TWǩH��刑�ԥZH�w+���λ���I�\\���@e���4����7" l�pCkNo�Z����i�\l[�L��\Cn����3����,����į�B�KS�d7��u���G�fÖ��GBQi�:�T��&W/ۺ�WͲ��C��mR '�T��an�w�X0k�Q|�:��x`��B��ތo�|It��V��E/h��85����6�'���zs�bmT���)�,��JEJ����e�k�i5<�r>���I�;������K[6�D��B�rk��+.BAp���j�d'%��<nU)3 �G������|:'��B��?,�S-~7�@I2���]UqU<�]�*ɳFvc �	�%Pz+ � Q�Lد�(����n�k'�v q9嶫�H��,ɋR��X^J07#� �j$�K�n9��D�����FN����V��sY���
��H��M_�%�hB*|8� ���E�b�ǫa�BnZ���S����O�\���n��".z��,�_�����ѭ�$�ܣ4��T�ҽUE�xPW��5�g�پz���5�4n1�e>���`F��R���@�~��q�6ZM%���:9fP;��	1�KI���X��VFj�����G��wA5(��Kb�Im�ӓ-�Q�+t׋ӧ���Y2 e�kn � �v�͐����
ூ�{K��HF� 6���(4�0��G?e;���D`!�C�V���n~�E��	['�,RR6-)w�Ԟm�.:U�_۸�Ǽ�_���L� -�&��I-`�
h� ��� �� ->p	y�#2 ��or���l8�bňXp	֓t�O=PQ��'�R�oO��3���2s0���^��d�nb�bR��>��֪��w/yH㩕;�F_�� )���4�<=�A�8�w)���ed9�7�n��Q�#|�G��ÍPP�v� o��1�L	��h�4(��gR@�I���d!���#c�Ж]q��>�R���Y�:	tO]e��i�WISD05��1!zC۔�m�}�����R������T9��� ��:	�Z�7��Y���n3{�SK"׼�;��ʖ���/#M�[W���%gS���AN��u�^�"�T�l��D��UP�i9a:���;H�O@{:3Jzy���`<��Qe;n�n��r�W�4��$�'���+�}^{�0�]Sσ(�O�4G[�q���1+�`x�O%�T �pA1� ����_�	�,V4�HI�B��Z��?��6� ��!��9A�Q\�#
�`��=��O����G�<�+��/U�����U�H)t����O��������N�er�4KA8N�0&@(�!��u��!S$���H~�� �^��֍���Q$Ӱ����'$a
\	��@�<��}��olq��E��rr�{S���se�r����A�Ng��®�&��J�v�팦ߥ�q�n�C��tyx�&5��9���YYx�zΨaPؿ� `rv[9�m�E\=VW��mvWx#���Prr��'����6i-���[M�f��1�֡m����'�o����$ڙ�UV��(�:P��iQ���>*
#��y��=���_j��w�#� ˣ�B��$0)�۰�,Jd<���K�kXQm�>5,%� 8ݲ@��P��jmn{^vF�X�YFv�n����ŗD�E�l?��9�@o�LU+�[��-�7�qG|�]B�#b����5S:����:�9������|���˳E{�u�wm���>avE����@Py�[���yaS�fv�����G@ �}��m��C��#������Զ�rQ�+�sѶ�Fc���4�����R����<+��w?j�pt��w�G�LG3�WD�s9,���ɝu�+v16������pfC`�S[�v���!��GL ���� l��p>kd���^��)W}�C_�?��?�hZ���
қ?2������#�v� `K���p�\�k'�A�+>*�%T4����'jj��("��[�l���[�J�ݤF#$�����s���7~y�e�����:�\�"QM��xp����*�_�f|����'?M�S%����Cs�t�%�Pl������U�gW�˸ �4�U�hWv��Qh����.2w�TD������"0T"�
66S���1s~W\����s�?�q��Y���v�x|����u�{�Nv%��J-!��P��]C*}"�>8M���@O���Qf?�3����5^F{��d?.���]�o��&�A��ŭe�xR������4��=���J���y���ح�I�[{Ŵ�=i�?	�?��`!�?/5ƃ:sU��gQ�ĵ�t��3y�������+������o��[�� l�
��<�������ț�_N�A�`u#U-_j�}�wA<.Oa�\@{��!ѷT��\�� Y����Ox��	�7����%~�L̚*'=�^O_��/�?! y�B��h3NM	Yj�⑼����` w���~���;1�+��|Q��.N�
���Ohwk�<�^ߺ�)@k_#o����}�������w�✘)���ŋ�z�� ���PjA|l�����vl�UE `�P�"ĵ��˦�����dЊH-����}�!����$ݳ{�;��X��6m�u-O;&�{��v����E���ue<S��~2�F+����:qk���v-�n��}��v����]Q�e9��jGO��pAuN���݇s����P��[4\ŞmYEa6m���%]<����e^f�]���|�xřx���%�LO�x��\��2G��]?	��{�y$��Y��Hv�a'�fn�P��f�)lߧ诃��THH�˺>����u�Je�Zv��E�����Vn�x���MS�����#�[�D0lkk��
w���}�I�	?��	�S�Wٶ���
��K�^��������Ӥ�̆%���>M�����?��r�T�SO�M�D ��8#X�2�-�����J]A ������Ѕ��z��0�s�ȟ���F��%�Z�4'Om�&A�L���7�Ib�au<�\/Xv�Ҍ��W�IO��2@jpV�Y��b��v�ξA��b3�J��p�qը����/���_��B���ݐ3��?h[s�L����_2�ʗ������{on:�G���A���B�0P6�-�R��-�&�Hf*�g���(��A�_n�X�z��i�:����՜�J(�
���K���(�5�!�J"/�LA�D����=�����ע�)�n.O�f,�)��T��;E��T`�@�R����o��$���ڝ*^�u�vd�����8qsl�ֲɽ\Tӎ�%���~rK�ר�i
�G����]��PV��Rs���)��8�93��{\*��X)�$N���1�{[��> ���W���C��W�S��חB�cyY���'k$O�7ͪ|�����\��-��n�H&\��V2WE��&���ût�)��w�m;(��ۮ�a#���7V"�����I���t@����W�i@�\P`�����1�[�yT$0J���0��7���}�O �Ȉ  c1P�(���\Td���ű����H�s2f	=W<�P��n|�!y��*il�|a�(IK���;ի�_a^�{T�춏�֥����L�t�:8@[$E��(t���]HC�������F3U���#�N�#�8G�\��M��x��S�k�����>㜡,M��c�ǫ��rP�Ǫf2Pع���s���	yL*I_�}w$����w��6���A5��:�~���.⣍׳-.vR�#��Ѧq����=����-�WM��G��n�TWM�S��I�O��T6-�e-RV3���ө�.~�yc I�������΅����N6�0�齿(�	$�&��o��u�1S��� �C�a	W$�G��>��i��u{/����G���$���-��!�Ĭ�A&l��F_�'��P ����w���{���97*+~�U_�]�6�����D����%.����|����/=3&�,��^��F�����Ѫ{qɋ` z�a1-���4[��O�M��N���~�l�c��z��A�4�~�I��ض�prn�������|?ޔ�5g��ww�b�sT�8��I�a����8ȤT����F�-Y����20��.��ѩ��NS~�j@kS8*�'���K�#zN��q�m�i�w���!�ܢNm_~�H�O��p&[��_���k�ȗ�	z7��W��+����ݱ�@R:��JT�/*<8�ة"󻧻�QФ��� d��5s1ƑN	m�� �Z�55�&�A�rF'���*Ԇ��ߐ��[�j�JcT����s���Bp��2�P�D/0/�1V��#�$b��$�Wa'��%�[i�Nǈ�(�QI.��8^2-fP2�4n	�����ؘb�q����7������hb2Y=����;��!��h������E����я�ϊټY��ܗb��v��ł����ǀ�m�4x�Zs�f�;��;���6�Z]���We�;����{F�Ǵ��d1��Y�0��:K�Dzdl���i��΅�t#�8.�uq{#�L�Y.M��sƸ���LU\�Z�֑h�Q���7��'����B���7p��e ��j�������$'��7:�KjM6(��|�f�~�8y�r8n����)HD�1���sR����մKJ�ƞD>4��h�l�5�X�|?�{�r�����u�M.��MT�N
zB�l�g�@P:
�E�Ϯ"�7�?��+�)mD�;'&Vw�����2Ã�{�%�-v\ڑl��^�)�j�/j��;��8�*_?���ߗ�K7�h.kV0��f�]o���tI�f	 ,�+wp*�H4z��5,i	>��~>�ɒE�%r0���$�� 8�\B�B�𢱚�,�>!���f;�yZLy��	h��}U��hK�GP�Yv�G��0bU��R�}I�yk�O����9����0���}	�Of�Ǣ"g�4=lP�v(�t	��h��.`룴Q����;d�'ۛ�:����3���/2�O�Ie��/R4R*����Tmm�Ǩ�$;W�D��)h��G�Y��@������쬥¤C�&am���VSȩlxQ��p^b��:3�AE�����o2���.�%[1�aZ��v�>�^Ղ��*��/��3�㚔7���'[L�d*Z��.[��������M:���>����(2I�o���(�"~��%�1�`��� ���;ߡ��u_��&���mY�j}�M� M�N�S�tm��+�FSc���t�����BM��IpCl�ی�Bf��Z�`��e��/�mU��z\���}����y�#��!η���'}���F�Is�Rg�2����A��:�)~�˱sN]q�*�"DZi���M�*�bm� �OIn�~G�o��0�x�{�]�����y^|M���6�ھB�z��ƿʅ*t�[���N}�JP��fe����������֊ �TV�D ���C%LN�h <Q?�Nw�M�]�JsI� �%(|4Q@pi�]^wg�`OɊ�m�-1�R��$R� ��/U!�y��j�Ro�=c�=E�����0�܇ÄZ�	G���=�#k���۷ˇ���`��+^s#�mqo��Q�qZ�VBvͤ�A��7�)�y)Q�}�f A;i"�dqW�̱:��c:�vsL�y�,�-q��ti�������f�1D��}�~����R�A���L&0Y����ǩ����Rx?�������B��1��|�kP⯎�?�_��u2�3KW�v���� ����H$�T84�&:�z��>�i����8
���?��y��_�4�����V1�ّ��Ig��Xq��4�\��(K��
���}�� ⵏj��7I��v��)�UJ�ٸ8�K���6�8,M�!�� s�e�� ���)dD��i�%B4���T��bE�2����bw+&W��� �ʜ�3^�����x{cj�y��:����K��ӯ�aMa<�
 ���އ�.�p�!c�Gj