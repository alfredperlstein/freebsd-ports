# Created by: Alfred Perlstein <alfred@freebsd.org>
# $FreeBSD$

PORTNAME=	django-jsonfield
PORTVERSION=	0.9.13
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	alfred@freebsd.org
COMMENT=	JSONField for Django models

LICENSE=	BSD2CLAUSE

USES=		python
USE_PYTHON=	distutils autoplist

RUN_DEPENDS:=  ${PYTHON_PKGNAMEPREFIX}django>=1.5:${PORTSDIR}/www/py-django

regression-test: build
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
