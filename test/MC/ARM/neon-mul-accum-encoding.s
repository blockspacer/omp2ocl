@ RUN: llvm-mc -mcpu=cortex-a8 -triple arm-unknown-unknown -show-encoding < %s | FileCheck %s
@ XFAIL: *

@ CHECK: vmla.i8	d16, d18, d17           @ encoding: [0xa1,0x09,0x42,0xf2]
	vmla.i8	d16, d18, d17
@ CHECK: vmla.i16	d16, d18, d17   @ encoding: [0xa1,0x09,0x52,0xf2]
	vmla.i16	d16, d18, d17
@ CHECK: vmla.i16	d16, d18, d17   @ encoding: [0xa1,0x09,0x52,0xf2]
	vmla.i32	d16, d18, d17
@ CHECK: vmla.f32	d16, d18, d17   @ encoding: [0xb1,0x0d,0x42,0xf2]
	vmla.f32	d16, d18, d17
@ CHECK: vmla.i8	q9, q8, q10             @ encoding: [0xe4,0x29,0x40,0xf2]
	vmla.i8	q9, q8, q10
@ CHECK: vmla.i16	q9, q8, q10     @ encoding: [0xe4,0x29,0x50,0xf2]
	vmla.i16	q9, q8, q10
@ CHECK: vmla.i32	q9, q8, q10     @ encoding: [0xe4,0x29,0x60,0xf2]
	vmla.i32	q9, q8, q10
@ CHECK: vmla.f32	q9, q8, q10     @ encoding: [0xf4,0x2d,0x40,0xf2]
	vmla.f32	q9, q8, q10
@ CHECK: vmlal.s8	q8, d19, d18    @ encoding: [0xa2,0x08,0xc3,0xf2]
	vmlal.s8	q8, d19, d18
@ CHECK: vmlal.s16	q8, d19, d18    @ encoding: [0xa2,0x08,0xd3,0xf2]
	vmlal.s16	q8, d19, d18
@ CHECK: vmlal.s32	q8, d19, d18    @ encoding: [0xa2,0x08,0xe3,0xf2]
	vmlal.s32	q8, d19, d18
@ CHECK: vmlal.u8	q8, d19, d18    @ encoding: [0xa2,0x08,0xc3,0xf3]
	vmlal.u8	q8, d19, d18
@ CHECK: vmlal.u16	q8, d19, d18    @ encoding: [0xa2,0x08,0xd3,0xf3]
	vmlal.u16	q8, d19, d18
@ CHECK: vmlal.u32	q8, d19, d18    @ encoding: [0xa2,0x08,0xe3,0xf3]
	vmlal.u32	q8, d19, d18
@ CHECK: vqdmlal.s16	q8, d19, d18    @ encoding: [0xa2,0x09,0xd3,0xf2]
	vqdmlal.s16	q8, d19, d18
@ CHECK: vqdmlal.s32	q8, d19, d18    @ encoding: [0xa2,0x09,0xe3,0xf2]
	vqdmlal.s32	q8, d19, d18
@ CHECK: vmls.i8	d16, d18, d17           @ encoding: [0xa1,0x09,0x42,0xf3]
	vmls.i8	d16, d18, d17
@ CHECK: vmls.i16	d16, d18, d17   @ encoding: [0xa1,0x09,0x52,0xf3]
	vmls.i16	d16, d18, d17
@ CHECK: vmls.i32	d16, d18, d17   @ encoding: [0xa1,0x09,0x62,0xf3]
	vmls.i32	d16, d18, d17
@ CHECK: vmls.f32	d16, d18, d17   @ encoding: [0xb1,0x0d,0x62,0xf2]
	vmls.f32	d16, d18, d17
@ CHECK: vmls.i8	q9, q8, q10             @ encoding: [0xe4,0x29,0x40,0xf3]
	vmls.i8	q9, q8, q10
@ CHECK: vmls.i16	q9, q8, q10     @ encoding: [0xe4,0x29,0x50,0xf3]
	vmls.i16	q9, q8, q10
@ CHECK: vmls.i32	q9, q8, q10     @ encoding: [0xe4,0x29,0x60,0xf3]
	vmls.i32	q9, q8, q10
@ CHECK: vmls.f32	q9, q8, q10     @ encoding: [0xf4,0x2d,0x60,0xf2]
	vmls.f32	q9, q8, q10
@ CHECK: vmlsl.s8	q8, d19, d18    @ encoding: [0xa2,0x0a,0xc3,0xf2]
	vmlsl.s8	q8, d19, d18
@ CHECK: vmlsl.s16	q8, d19, d18    @ encoding: [0xa2,0x0a,0xd3,0xf2]
	vmlsl.s16	q8, d19, d18
@ CHECK: vmlsl.s32	q8, d19, d18    @ encoding: [0xa2,0x0a,0xe3,0xf2]
	vmlsl.s32	q8, d19, d18
@ CHECK: vmlsl.u8	q8, d19, d18    @ encoding: [0xa2,0x0a,0xc3,0xf3]
	vmlsl.u8	q8, d19, d18
@ CHECK: vmlsl.u16	q8, d19, d18    @ encoding: [0xa2,0x0a,0xd3,0xf3]
	vmlsl.u16	q8, d19, d18
@ CHECK: vmlsl.u32	q8, d19, d18    @ encoding: [0xa2,0x0a,0xe3,0xf3]
	vmlsl.u32	q8, d19, d18
@ CHECK: vqdmlsl.s16	q8, d19, d18    @ encoding: [0xa2,0x0b,0xd3,0xf2]
	vqdmlsl.s16	q8, d19, d18
@ CHECK: vqdmlsl.s32	q8, d19, d18    @ encoding: [0xa2,0x0b,0xe3,0xf2]
	vqdmlsl.s32	q8, d19, d18
