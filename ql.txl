#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�[��aql.txl �U[oG~���	�ă�\�D��!uP/B��6�����f�]�6j+���6�-E��8Vi��Jcs�1av�'�Bg�	zU:�0�w��3��9"y����c��[Ao����gN�9߭�9�0��<nֶ��5��h�ͳC����L�(��*"Bș[����Y���9�o���dY~�4q�L�A�,eX,�����ML���M�kN9���a����4�JPD��L^�C��a0{{n��3��Iz~\{��/�7{�`5��'_�Dn\r>W3f��$�Ɓz���3�b�@1��a`Yt�݌��L�0tLx������7"}7\��ί���76����]BOj����v��sB�$ى�H�D��O����V���@��J4����Lc�7���o���V��#�Sz����%���r:��\�	�9)<�̚ZXE���s�����_	��B( �=#�A?��2V����J�����z�^�B��^l��CTH�!���bcX%�k������Q9��=�B����>��oֿ`W��zη�/��(䨱�����vN�T����ʗZ�$�J��uʤ�wk鬬�d�ĳp�|T�XB�/�^9�޸���͊�ZkV�nF��ZM��u��d5V����m6��P���$%ă�L2wiEdH1��:,}�QY$����-�3w�hc�8N�`@�Zd�t<&��n����a)!�0��,��(w�}0Y���Yh�Bu��²`9��Ѿ�",�E<,>�$S�X�,y�������l�qJ7;E�'�\�Y�A]}I�O�I�*��2EE�t�`�B���p���"��;��byB�߾x(؁C���������2!���#�Y�p�󾼯���!�.C 䙼�ptWh.���_5�(/�A�h+%��d^`��bF{����+�lX$]Py]]��oZ��Z5���oZ����F�2��y�o7�0�����	�*<j�sڳ
�<��5�p�|��Q5�n�qoQ��\C�iM��.��C��=D��v�w�9u�%  