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
dynload "zlog.dats"

exception exp_init_fail of ()
exception exp_category_null of ()

implement main () = let 
	val (ctx | n) = zlog_init ("")

	val () = if n <> 0 then let 
			val () = zlog_fini_empty (ctx | )
		in 
			$raise exp_init_fail ()
		end 
	val () = assert (n = 0)

	val (ctx | n) = zlog_reload (ctx | "test.conf")

	val () = if n <> 0 then let 
			val () = zlog_fini_empty (ctx | )
		in 
			$raise exp_init_fail ()
		end 
	val () = assert (n = 0)


	val cat = zlog_get_category (ctx | "cat")

	val () = if zlog_category_is_null (cat) then $raise exp_category_null ()
	val () = assert (zlog_category_is_not_null (cat))

	val () = zlog (ctx | cat, ZLOG_LEVEL_DEBUG, "%s, %d", @("Hello World", 1024))
	val _ = zlog_clean_mdc (ctx | )
	val _ = zlog_put_mdc (ctx | "mykey", "myval")
	val () = zlog (ctx | cat, ZLOG_LEVEL_DEBUG, "%s, %d", @("Hello World", 1024))


	val () = zlog_fini (ctx | )
in 
	()
end
