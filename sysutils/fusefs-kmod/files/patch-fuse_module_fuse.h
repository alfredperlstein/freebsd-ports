--- fuse_module/fuse.h.orig	Thu May  3 13:26:25 2007
+++ fuse_module/fuse.h	Thu May  3 13:26:03 2007
@@ -8,7 +8,15 @@
 
 #ifndef USE_OLD_CLONEHANDLER_API
 #if __FreeBSD_version < 600034 || ( __FreeBSD_version >= 700000 && __FreeBSD_version < 700002 )
-#define USE_OLD_CLONEHANDLER_API 1
+#define USE_OLD_CLONEHANDLER_API
+#endif
+#endif
+
+#ifndef NEW_VNODES_ADJUSTED_MANUALLY
+#if __FreeBSD_version >= 700034
+#define NEW_VNODES_ADJUSTED_MANUALLY 1
+#else
+#define NEW_VNODES_ADJUSTED_MANUALLY 0
 #endif
 #endif
 
@@ -19,10 +27,10 @@
  */
 #if FUSE_KERNELABI_GEQ(7, 3)
 #ifndef FUSE_HAS_ACCESS
-#define FUSE_HAS_ACCESS 1
+#define FUSE_HAS_ACCESS
 #endif
 #ifndef FUSE_HAS_CREATE
-#define FUSE_HAS_CREATE 1
+#define FUSE_HAS_CREATE
 #endif
 #endif
 
@@ -75,7 +83,7 @@
 	size_t len;     /* To keep track of size of the data pushed into base, =< len, of course */
 };
 
-#if ! FUSE_AUX
+#ifndef FUSE_AUX
 #ifndef FUSE_MAX_STORED_FREE_TICKETS
 #define FUSE_MAX_STORED_FREE_TICKETS 0
 #endif
@@ -251,7 +259,7 @@
 	int flags;
 	LIST_HEAD(, fuse_filehandle) fh_head;
 	int fh_counter;
-#if FUSE_HAS_CREATE
+#ifdef FUSE_HAS_CREATE
 	struct componentname *germcnp;
 #endif
 };
@@ -260,6 +268,9 @@
 
 /* Debug related stuff */
 
+#ifndef DEBUGTOLOG
+#define DEBUGTOLOG 0
+#endif
 #if DEBUGTOLOG
 #define dprintf(args ...)  log(LOG_DEBUG, args)
 #else
@@ -267,6 +278,9 @@
 #endif
 
 #define DEBLABEL "[fuse-debug] "
+#ifndef _DEBUG
+#define _DEBUG 0
+#endif
 #if     _DEBUG
 #ifndef _DEBUG2G
 #define _DEBUG2G 1
@@ -280,6 +294,9 @@
 #define DEBUG(args ...)
 #endif
 
+#ifndef _DEBUG2G
+#define _DEBUG2G 0
+#endif
 #if     _DEBUG2G
 #ifndef _DEBUG3G
 #define _DEBUG3G 1
@@ -290,6 +307,9 @@
 #define DEBUG2G(args ...)
 #endif
 
+#ifndef _DEBUG3G
+#define _DEBUG3G 0
+#endif
 #if     _DEBUG3G
 #define DEBUG3G(args, ...)							\
 	printf(DEBLABEL "%s:%d: " args, __func__, __LINE__, ## __VA_ARGS__)
@@ -297,13 +317,19 @@
 #define DEBUG3G(args ...)
 #endif
 
+#ifndef FMASTER
+#define FMASTER 0
+#endif
 #if     FMASTER
 #ifndef _DEBUG_MSGING
 #define _DEBUG_MSGING 1
 #endif
 #endif
 
-#if     _DEBUG_MSGING
+#ifndef _DEBUG_MSG
+#define _DEBUG_MSG 0
+#endif
+#ifdef     _DEBUG_MSGING
 #define fuprintf(args...) \
 	uprintf("[kern] " args)
 #else
@@ -319,7 +345,7 @@
 void fprettyprint(struct fuse_iov *fiov, size_t dlen);
 #endif
 
-#if IGNORE_INLINE
+#ifdef IGNORE_INLINE
 #define __inline
 #endif
 
