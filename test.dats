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
