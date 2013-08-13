staload "zlog.sats"
dynload "zlog.dats"

exception exp_init_fail of ()

implement main () = let 
	val (ctx | n) = zlog_init ("")
	val () = if n <> 0 then let 
			val () = zlog_fini_empty (ctx | )
		in 
			$raise exp_init_fail ()
		end 

	val () = assert (n = 0)
	val () = zlog_fini (ctx | )
in 
	()
end
