# Created by: alfred
# $FreeBSD$

PORTNAME=	jlog
# version is YYYYMMDDxx <- xx is 00, 01 as needed per day
PORTVERSION=	1.2.2.s2015012200
PORTREVISION=	1
CATEGORIES=	databases

MAINTAINER=	alfred@FreeBSD.org
COMMENT=	journaled log

LICENSE=	BSD3CLAUSE

USE_GITHUB=	yes
GH_ACCOUNT=	omniti-labs	
# we want cf3085fe as it has c++ fixes
# and other additions over the latest 1.2.2
# release
GH_COMMIT=	cf3085f
GH_TAGNAME=	${GH_COMMIT}

#DISTVERSIONSUFFIX=  -${GH_COMMIT}
#DISTFILES=	${PORTNAME}-${PORTVERSION}-${GH_COMMIT}.

GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	autoconf

OPTIONS_DEFINE= PERL

OPTIONS_DEFAULT=        PERL

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MPERL}
USES+=          perl5
CONFIGURE_ARGS+=        --with-perl-lib=site
PLIST_SUB+=     WITH_PERL=""
.else
CONFIGURE_ARGS+=        --without-perl
PLIST_SUB+=     WITH_PERL="@comment "
.endif

.include <bsd.port.mk>
