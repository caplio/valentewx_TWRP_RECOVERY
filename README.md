0. setup CM9


   http://ville.giev.de/?page_id=170 を参考にCMをセットアップ
   その後、カーネルソースとデバイスsourceをダウンロード

   $ git clone https://github.com/caplio/valente_wx-ics.git
   $ mv valente_wx-ics kernel/htc/msm8960

   $ git clone https://github.com/caplio/valentewx_TWRP_RECOVERY.git
   $ mv valentewx_TWRP_RECOVERY device/htc/valentewx


1. overwrite TWRP to bootable/recovery

   http://rootzwiki.com/topic/23903-how-to-compile-twrp-from-source/
   を参考に、TWRPをbootable/recoveryへ上書き。

   source: https://github.com/TeamWin/Team-Win-Recovery-Project/

2. build twrp

   以下を実行してbuild開始

   $ . ./build/envsetup.sh
   $ lunch full_valentewx-eng
   $ make -j3 recoveryimage

3. clean

   $ make clobber

