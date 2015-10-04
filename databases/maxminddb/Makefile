# Created by: Alfred Perlstein <alfred@freebsd.org>
# $FreeBSD$

PORTNAME=	libmaxminddb
PORTVERSION=	1.0.1
CATEGORIES=	databases
MASTER_SITES=	https://github.com/maxmind/libmaxminddb/releases/download/1.0.1/

GH_ACCOUNT=	maxmind
GH_PROJECT=	libmaxminddb

GNU_CONFIGURE=	yes
USES=		libtool

#libmaxminddb-1.0.1.tar.gz

LDFLAGS+=	-fPIC
CFLAGS+=	-fPIC

INSTALL_TARGET=install-strip
MAINTAINER=	alfred@freebsd.org
COMMENT=	Library for reading the MaxMind DB format

LICENSE=	MIT

.include <bsd.port.mk>
