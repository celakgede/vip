#!/bin/sh
# ===========================================
# System Request : Linux
# Compiler Mod By » RMBL VPN
# Telegram » https://t.me/rmblvpn1
# ===========================================
# Note :
# Please Do Not Decrypt My Script!!!

# Path ke binary direktori
dirbin=/usr/bin
# Developer
By=RMBL VPN
# Temp file untuk menyimpan script sementara
tmpfile=$(mktemp /tmp/script.XXXXXX)

# Key untuk decrypt (seharusnya tidak digunakan dalam konteks ini)
kyh="Menyalah tukang maling🔥"

# Encrypt dan embed script
# Pastikan shc sudah terinstall dan tersedia di PATH
shc -f "$0" -o "$tmpfile" -r

# Jika dekripsi berhasil
if [ $? -eq 0 ]; then
  umask 077
  /bin/chmod 700 $tmpfile
  prog=$(basename "$0")
  
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" "$@"; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile "$@"; res=$?
  fi
else
  echo "Report Bug's : Telegram » https://t.me/rmblvpn1" $0; exit 1
fi; exit $res

# Script asli dienkripsi (ini akan dihasilkan oleh shc)

BZh91AY&SY�~� Y_��������������0 Ɛ��@ � `]�u^��������w]�����x��F*����h�҄��� ��1'��5O�=OS�2!��MG��M='��� �H2   I!�)��'��mF�4� �i�� �h�d@� S&����)�����z�h4<� hQ�h   "��0��6*m=��=5=C��=M �Q�z�#e=A�l�� 4��               �H�@A0&��2)抚~�~����4yM?T��<��SďP�����ʸ|
qa&��>�}��ኼm��0r��a�=L��-�g���ՙ˅�/�Q^`��oH��i`s�M�u���vLge�5�bL��D�t;Z!A��9UCP�.։�3�x%q,	�c��T9��h��X3@��Y��n��H��ӷ�&�Z}x�'�foҟ]M�Y��R��^x]x�X7�c����c���a٣�����)*m�J�3.l�4��K��w.~.�o(I �p���S=�58��"��� �u�;o�<������y�Y%_�d���F�xM��䜙񶖖ld )1S##ˋE�zPKS�	��B�Sj��ߡ�pY��yi��k��j���Ӷle�$��gw���;�ږ��� njC�p��PT�5�5�R������t&� �+��'�o$�8�o�I����S�e��yWYX�kb	!=�Q�9l	t�q�w��{�/��0F�r��!�A4ۑ"��F_��(��X���P�Il����&:�Ч�PXu�#o��0�P܌�ee�̚�B������h R����Jzq�_cf�5"��g5m��CPL�Bk3�+,������ZI��ڿ�ߺ1��.ń���b�F�]S�KPW�:X J !DDD��Rk� �d%@As�N�d�G�/����H
���3��?�ø0���Z�'��V��*�q���s�if��A�wzJl2�]�ףK�������v�E��*�mJU��b���q�r��jؠ9����B��^�ߥXO�R�Xy��3� vŭ-�w�%Npŧ��7/��E�;� � O��]��5N����>z���� ��nJV3F+T��`ۧ�EZ�=޻�����˶�$W���3��Q�4T�]�=���ڪ[�!��Aԑ�&l6*�GЕ�)�m�o1L�D����H�Љr�m�!@���i��U�����y5�K�䯗��y~܅h\�Fl�.�����!�d!�&��(n�H�Zf�!�1.	�ʉ^�hCBZ��vT��5G;�M�� ���mO�,�1 S*��@F�`����B���?tP�!A�?�o,��}�6n��Æ<��/;n�A���d-h��bIc���H��R��Z�z:5S���������Vj��P�k
���i5�D���@3���i$��ĖF��^2�0���ќtZ�̈-��Q���1�6Pj�``�0���d4ĬgH�q�B��~��N���UEUUUXA�"Ȫ�UW�Y�>몝�	�	�>�J4!��^_|;z(�M�(����	�#�6*�}b3Fs�t�@��+.{B土Fۨ��R�A0���Prtb�b��Jj������iIE�$0� ~?|�U�%�<3s�m��$!��eq*h��b�R���Ɂ�8g�W@3�<��� ���b��	I�T��.PI���:���T*fo}e�I�<ƨTaT;S$��FE�^�}"�l�³Y(	$�lD�D�lּ	;�彧LS�T7 �R�2��L�N1�r�J�]���S]u�Q8���S�1���nF;`ҏz��I��
{�����H̗����L\�Q* `�1�4" ���5
J�L��0��U�tD�]����+�-r$���T3\��]��/RSbIo��n�l�Z��$B@w� X�tz�6��˭��ƒ����jok������:,,)�� ��]c���a2�� `c;����+-�E^� Ձt�@+��z>눝�3�7pb@`a��K�1���gV�7��֗ߤ�i��8DʈTҧxL&ʣ7R�Tc�ե��& `�ӡ����d/5��ւ�p7\i�`9-�S���$"k'��Zc��8p�iL4�殥;7g�6��u�J��s�y�;tT�śX锕���)Ŝ����r��ZTC���L�4�jD�A�锲�P�����5Q`ׯ�BE����){���#}&�F�6T�K=�ٺ.��Pee��|����?��i�.^6K��:k�^����v�j�Z�؉p�[{�c��a2q�+d��Q��Q�`��]�b(O�jD�A�V�Z�����r�ps٠�M�{�����e�kB����6w�<��)�#l�q��C�S(l���V��sB/X9���;�X�|�^�r���Z�0G�*�f�1$I���*qHY�[ܲ�{5w|��`��4�|G�
<n�&0c=���W/s(Zl����`�"���T���>Q��~N��3���%es��9���5�/��C2^we>v �/��g]o_����>&��5%oI���kp6�;"�=j����	l��z�c5v�Ip�79-�Y879��Z��x��H�$��!�!n[��su��֭TЏ�=������,�z��Lw!�8��p��Ǥ���rQAz�H.D��N���F��%�!'�f�xj>��A6��lA&��L��U�3Jg=Z��YcJ�3�&ۢ�?�d�k]���  <b2>i�B�Ґ66X���&T�9�`3����3��"��)3��o����(��z�	�`�4G{�nvND
�;*Tk�c紅�-/��N�H!	�{�/�L	��J�"�m�4�!��rG3�J/�VL3�^QG9���|"{���nsV��f#�CuV<��g�h �!p��JѐB�P����r	�c:��4�vj^�Ѡ���WC
W9JL������1׵wRh��a�\lm��Z��	l@�f5&u��jW�Q>�����H~3V����bE��Ve#ϳe��Qve?93pd^K�E�?@�
���s�3I�f���d+���]�n�Ҏ+N��N�|���52��_9i����"E�is����Ώ!q�p�Cm���~�8*��G:йC:�s-р^^B��;(��Vd���Վ��*���۱iitV����wR���u���h�5����,�.c��Q#��"�@�l��=Fy�B�Uk>"n����j�E�<$\t�\�x0f��I�5�כ.�j��Nƙ����B�&P���[w��]�R�YekZֵ�Ns�`x.^�F��@nM#�7"[4]��cWo>K�n1�����#FT��a�Ci6�63����B��7 ��z38�P��_c2�
�b0Y���
�F^���ʰB	#j� �v*L�0h/�A ��VZ�)5%(
$��*@�F>�L2vi�y���b��ޠ�YȚ��a�4�1���"�P�6V1�f(�O�7%a4+]���5��oN�R����M|���;�u'g2���4k<L+=H��we�N�1�o:���&S$�I"��3U1��`XTC d�`rQ)��x:�̼G�c(0 c��X�+��m��iݧ/^e���cŶ�m�����l$#!�e����� a!�#{�v�ZY:���s@ uw�N�(��+ ��`�0�SJ��:�d�,�%4ĩ-d��s1u\���A����9QջR�2�W�f`iC����wڬt�'P���e��2��[��w�+T�x<���I�m��q�\z�3�T����#*)���i{$T��:�XH�]i{J���J�@Ƶބ'T��7�Ũ;���X��s��Z	����4��;���(<r۷`�0���6�Wڤp$.��F��S��~�r]�T�e��U>��ajW�9�4����9Ck-�ێ]F�̴L]�*A����Ea�Q)pL6[��&kc�]�E��[�Ѧ���A4$������0���a:ڱ&�]�u-!��b4Σ|Wm2f�������$#��C&��i6h3M�q(��D>�c�����v��*>̀⽳����>:}9W���}�#�d�!%q �Yp��Os�T?E@� "($�H���� �j�$O�`��*
�����&D�I�_�w$S�	G�K�