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


%{#
#include "zlog.h"
%} 


#define ZLOG_LEVEL_DEBUG 	20
#define ZLOG_LEVEL_INFO 	40
#define ZLOG_LEVEL_NOTICE 	60
#define ZLOG_LEVEL_WARN 	80
#define ZLOG_LEVEL_ERROR 	100
#define ZLOG_LEVEL_FATAL 	120


abstype zlog_category (l: addr)
typedef zlog_category_nullable = [l:addr] zlog_category (l)
typedef zlog_category = [l:addr | l > null] zlog_category (l)

(* 
   Used to ensure zlog_init/zlog_fini pair and 
   ensure calling zlog_init first              
 *)

dataview zlog_context (b: bool) =
	| zlog_context_some (true) of ()
	| zlog_context_none (false) of ()

viewdef zlog_context = zlog_context (true)



fun 
zlog_init (config: string): [n: int] (zlog_context ( n == 0 ) | int (n)) =
"mac#zlog_init"

fun
zlog_reload (ctx: zlog_context | config: string): [n: int] (zlog_context ( n == 0 ) | int (n)) =
"mac#zlog_reload"

fun
zlog_fini (ctx: zlog_context (true) |  ): void = 
"mac#zlog_fini"

fun 
zlog_fini_empty (ctx: zlog_context (false) | ): void = 
"mac#zlog_fini_empty"



fun
zlog_profile (): void =
"mac#zlog_profile"

fun 
zlog_get_category (ctx: !zlog_context | name: string): zlog_category_nullable =
"mac#zlog_get_category"

fun 
zlog_category_is_not_null {l:addr} (c: zlog_category (l)): bool (l > null) =
"mac#zlog_category_is_not_null"

fun 
zlog_category_is_null {l:addr} (c: zlog_category (l)): bool (l == null) =
"mac#zlog_category_is_null"

fun 
zlog_put_mdc (ctx: !zlog_context | key: string, value: string): int =
"mac#zlog_put_mdc"

fun 
zlog_get_mdc (ctx: !zlog_context | key: string): string = 
"mac#zlog_get_mdc"

fun 
zlog_remove_mdc (ctx: !zlog_context | key: string): void =
"mac#zlog_remove_mdc"

fun 
zlog_clean_mdc (ctx: !zlog_context | ): void =
"mac#zlog_clean_mdc"



fun 
zlog {ts:types} (ctx: !zlog_context | c: zlog_category, level: int, fmt: string, args: ts): void =
"mac#zlog_handler"


fun 
dzlog_init (config: string, category: string): [n: int] (zlog_context (n == 0) | int (n)) =
"mac#dzlog_init"

fun 
dzlog_set_category (ctx: !zlog_context | category: string): int =
"mac#dzlog_set_category"


fun 
dzlog {ts:types} (ctx: !zlog_context | level: int, fmt: string, args: ts): void =
"mac#dzlog_handler"
