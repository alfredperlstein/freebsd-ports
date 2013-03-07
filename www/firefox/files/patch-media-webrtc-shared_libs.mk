--- media/webrtc/shared_libs.mk~
+++ media/webrtc/shared_libs.mk
@@ -28,13 +28,11 @@
   $(call EXPAND_LIBNAME_PATH,bitrate_controller,$(DEPTH)/media/webrtc/trunk/src/modules/modules_bitrate_controller) \
   $(call EXPAND_LIBNAME_PATH,remote_bitrate_estimator,$(DEPTH)/media/webrtc/trunk/src/modules/modules_remote_bitrate_estimator) \
   $(call EXPAND_LIBNAME_PATH,video_processing,$(DEPTH)/media/webrtc/trunk/src/modules/modules_video_processing) \
-  $(call EXPAND_LIBNAME_PATH,video_processing_sse2,$(DEPTH)/media/webrtc/trunk/src/modules/modules_video_processing_sse2) \
   $(call EXPAND_LIBNAME_PATH,voice_engine_core,$(DEPTH)/media/webrtc/trunk/src/voice_engine/voice_engine_voice_engine_core) \
   $(call EXPAND_LIBNAME_PATH,audio_conference_mixer,$(DEPTH)/media/webrtc/trunk/src/modules/modules_audio_conference_mixer) \
   $(call EXPAND_LIBNAME_PATH,audio_device,$(DEPTH)/media/webrtc/trunk/src/modules/modules_audio_device) \
   $(call EXPAND_LIBNAME_PATH,audio_processing,$(DEPTH)/media/webrtc/trunk/src/modules/modules_audio_processing) \
   $(call EXPAND_LIBNAME_PATH,aec,$(DEPTH)/media/webrtc/trunk/src/modules/modules_aec) \
-  $(call EXPAND_LIBNAME_PATH,aec_sse2,$(DEPTH)/media/webrtc/trunk/src/modules/modules_aec_sse2) \
   $(call EXPAND_LIBNAME_PATH,apm_util,$(DEPTH)/media/webrtc/trunk/src/modules/modules_apm_util) \
   $(call EXPAND_LIBNAME_PATH,aecm,$(DEPTH)/media/webrtc/trunk/src/modules/modules_aecm) \
   $(call EXPAND_LIBNAME_PATH,agc,$(DEPTH)/media/webrtc/trunk/src/modules/modules_agc) \
@@ -45,6 +43,14 @@
   $(call EXPAND_LIBNAME_PATH,nrappkit,$(DEPTH)/media/mtransport/third_party/nrappkit/nrappkit_nrappkit) \
   $(NULL)
 
+# if we're on an intel arch, we want SSE2 optimizations
+ifneq (,$(INTEL_ARCHITECTURE))
+WEBRTC_LIBS += \
+  $(call EXPAND_LIBNAME_PATH,video_processing_sse2,$(DEPTH)/media/webrtc/trunk/src/modules/modules_video_processing_sse2) \
+  $(call EXPAND_LIBNAME_PATH,aec_sse2,$(DEPTH)/media/webrtc/trunk/src/modules/modules_aec_sse2) \
+  $(NULL)
+endif
+
 # If you enable one of these codecs in webrtc_config.gypi, you'll need to re-add the
 # relevant library from this list:
 #
