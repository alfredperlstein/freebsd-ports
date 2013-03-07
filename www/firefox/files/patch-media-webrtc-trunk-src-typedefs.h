--- media/webrtc/trunk/src/typedefs.h~
+++ media/webrtc/trunk/src/typedefs.h
@@ -57,7 +57,11 @@
 #define WEBRTC_ARCH_32_BITS
 #define WEBRTC_ARCH_LITTLE_ENDIAN
 #define WEBRTC_LITTLE_ENDIAN
-#else
+#elif defined(__PPC__)
+#define WEBRTC_ARCH_32_BITS
+#define WEBRTC_ARCH_BIG_ENDIAN
+#define WEBRTC_BIG_ENDIAN
+#else 
 #error Please add support for your architecture in typedefs.h
 #endif
 
