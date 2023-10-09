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
IKI_DLLESPEC extern void execute_2062(char*, char *);
IKI_DLLESPEC extern void execute_4476(char*, char *);
IKI_DLLESPEC extern void execute_4477(char*, char *);
IKI_DLLESPEC extern void execute_4478(char*, char *);
IKI_DLLESPEC extern void execute_2798(char*, char *);
IKI_DLLESPEC extern void execute_2070(char*, char *);
IKI_DLLESPEC extern void execute_2068(char*, char *);
IKI_DLLESPEC extern void execute_2069(char*, char *);
IKI_DLLESPEC extern void execute_3221(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_2064(char*, char *);
IKI_DLLESPEC extern void execute_2065(char*, char *);
IKI_DLLESPEC extern void execute_2066(char*, char *);
IKI_DLLESPEC extern void execute_2067(char*, char *);
IKI_DLLESPEC extern void execute_4479(char*, char *);
IKI_DLLESPEC extern void execute_4480(char*, char *);
IKI_DLLESPEC extern void execute_4481(char*, char *);
IKI_DLLESPEC extern void execute_4482(char*, char *);
IKI_DLLESPEC extern void execute_4483(char*, char *);
IKI_DLLESPEC extern void execute_4484(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[21] = {(funcp)execute_2062, (funcp)execute_4476, (funcp)execute_4477, (funcp)execute_4478, (funcp)execute_2798, (funcp)execute_2070, (funcp)execute_2068, (funcp)execute_2069, (funcp)execute_3221, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_2064, (funcp)execute_2065, (funcp)execute_2066, (funcp)execute_2067, (funcp)execute_4479, (funcp)execute_4480, (funcp)execute_4481, (funcp)execute_4482, (funcp)execute_4483, (funcp)execute_4484, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 21;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Lab2_111060013_Decode_And_Execute_t_behav/xsim.reloc",  (void **)funcTab, 21);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Lab2_111060013_Decode_And_Execute_t_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/Lab2_111060013_Decode_And_Execute_t_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/Lab2_111060013_Decode_And_Execute_t_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Lab2_111060013_Decode_And_Execute_t_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Lab2_111060013_Decode_And_Execute_t_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
