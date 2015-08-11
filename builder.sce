mode(-1)
lines(0)

//Symphony toolbox builder
//By Keyur Joshi, Sai Kiran and Iswarya

// By default, just link to symphony library installed in the system, say in /usr/lib
//LINKER_FLAGS=["-w -fpermissive -I/usr/include/coin -lSym"];
// Or uncomment this to set a path to a locally installed copy of symphony
LINKER_FLAGS=["-w -fpermissive "]
gateway_path = get_absolute_file_path("builder.sce");
lib_path = "C:\Users\basquiat\Documents\Toolboxes-indiens\SYMPHONY-5.6\SYMPHONY\include";
lib_path = [lib_path; gateway_path];
CFLAGS = ilib_include_flag(lib_path);

LDLIBS = findfiles('C:\Users\basquiat\Documents\Toolboxes-indiens\SYMPHONY-5.6\SYMPHONY\MSVisualStudio\v10\x64-v120-Debug', '*.lib');
LDLIBS = part(LDLIBS, 1:$-4);
LDLIBS = "C:\Users\basquiat\Documents\Toolboxes-indiens\SYMPHONY-5.6\SYMPHONY\MSVisualStudio\v10\x64-v120-Debug\" + LDLIBS;

//LINKER_FLAGS=["-w -fpermissive -I/home/amahajan/projects/symphony/trunk/build2/include/coin -Wl,
//-rpath=/home/amahajan/projects/symphony/trunk/build2/lib -L/home/amahajan/projects/symphony/trunk/build2/lib -lSym"];

WITHOUT_AUTO_PUTLHSVAR = %t;
toolbox_title = "symphonytools"

tbx_build_gateway(toolbox_title, ..
	[
		//for opening/closing environment and checking if it is open/close
		"sym_open","sci_sym_open";
		"sym_close","sci_sym_close";
		"sym_isEnvActive","sci_sym_isEnvActive";
		
		//run time parameters
		"sym_resetParams","sci_sym_set_defaults";
		"sym_setIntParam","sci_sym_set_int_param";
		"sym_getIntParam","sci_sym_get_int_param";
		"sym_setDblParam","sci_sym_set_dbl_param";
		"sym_getDblParam","sci_sym_get_dbl_param";
		"sym_setStrParam","sci_sym_set_str_param";
		"sym_getStrParam","sci_sym_get_str_param";
		"sym_getInfinity","sci_sym_getInfinity";
		
		//problem loaders
		"sym_loadProblemBasic","sci_sym_loadProblemBasic";
		"sym_loadProblem","sci_sym_loadProblem";
		"sym_loadMPS","sci_sym_load_mps";
		
		//basic data
		"sym_getNumConstr","sci_sym_get_num_int";
		"sym_getNumVar","sci_sym_get_num_int";
		"sym_getNumElements","sci_sym_get_num_int";
		
		//variable and objective data
		"sym_isContinuous","sci_sym_isContinuous";
		"sym_isBinary","sci_sym_isBinary";
		"sym_isInteger","sci_sym_isInteger";
		"sym_setContinuous","sci_sym_set_continuous";
		"sym_setInteger","sci_sym_set_integer";
		"sym_getVarLower","sci_sym_get_dbl_arr";
		"sym_getVarUpper","sci_sym_get_dbl_arr";
		"sym_setVarLower","sci_sym_setVarBound";
		"sym_setVarUpper","sci_sym_setVarBound";
		"sym_getObjCoeff","sci_sym_get_dbl_arr";
		"sym_setObjCoeff","sci_sym_setObjCoeff";
		"sym_getObjSense","sci_sym_getObjSense";
		"sym_setObjSense","sci_sym_setObjSense";
		
		//constraint data
		"sym_getRhs","sci_sym_get_dbl_arr";
		"sym_getConstrRange","sci_sym_get_dbl_arr";
		"sym_getConstrLower","sci_sym_get_dbl_arr";
		"sym_getConstrUpper","sci_sym_get_dbl_arr";
		"sym_setConstrLower","sci_sym_setConstrBound";
		"sym_setConstrUpper","sci_sym_setConstrBound";
		"sym_setConstrType","sci_sym_setConstrType";
		"sym_getMatrix","sci_sym_get_matrix";
		"sym_getConstrSense","sci_sym_get_row_sense";
		
		//add/remove variables and constraints
		"sym_addConstr","sci_sym_addConstr";
		"sym_addVar","sci_sym_addVar";
		"sym_deleteVars","sci_sym_delete_cols";
		"sym_deleteConstrs","sci_sym_delete_rows";
		
		//primal bound
		"sym_getPrimalBound","sci_sym_getPrimalBound";
		"sym_setPrimalBound","sci_sym_setPrimalBound";
		
		//set preliminary solution
		"sym_setVarSoln","sci_sym_setColSoln";
		
		//solve
		"sym_solve","sci_sym_solve";
		
		//post solve functions
		"sym_getStatus","sci_sym_get_status";
		"sym_isOptimal","sci_sym_get_solver_status";
		"sym_isInfeasible","sci_sym_get_solver_status";
		"sym_isAbandoned","sci_sym_get_solver_status";
		"sym_isIterLimitReached","sci_sym_get_solver_status";
		"sym_isTimeLimitReached","sci_sym_get_solver_status";
		"sym_isTargetGapAchieved","sci_sym_get_solver_status";
		"sym_getVarSoln","sci_sym_getVarSoln";
		"sym_getObjVal","sci_sym_getObjVal";
		"sym_getIterCount","sci_sym_get_iteration_count";
		"sym_getConstrActivity","sci_sym_getRowActivity";
	], ..
	[
		"globals.cpp",
		"sci_iofunc.hpp",
		"sci_iofunc.cpp",
		"sci_sym_openclose.cpp",
		"sci_solver_status_query_functions.cpp",
		"sci_sym_solve.cpp",
		"sci_sym_loadproblem.cpp",
		"sci_sym_isenvactive.cpp",
		"sci_sym_load_mps.cpp",
		"sci_vartype.cpp",
		"sci_sym_getinfinity.cpp",
		"sci_sym_solution.cpp",
		"sym_data_query_functions.cpp"
		"sci_sym_set_variables.cpp",
		"sci_sym_setobj.cpp",
		"sci_sym_varbounds.cpp",
		"sci_sym_rowmod.cpp",
		"sci_sym_set_indices.cpp",
		"sci_sym_addrowcol.cpp",
		"sci_sym_primalbound.cpp",
		"sci_sym_setcolsoln.cpp",
		"sci_sym_getrowact.cpp",
		"sci_sym_getobjsense.cpp",
		"sci_sym_remove.cpp",
	], ..
	get_absolute_file_path("builder.sce"), LDLIBS, "-lSym", CFLAGS, "", "");

tbx_builder_help(get_absolute_file_path("builder.sce"));

clear WITHOUT_AUTO_PUTLHSVAR toolbox_title LINKER_FLAGS;
