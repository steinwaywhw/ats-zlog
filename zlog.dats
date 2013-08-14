

staload "zlog.sats"


%{^
#include "zlog.h"
#include <stdarg.h>

void zlog_handler (zlog_category_t *c, int level, char *fmt, ...) {
	va_list args;
	va_start (args, fmt);

	vzlog (
		c, 
		__FILE__, 
		sizeof(__FILE__) - 1, 
		__func__, 
		sizeof(__func__) - 1, 
		__LINE__, 
		level, 
		fmt, 
		args);

	va_end (args);
}

void dzlog_handler (int level, char *fmt, ...) {
	va_list args;
	va_start (args, fmt);

	vdzlog ( 
		__FILE__, 
		sizeof(__FILE__) - 1, 
		__func__, 
		sizeof(__func__) - 1, 
		__LINE__, 
		level, 
		fmt, 
		args);

	va_end (args);
}

int zlog_category_is_not_null (zlog_category_t *c) {
	return c != NULL;
}

int zlog_category_is_null (zlog_category_t *c) {
	return c == NULL;
}

void zlog_fini_empty () {}

%}
