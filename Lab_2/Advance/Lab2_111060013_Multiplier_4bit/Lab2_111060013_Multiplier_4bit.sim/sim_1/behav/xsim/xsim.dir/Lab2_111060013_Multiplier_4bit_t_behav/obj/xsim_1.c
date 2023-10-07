/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_858(char*, char *);
IKI_DLLESPEC extern void execute_859(char*, char *);
IKI_DLLESPEC extern void execute_860(char*, char *);
IKI_DLLESPEC extern void execute_1625(char*, char *);
IKI_DLLESPEC extern void execute_1626(char*, char *);
IKI_DLLESPEC extern void execute_1618(char*, char *);
IKI_DLLESPEC extern void execute_1619(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_1621(char*, char *);
IKI_DLLESPEC extern void execute_1622(char*, char *);
IKI_DLLESPEC extern void execute_866(char*, char *);
IKI_DLLESPEC extern void execute_867(char*, char *);
IKI_DLLESPEC extern void execute_906(char*, char *);
IKI_DLLESPEC extern void execute_862(char*, char *);
IKI_DLLESPEC extern void execute_863(char*, char *);
IKI_DLLESPEC extern void execute_864(char*, char *);
IKI_DLLESPEC extern void execute_865(char*, char *);
IKI_DLLESPEC extern void execute_1627(char*, char *);
IKI_DLLESPEC extern void execute_1628(char*, char *);
IKI_DLLESPEC extern void execute_1629(char*, char *);
IKI_DLLESPEC extern void execute_1630(char*, char *);
IKI_DLLESPEC extern void execute_1631(char*, char *);
IKI_DLLESPEC extern void execute_1632(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[24] = {(funcp)execute_858, (funcp)execute_859, (funcp)execute_860, (funcp)execute_1625, (funcp)execute_1626, (funcp)execute_1618, (funcp)execute_1619, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_1621, (funcp)execute_1622, (funcp)execute_866, (funcp)execute_867, (funcp)execute_906, (funcp)execute_862, (funcp)execute_863, (funcp)execute_864, (funcp)execute_865, (funcp)execute_1627, (funcp)execute_1628, (funcp)execute_1629, (funcp)execute_1630, (funcp)execute_1631, (funcp)execute_1632, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 24;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Lab2_111060013_Multiplier_4bit_t_behav/xsim.reloc",  (void **)funcTab, 24);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Lab2_111060013_Multiplier_4bit_t_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Lab2_111060013_Multiplier_4bit_t_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Lab2_111060013_Multiplier_4bit_t_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Lab2_111060013_Multiplier_4bit_t_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Lab2_111060013_Multiplier_4bit_t_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
