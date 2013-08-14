(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(*                              Hongwei Xi                             *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS - Unleashing the Potential of Types!
** Copyright (C) 2002-2010 Hongwei Xi, Boston University
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the  terms of the  GNU General Public License as published by the Free
** Software Foundation; either version 2.1, or (at your option) any later
** version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see  the  file  COPYING.  If not, write to the Free
** Software Foundation, 51  Franklin  Street,  Fifth  Floor,  Boston,  MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(*
**
** Contributed by Zhiqiang Ren (aren AT cs DOT bu DOT edu)
** Start Time: Oct, 2012
**
** Rewritten by Hanwen Wu (hwwu AT bu DOT edu)
** Start Time: Aug, 2013
**
*)

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



