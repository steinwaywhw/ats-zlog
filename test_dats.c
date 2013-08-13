/*
**
** The C code is generated by ATS/Anairiats
** The compilation time is: 2013-8-13: 16h:57m
**
*/

/* include some .h files */
#ifndef _ATS_HEADER_NONE
#include "ats_config.h"
#include "ats_basics.h"
#include "ats_types.h"
#include "ats_exception.h"
#include "ats_memory.h"
#endif /* _ATS_HEADER_NONE */

/* include some .cats files */
#ifndef _ATS_PRELUDE_NONE
#include "prelude/CATS/basics.cats"
#include "prelude/CATS/bool.cats"
#include "prelude/CATS/byte.cats"
#include "prelude/CATS/char.cats"
#include "prelude/CATS/float.cats"
#include "prelude/CATS/integer.cats"
#include "prelude/CATS/integer_fixed.cats"
#include "prelude/CATS/integer_ptr.cats"
#include "prelude/CATS/lazy.cats"
#include "prelude/CATS/lazy_vt.cats"
#include "prelude/CATS/pointer.cats"
#include "prelude/CATS/printf.cats"
#include "prelude/CATS/reference.cats"
#include "prelude/CATS/sizetype.cats"
#include "prelude/CATS/string.cats"
#include "prelude/CATS/array.cats"
#include "prelude/CATS/list.cats"
#include "prelude/CATS/matrix.cats"
#include "prelude/CATS/option.cats"
#endif /* _ATS_PRELUDE_NONE */
/* prologues from statically loaded files */

#include "zlog.h"
/* external codes at top */
/* type definitions */
/* external typedefs */
/* external dynamic constructor declarations */
ATSextern_val(ats_exn_type, _2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__exp_init_fail) ;

/* external dynamic constant declarations */
ATSextern_fun(ats_void_type, atspre_assert) (ats_bool_type) ;
ATSextern_fun(ats_bool_type, atspre_ieq) (ats_int_type, ats_int_type) ;
ATSextern_fun(ats_bool_type, atspre_ineq) (ats_int_type, ats_int_type) ;

/* external dynamic terminating constant declarations */
#ifdef _ATS_PROOFCHECK
#endif /* _ATS_PROOFCHECK */

/* assuming abstract types */
/* sum constructor declarations */
/* exn constructor declarations */
ATSglobal(ats_exn_type, _2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__exp_init_fail) ;

/* global dynamic (non-functional) constant declarations */
/* internal function declarations */

/* partial value template declarations */
/* static temporary variable declarations */
/* external value variable declarations */

/* function implementations */

/*
// /home/hwwu/Workspace/ats-zlog/test.dats: 88(line=6, offs=16) -- 303(line=18, offs=4)
*/
ATSglobaldec()
ats_void_type
mainats () {
/* local vardec */
// ATSlocal_void (tmp0) ;
ATSlocal (ats_int_type, tmp1) ;
ATSlocal (ats_int_type, tmp2) ;
// ATSlocal_void (tmp3) ;
ATSlocal (ats_bool_type, tmp4) ;
// ATSlocal_void (tmp5) ;
ATSlocal (ats_ptr_type, tmp6) ;
// ATSlocal_void (tmp7) ;
ATSlocal (ats_bool_type, tmp8) ;

__ats_lab_mainats:
tmp1 = zlog_init (ATSstrcst("")) ;
tmp2 = ats_selsin_mac(tmp1, atslab_1) ;
tmp4 = atspre_ineq (tmp2, 0) ;
if (tmp4) {
/* tmp5 = */ zlog_fini_empty () ;
tmp6 = (ats_sum_ptr_type)(&_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__exp_init_fail) ;
/* tmp3 = */ ats_raise_exn (tmp6) ;
} else {
/* empty */
} /* end of [if] */
tmp8 = atspre_ieq (tmp2, 0) ;
/* tmp7 = */ atspre_assert (tmp8) ;
/* tmp0 = */ zlog_fini () ;
return /* (tmp0) */ ;
} /* end of [mainats] */

/* static load function */

extern ats_void_type _2home_2hwwu_2Workspace_2ats_2dzlog_2zlog_2esats__staload (void) ;

ats_void_type
_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__staload () {
static int _2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__staload_flag = 0 ;
if (_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__staload_flag) return ;
_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__staload_flag = 1 ;

_2home_2hwwu_2Workspace_2ats_2dzlog_2zlog_2esats__staload () ;

_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__exp_init_fail.tag = ats_exception_con_tag_new () ;
_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__exp_init_fail.name = "_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__exp_init_fail" ;
return ;
} /* staload function */

/* dynamic load function */

ats_int_type _2home_2hwwu_2Workspace_2ats_2dzlog_2zlog_2edats__dynload_flag = 0 ;
extern ats_void_type _2home_2hwwu_2Workspace_2ats_2dzlog_2zlog_2edats__dynload (void) ;

// dynload flag declaration
// extern ats_int_type _2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__dynload_flag ;

ats_void_type
_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__dynload () {
// _2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__dynload_flag = 1 ;
_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__staload () ;

#ifdef _ATS_PROOFCHECK
#endif /* _ATS_PROOFCHECK */

/* marking static variables for GC */

/* marking external values for GC */

/* code for dynamic loading */
_2home_2hwwu_2Workspace_2ats_2dzlog_2zlog_2edats__dynload () ;
return ;
} /* end of [dynload function] */

int main (int argc, char *argv[]) {
ATS_GC_INIT() ;
mainats_prelude() ;
_2home_2hwwu_2Workspace_2ats_2dzlog_2test_2edats__dynload() ;
mainats((ats_int_type)argc, (ats_ptr_type)argv) ;
return (0) ;
} /* end of main */

/* external codes at mid */
/* external codes at bot */

/* ****** ****** */

/* end of [test_dats.c] */
