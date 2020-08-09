# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.unit
PKG_SUPPORTED_OPTIONS=	debug ssl
PKG_SUGGESTED_OPTIONS=	ssl

PLIST_VARS+=		devkit

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mdebug)
CONFIGURE_ARGS+=	--debug
.endif

.if !empty(PKG_OPTIONS:Mssl)
.include "../../security/openssl/buildlink3.mk"
CONFIGURE_ARGS+=	--openssl
.endif
