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
zlog_reload (ctx: !zlog_context | config: string): int =
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
dzlog_init (config: string, category: string): (zlog_context | int) =
"mac#dzlog_init"

fun 
dzlog_set_category (ctx: !zlog_context | category: string): int =
"mac#dzlog_set_category"


fun 
dzlog {ts:types} (ctx: !zlog_context | level: int, fmt: string, args: ts): void =
"mac#dzlog_handler"
