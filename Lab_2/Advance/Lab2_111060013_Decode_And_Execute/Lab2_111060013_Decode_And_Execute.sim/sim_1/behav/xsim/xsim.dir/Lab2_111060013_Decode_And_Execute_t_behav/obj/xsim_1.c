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
IKI_DLLESPEC extern void execute_2630(char*, char *);
IKI_DLLESPEC extern void execute_5725(char*, char *);
IKI_DLLESPEC extern void execute_5726(char*, char *);
IKI_DLLESPEC extern void execute_5727(char*, char *);
IKI_DLLESPEC extern void execute_5717(char*, char *);
IKI_DLLESPEC extern void execute_5718(char*, char *);
IKI_DLLESPEC extern void execute_5719(char*, char *);
IKI_DLLESPEC extern void execute_5720(char*, char *);
IKI_DLLESPEC extern void execute_5721(char*, char *);
IKI_DLLESPEC extern void execute_5722(char*, char *);
IKI_DLLESPEC extern void execute_5723(char*, char *);
IKI_DLLESPEC extern void execute_5724(char*, char *);
IKI_DLLESPEC extern void execute_2638(char*, char *);
IKI_DLLESPEC extern void execute_2636(char*, char *);
IKI_DLLESPEC extern void execute_2637(char*, char *);
IKI_DLLESPEC extern void execute_4238(char*, char *);
IKI_DLLESPEC extern void execute_4661(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_2632(char*, char *);
IKI_DLLESPEC extern void execute_2633(char*, char *);
IKI_DLLESPEC extern void execute_2634(char*, char *);
IKI_DLLESPEC extern void execute_2635(char*, char *);
IKI_DLLESPEC extern void execute_5728(char*, char *);
IKI_DLLESPEC extern void execute_5729(char*, char *);
IKI_DLLESPEC extern void execute_5730(char*, char *);
IKI_DLLESPEC extern void execute_5731(char*, char *);
IKI_DLLESPEC extern void execute_5732(char*, char *);
IKI_DLLESPEC extern void execute_5733(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[29] = {(funcp)execute_2630, (funcp)execute_5725, (funcp)execute_5726, (funcp)execute_5727, (funcp)execute_5717, (funcp)execute_5718, (funcp)execute_5719, (funcp)execute_5720, (funcp)execute_5721, (funcp)execute_5722, (funcp)execute_5723, (funcp)execute_5724, (funcp)execute_2638, (funcp)execute_2636, (funcp)execute_2637, (funcp)execute_4238, (funcp)execute_4661, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_2632, (funcp)execute_2633, (funcp)execute_2634, (funcp)execute_2635, (funcp)execute_5728, (funcp)execute_5729, (funcp)execute_5730, (funcp)execute_5731, (funcp)execute_5732, (funcp)execute_5733, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 29;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Lab2_111060013_Decode_And_Execute_t_behav/xsim.reloc",  (void **)funcTab, 29);

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
