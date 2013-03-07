--- media/webrtc/trunk/src/build/common.gypi~
+++ media/webrtc/trunk/src/build/common.gypi
@@ -118,7 +118,7 @@
   'target_defaults': {
     'include_dirs': [
       # TODO(andrew): we should be able to just use <(webrtc_root) here.
-      '..','../..',
+      '..','../..','../common_audio/signal_processing/include',
     ],
     'defines': [
       # TODO(leozwang): Run this as a gclient hook rather than at build-time:
