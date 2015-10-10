# Created by: Alfred Perlstein <alfred@freebsd.org>
# $FreeBSD$

PORTNAME=	maxminddb
PORTVERSION=	0.3.3
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	alfred@freebsd.org
COMMENT=	Python extension for reading the MaxMind DB format

LICENSE=	MIT

CFLAGS+=	-I${PREFIX}/include
LDFLAGS+=	-L${LOCALBASE}/lib

USES=		python
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
