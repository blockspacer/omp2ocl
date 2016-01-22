//-------------------------------------------------------------------------------
//OpenCL Kernels 
//Generated at : Mon Aug 13 10:48:58 2012
//Compiler options: 
//      Software Cache  true
//      Local Memory    true
//      DefaultParallelDepth    3
//      UserDefParallelDepth    false
//      EnableLoopInterchange   true
//      Generating debug/profiling code false
//      EnableMLFeatureCollection       false
//      Array Linearization     true
//      GPU TLs false
//      Strict TLS Checking     true
//      Check TLS Conflict at the end of function       true
//-------------------------------------------------------------------------------

#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#define GROUP_SIZE 128

//-------------------------------------------
//Array linearize macros (BEGIN)
//-------------------------------------------
#define CALC_2D_IDX(M1,M2,m1,m2) (((m1)*(M2))+((m2)))
#define CALC_3D_IDX(M1,M2,M3,m1,m2,m3) (((m1)*(M2)*(M3))+((m2)*(M3))+((m3)))
#define CALC_4D_IDX(M1,M2,M3,M4,m1,m2,m3,m4) (((m1)*(M2)*(M3)*(M4))+((m2)*(M3)*(M4))+((m3)*(M4))+((m4)))
#define CALC_5D_IDX(M1,M2,M3,M4,M5,m1,m2,m3,m4,m5) (((m1)*(M2)*(M3)*(M4)*(M5))+((m2)*(M3)*(M4)*(M5))+((m3)*(M4)*(M5))+((m4)*(M5))+((m5)))
#define CALC_6D_IDX(M1,M2,M3,M4,M5,M6,m1,m2,m3,m4,m5,m6) (((m1)*(M2)*(M3)*(M4)*(M5)*(M6))+((m2)*(M3)*(M4)*(M5)*(M6))+((m3)*(M4)*(M5)*(M6))+((m4)*(M5)*(M6))+((m5)*(M6))+((m6)))
#define CALC_7D_IDX(M1,M2,M3,M4,M5,M6,M7,m1,m2,m3,m4,m5,m6,m7) (((m1)*(M2)*(M3)*(M4)*(M5)*(M6)*(M7))+((m2)*(M3)*(M4)*(M5)*(M6)*(M7))+((m3)*(M4)*(M5)*(M6)*(M7))+((m4)*(M5)*(M6)*(M7))+((m5)*(M6)*(M7))+((m6)*(M7))+((m7)))
#define CALC_8D_IDX(M1,M2,M3,M4,M5,M6,M7,M8,m1,m2,m3,m4,m5,m6,m7,m8) (((m1)*(M2)*(M3)*(M4)*(M5)*(M6)*(M7)*(M8))+((m2)*(M3)*(M4)*(M5)*(M6)*(M7)*(M8))+((m3)*(M4)*(M5)*(M6)*(M7)*(M8))+((m4)*(M5)*(M6)*(M7)*(M8))+((m5)*(M6)*(M7)*(M8))+((m6)*(M7)*(M8))+((m7)*(M8))+((m8)))
//-------------------------------------------
//Array linearize macros (END)
//-------------------------------------------

//-------------------------------------------------------------------------------
//Functions (BEGIN)
//-------------------------------------------------------------------------------
void myvranlc_g3_gtp(int n, double *x_seed, double a, __global double *y,
		     unsigned int __ocl_mult_factor,
		     unsigned int __ocl_add_offset);
double myrandlc(double *x, double a);
void myvranlc(int n, double *x_seed, double a, double y[]);

double myrandlc(double *x, double a)
{
	double t1, t2, t3, t4, a1, a2, x1, x2, z;
	t1 = (0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
	      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
	      0.5) * a;
	a1 = (int)t1;
	a2 = a -
	    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0) * a1;
	t1 = (0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
	      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
	      0.5) * (*x);
	x1 = (int)t1;
	x2 = (*x) -
	    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0) * x1;
	t1 = a1 * x2 + a2 * x1;
	t2 = (int)((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		    0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		    0.5 * 0.5 * 0.5) * t1);
	z = t1 -
	    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0) * t2;
	t3 = (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	      2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	      2.0) * z + a2 * x2;
	t4 = (int)(((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		     0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		     0.5 * 0.5 * 0.5) * (0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
					 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
					 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
					 0.5 * 0.5 * 0.5 * 0.5 * 0.5)) * t3);
	(*x) =
	    t3 -
	    ((2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	      2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	      2.0) * (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0)) * t4;
	return (((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		  0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		  0.5 * 0.5 * 0.5) * (0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
				      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
				      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
				      0.5 * 0.5)) * (*x));
}

void myvranlc(int n, double *x_seed, double a, double y[])
{
	int i;
	double x, t1, t2, t3, t4, a1, a2, x1, x2, z;
	t1 = (0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
	      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
	      0.5) * a;
	a1 = (int)t1;
	a2 = a -
	    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0) * a1;
	x = *x_seed;
	for (i = 1; i <= n; i++) {
		t1 = (0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		      0.5 * 0.5 * 0.5 * 0.5 * 0.5) * x;
		x1 = (int)t1;
		x2 = x -
		    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		     2.0 * 2.0 * 2.0) * x1;
		t1 = a1 * x2 + a2 * x1;
		t2 = (int)((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
			    0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
			    0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5) * t1);
		z = t1 -
		    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		     2.0 * 2.0 * 2.0) * t2;
		t3 = (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0) * z + a2 * x2;
		t4 = (int)(((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
			     0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
			     0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5) * (0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5)) *
			   t3);
		x = t3 -
		    ((2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0) * (2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0)) * t4;
		y[i] =
		    ((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		      0.5 * 0.5 * 0.5 * 0.5 * 0.5) * (0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5)) * x;
	}
	*x_seed = x;
}

//-------------------------------------------------------------------------------
//This is an alias of function: myvranlc
//The input arguments of this function are expanded. 
//Global memory variables:
//      0: y
//-------------------------------------------------------------------------------
void myvranlc_g3_gtp(int n, double *x_seed, double a, __global double *y,
		     unsigned int __ocl_mult_factor,
		     unsigned int __ocl_add_offset)
{

	int i;
	double x, t1, t2, t3, t4, a1, a2, x1, x2, z;
	t1 = (0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
	      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
	      0.5) * a;
	a1 = (int)t1;
	a2 = a -
	    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
	     2.0) * a1;
	x = *x_seed;
	for (i = 1; i <= n; i++) {
		t1 = (0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		      0.5 * 0.5 * 0.5 * 0.5 * 0.5) * x;
		x1 = (int)t1;
		x2 = x -
		    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		     2.0 * 2.0 * 2.0) * x1;
		t1 = a1 * x2 + a2 * x1;
		t2 = (int)((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
			    0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
			    0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5) * t1);
		z = t1 -
		    (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		     2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		     2.0 * 2.0 * 2.0) * t2;
		t3 = (2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0) * z + a2 * x2;
		t4 = (int)(((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
			     0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
			     0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5) * (0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5 *
									 0.5)) *
			   t3);
		x = t3 -
		    ((2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 * 2.0 *
		      2.0 * 2.0 * 2.0 * 2.0 * 2.0) * (2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0 * 2.0 *
						      2.0 * 2.0 * 2.0)) * t4;
		y[(i) * __ocl_mult_factor + __ocl_add_offset] =
		    ((0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		      0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 * 0.5 *
		      0.5 * 0.5 * 0.5 * 0.5 * 0.5) * (0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5 * 0.5 *
						      0.5 * 0.5 * 0.5)) * x;
	}
	*x_seed = x;

}

//-------------------------------------------------------------------------------
//Functions (END)
//-------------------------------------------------------------------------------

//-------------------------------------------------------------------------------
//OpenCL Kernels (BEGIN)
//-------------------------------------------------------------------------------

__kernel void main_0_reduction_step0(__global double *__ocl_part_sx,
				     __global double *__ocl_part_sy,
				     unsigned int offset, unsigned int bound)
{
	unsigned int i = get_global_id(0);
	if (i >= bound)
		return;
	i = i + offset;
	__ocl_part_sx[i] = 0.0;
	__ocl_part_sy[i] = 0.0;
}

//-------------------------------------------------------------------------------
//Loop defined at line 288 of ep.c
//-------------------------------------------------------------------------------
__kernel void main_0_reduction_step1(int k_offset, double an,
				     __global double *x,
				     __constant double *__ocl_copyin_x,
				     int __ocl_k_bound,
				     __global double *__ocl_part_sx,
				     __global double *__ocl_part_sy)
{
	//-------------------------------------------
	//OpenCL global indexes (BEGIN)
	//-------------------------------------------
	int k = get_global_id(0) + 1;
	int _ocl_k_init = k;
	if (!(k <= __ocl_k_bound)) {
		return;
	}
	//-------------------------------------------
	//OpenCL global indexes (END)
	//-------------------------------------------

	//-------------------------------------------
	//Pivate variables (BEGIN)
	//-------------------------------------------
	int kk;			/* Defined at ep.c : 285 */
	double t1;		/* Defined at ep.c : 284 */
	double t2;		/* Defined at ep.c : 284 */
	int i;			/* Defined at ep.c : 285 */
	int ik;			/* Defined at ep.c : 285 */
	double t3;		/* Defined at ep.c : 284 */
	double x1;		/* Defined at ep.c : 284 */
	double x2;		/* Defined at ep.c : 284 */
	double t4;		/* Defined at ep.c : 284 */
	//-------------------------------------------
	//Pivate variables (END)
	//-------------------------------------------

	unsigned gsize_0 = get_global_size(0);
	unsigned gid_0 = get_global_id(0);

	unsigned __ocl_mult_factor = (gsize_0);
	unsigned __ocl_add_offset = ((gid_0));

	//-------------------------------------------
	//Convert global memory objects (BEGIN)
	//-------------------------------------------
	//-------------------------------------------
	//Convert global memory objects (END)
	//-------------------------------------------

	//-------------------------------------------
	//Declare reduction variables (BEGIN)
	//-------------------------------------------
	double sx = 0.0;	/* reduction variable, defined at: ep.c : 203 */
	double sy = 0.0;	/* reduction variable, defined at: ep.c : 203 */
	//-------------------------------------------
	//Declare reduction variables (END)
	//-------------------------------------------

	//-------------------------------------------
	// Copy in (START)
	//-------------------------------------------
	{
		double4 _vl4;

		unsigned x_offset = 0;
		for (unsigned _i_x = 0; _i_x < 512; _i_x++) {
			_vl4 = vload4(0, __ocl_copyin_x);
			//vstore4(_v14, 0, (__global double*) x);
			//x += 4;
			x[((x_offset * __ocl_mult_factor) + __ocl_add_offset)] =
			    _vl4.x;
			x_offset++;
			x[((x_offset * __ocl_mult_factor) + __ocl_add_offset)] =
			    _vl4.y;
			x_offset++;
			x[((x_offset * __ocl_mult_factor) + __ocl_add_offset)] =
			    _vl4.z;
			x_offset++;
			x[((x_offset * __ocl_mult_factor) + __ocl_add_offset)] =
			    _vl4.w;
			x_offset++;
			__ocl_copyin_x = __ocl_copyin_x + 4;
		}
	}
	//-------------------------------------------
	// Copy in (END)
	//-------------------------------------------
	//-------------------------------------------
	//OpenCL kernel (BEGIN)
	//-------------------------------------------
	for (k = _ocl_k_init; k <= __ocl_k_bound; k += get_global_size(0)) {
		kk = k_offset + k;
		t1 = 271828183.0;
		t2 = an;
		for (i = 1; i <= 100; i++) {
			ik = kk / 2;
			if (2 * ik != kk)
				t3 = myrandlc(&t1, t2);
			if (ik == 0)
				break;
			t3 = myrandlc(&t2, t2);
			kk = ik;
		}
		myvranlc_g3_gtp(2 * (1 << 10), &t1, 1220703125.0,
				x - ((1) * __ocl_mult_factor),
				__ocl_mult_factor, __ocl_add_offset);
		for (i = 0; i < (1 << 10); i++) {
			x1 = 2.0 * x[(2 * i) * __ocl_mult_factor +
				     __ocl_add_offset] - 1.0;
			x2 = 2.0 * x[(2 * i + 1) * __ocl_mult_factor +
				     __ocl_add_offset] - 1.0;
			t1 = ((x1) * (x1)) + ((x2) * (x2));
			if (t1 <= 1.0) {
				t2 = sqrt(-2.0 * log(t1) / t1);
				t3 = (x1 * t2);
				t4 = (x2 * t2);
				sx = sx + t3;
				sy = sy + t4;
			}
		}
	}
	//-------------------------------------------
	//OpenCL kernel (END)
	//-------------------------------------------

	//-------------------------------------------
	//Write back to the global buffer (BEGIN)
	//-------------------------------------------
	{
		unsigned int __ocl_wb_idx = get_global_id(0);
		__ocl_part_sx[__ocl_wb_idx] = sx;
		__ocl_part_sy[__ocl_wb_idx] = sy;
	}
	//-------------------------------------------
	//Write back to the global buffer (END)
	//-------------------------------------------
}

__kernel void main_0_reduction_step2(__global double4 * input_sx,
				     __global double *output_sx,
				     __global double4 * input_sy,
				     __global double *output_sy)
{
	unsigned int tid = get_local_id(0);
	unsigned int bid = get_group_id(0);
	unsigned int gid = get_global_id(0);
	unsigned int local_size = get_local_size(0);

	__local double4 sdata_sx[GROUP_SIZE];
	__local double4 sdata_sy[GROUP_SIZE];
	sdata_sx[tid] = input_sx[gid];
	sdata_sy[tid] = input_sy[gid];
	barrier(CLK_LOCAL_MEM_FENCE);

	for (unsigned int s = local_size / 2; s > 0; s >>= 1) {
		if (tid < s) {
			sdata_sx[tid] += sdata_sx[tid + s];
			sdata_sy[tid] += sdata_sy[tid + s];
		}
		barrier(CLK_LOCAL_MEM_FENCE);
	}

	if (tid == 0) {
		output_sx[bid] =
		    (sdata_sx[0].x + sdata_sx[0].y + sdata_sx[0].z +
		     sdata_sx[0].w);
		output_sy[bid] =
		    (sdata_sy[0].x + sdata_sy[0].y + sdata_sy[0].z +
		     sdata_sy[0].w);
	}
}

//-------------------------------------------------------------------------------
//OpenCL Kernels (END)
//-------------------------------------------------------------------------------
