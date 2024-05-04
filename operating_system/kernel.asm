
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	a9013103          	ld	sp,-1392(sp) # 8000ba90 <_GLOBAL_OFFSET_TABLE_+0x30>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7fc060ef          	jal	ra,80006818 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <SuperVisorTrap>:
.align 4
.global SuperVisorTrap
.type SuperVisorTrap, @function

SuperVisorTrap:
    j ecall
    80001000:	0280006f          	j	80001028 <ecall>
    j timer
    80001004:	1240006f          	j	80001128 <timer>
    sret
    80001008:	10200073          	sret
    sret
    8000100c:	10200073          	sret
    sret
    80001010:	10200073          	sret
    sret
    80001014:	10200073          	sret
    sret
    80001018:	10200073          	sret
    sret
    8000101c:	10200073          	sret
    sret
    80001020:	10200073          	sret
    j console
    80001024:	2040006f          	j	80001228 <console>

0000000080001028 <ecall>:

ecall:
    addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000102c:	00113423          	sd	ra,8(sp)
    80001030:	00213823          	sd	sp,16(sp)
    80001034:	00313c23          	sd	gp,24(sp)
    80001038:	02413023          	sd	tp,32(sp)
    8000103c:	02513423          	sd	t0,40(sp)
    80001040:	02613823          	sd	t1,48(sp)
    80001044:	02713c23          	sd	t2,56(sp)
    80001048:	04813023          	sd	s0,64(sp)
    8000104c:	04913423          	sd	s1,72(sp)
    80001050:	04b13c23          	sd	a1,88(sp)
    80001054:	06c13023          	sd	a2,96(sp)
    80001058:	06d13423          	sd	a3,104(sp)
    8000105c:	06e13823          	sd	a4,112(sp)
    80001060:	06f13c23          	sd	a5,120(sp)
    80001064:	09013023          	sd	a6,128(sp)
    80001068:	09113423          	sd	a7,136(sp)
    8000106c:	09213823          	sd	s2,144(sp)
    80001070:	09313c23          	sd	s3,152(sp)
    80001074:	0b413023          	sd	s4,160(sp)
    80001078:	0b513423          	sd	s5,168(sp)
    8000107c:	0b613823          	sd	s6,176(sp)
    80001080:	0b713c23          	sd	s7,184(sp)
    80001084:	0d813023          	sd	s8,192(sp)
    80001088:	0d913423          	sd	s9,200(sp)
    8000108c:	0da13823          	sd	s10,208(sp)
    80001090:	0db13c23          	sd	s11,216(sp)
    80001094:	0fc13023          	sd	t3,224(sp)
    80001098:	0fd13423          	sd	t4,232(sp)
    8000109c:	0fe13823          	sd	t5,240(sp)
    800010a0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv16interruptHandlerEv
    800010a4:	365010ef          	jal	ra,80002c08 <_ZN5Riscv16interruptHandlerEv>

    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010a8:	00813083          	ld	ra,8(sp)
    800010ac:	01013103          	ld	sp,16(sp)
    800010b0:	01813183          	ld	gp,24(sp)
    800010b4:	02013203          	ld	tp,32(sp)
    800010b8:	02813283          	ld	t0,40(sp)
    800010bc:	03013303          	ld	t1,48(sp)
    800010c0:	03813383          	ld	t2,56(sp)
    800010c4:	04013403          	ld	s0,64(sp)
    800010c8:	04813483          	ld	s1,72(sp)
    800010cc:	05813583          	ld	a1,88(sp)
    800010d0:	06013603          	ld	a2,96(sp)
    800010d4:	06813683          	ld	a3,104(sp)
    800010d8:	07013703          	ld	a4,112(sp)
    800010dc:	07813783          	ld	a5,120(sp)
    800010e0:	08013803          	ld	a6,128(sp)
    800010e4:	08813883          	ld	a7,136(sp)
    800010e8:	09013903          	ld	s2,144(sp)
    800010ec:	09813983          	ld	s3,152(sp)
    800010f0:	0a013a03          	ld	s4,160(sp)
    800010f4:	0a813a83          	ld	s5,168(sp)
    800010f8:	0b013b03          	ld	s6,176(sp)
    800010fc:	0b813b83          	ld	s7,184(sp)
    80001100:	0c013c03          	ld	s8,192(sp)
    80001104:	0c813c83          	ld	s9,200(sp)
    80001108:	0d013d03          	ld	s10,208(sp)
    8000110c:	0d813d83          	ld	s11,216(sp)
    80001110:	0e013e03          	ld	t3,224(sp)
    80001114:	0e813e83          	ld	t4,232(sp)
    80001118:	0f013f03          	ld	t5,240(sp)
    8000111c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001120:	10010113          	addi	sp,sp,256

    sret
    80001124:	10200073          	sret

0000000080001128 <timer>:

timer:
    addi sp, sp, -256
    80001128:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000112c:	00113423          	sd	ra,8(sp)
    80001130:	00213823          	sd	sp,16(sp)
    80001134:	00313c23          	sd	gp,24(sp)
    80001138:	02413023          	sd	tp,32(sp)
    8000113c:	02513423          	sd	t0,40(sp)
    80001140:	02613823          	sd	t1,48(sp)
    80001144:	02713c23          	sd	t2,56(sp)
    80001148:	04813023          	sd	s0,64(sp)
    8000114c:	04913423          	sd	s1,72(sp)
    80001150:	04b13c23          	sd	a1,88(sp)
    80001154:	06c13023          	sd	a2,96(sp)
    80001158:	06d13423          	sd	a3,104(sp)
    8000115c:	06e13823          	sd	a4,112(sp)
    80001160:	06f13c23          	sd	a5,120(sp)
    80001164:	09013023          	sd	a6,128(sp)
    80001168:	09113423          	sd	a7,136(sp)
    8000116c:	09213823          	sd	s2,144(sp)
    80001170:	09313c23          	sd	s3,152(sp)
    80001174:	0b413023          	sd	s4,160(sp)
    80001178:	0b513423          	sd	s5,168(sp)
    8000117c:	0b613823          	sd	s6,176(sp)
    80001180:	0b713c23          	sd	s7,184(sp)
    80001184:	0d813023          	sd	s8,192(sp)
    80001188:	0d913423          	sd	s9,200(sp)
    8000118c:	0da13823          	sd	s10,208(sp)
    80001190:	0db13c23          	sd	s11,216(sp)
    80001194:	0fc13023          	sd	t3,224(sp)
    80001198:	0fd13423          	sd	t4,232(sp)
    8000119c:	0fe13823          	sd	t5,240(sp)
    800011a0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv12timerHandlerEv
    800011a4:	4e5010ef          	jal	ra,80002e88 <_ZN5Riscv12timerHandlerEv>

    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011a8:	00813083          	ld	ra,8(sp)
    800011ac:	01013103          	ld	sp,16(sp)
    800011b0:	01813183          	ld	gp,24(sp)
    800011b4:	02013203          	ld	tp,32(sp)
    800011b8:	02813283          	ld	t0,40(sp)
    800011bc:	03013303          	ld	t1,48(sp)
    800011c0:	03813383          	ld	t2,56(sp)
    800011c4:	04013403          	ld	s0,64(sp)
    800011c8:	04813483          	ld	s1,72(sp)
    800011cc:	05813583          	ld	a1,88(sp)
    800011d0:	06013603          	ld	a2,96(sp)
    800011d4:	06813683          	ld	a3,104(sp)
    800011d8:	07013703          	ld	a4,112(sp)
    800011dc:	07813783          	ld	a5,120(sp)
    800011e0:	08013803          	ld	a6,128(sp)
    800011e4:	08813883          	ld	a7,136(sp)
    800011e8:	09013903          	ld	s2,144(sp)
    800011ec:	09813983          	ld	s3,152(sp)
    800011f0:	0a013a03          	ld	s4,160(sp)
    800011f4:	0a813a83          	ld	s5,168(sp)
    800011f8:	0b013b03          	ld	s6,176(sp)
    800011fc:	0b813b83          	ld	s7,184(sp)
    80001200:	0c013c03          	ld	s8,192(sp)
    80001204:	0c813c83          	ld	s9,200(sp)
    80001208:	0d013d03          	ld	s10,208(sp)
    8000120c:	0d813d83          	ld	s11,216(sp)
    80001210:	0e013e03          	ld	t3,224(sp)
    80001214:	0e813e83          	ld	t4,232(sp)
    80001218:	0f013f03          	ld	t5,240(sp)
    8000121c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001220:	10010113          	addi	sp,sp,256

    sret
    80001224:	10200073          	sret

0000000080001228 <console>:

console:
    addi sp, sp, -256
    80001228:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    8000122c:	00113423          	sd	ra,8(sp)
    80001230:	00213823          	sd	sp,16(sp)
    80001234:	00313c23          	sd	gp,24(sp)
    80001238:	02413023          	sd	tp,32(sp)
    8000123c:	02513423          	sd	t0,40(sp)
    80001240:	02613823          	sd	t1,48(sp)
    80001244:	02713c23          	sd	t2,56(sp)
    80001248:	04813023          	sd	s0,64(sp)
    8000124c:	04913423          	sd	s1,72(sp)
    80001250:	04b13c23          	sd	a1,88(sp)
    80001254:	06c13023          	sd	a2,96(sp)
    80001258:	06d13423          	sd	a3,104(sp)
    8000125c:	06e13823          	sd	a4,112(sp)
    80001260:	06f13c23          	sd	a5,120(sp)
    80001264:	09013023          	sd	a6,128(sp)
    80001268:	09113423          	sd	a7,136(sp)
    8000126c:	09213823          	sd	s2,144(sp)
    80001270:	09313c23          	sd	s3,152(sp)
    80001274:	0b413023          	sd	s4,160(sp)
    80001278:	0b513423          	sd	s5,168(sp)
    8000127c:	0b613823          	sd	s6,176(sp)
    80001280:	0b713c23          	sd	s7,184(sp)
    80001284:	0d813023          	sd	s8,192(sp)
    80001288:	0d913423          	sd	s9,200(sp)
    8000128c:	0da13823          	sd	s10,208(sp)
    80001290:	0db13c23          	sd	s11,216(sp)
    80001294:	0fc13023          	sd	t3,224(sp)
    80001298:	0fd13423          	sd	t4,232(sp)
    8000129c:	0fe13823          	sd	t5,240(sp)
    800012a0:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv14consoleHandlerEv
    800012a4:	47d010ef          	jal	ra,80002f20 <_ZN5Riscv14consoleHandlerEv>

    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800012a8:	00813083          	ld	ra,8(sp)
    800012ac:	01013103          	ld	sp,16(sp)
    800012b0:	01813183          	ld	gp,24(sp)
    800012b4:	02013203          	ld	tp,32(sp)
    800012b8:	02813283          	ld	t0,40(sp)
    800012bc:	03013303          	ld	t1,48(sp)
    800012c0:	03813383          	ld	t2,56(sp)
    800012c4:	04013403          	ld	s0,64(sp)
    800012c8:	04813483          	ld	s1,72(sp)
    800012cc:	05813583          	ld	a1,88(sp)
    800012d0:	06013603          	ld	a2,96(sp)
    800012d4:	06813683          	ld	a3,104(sp)
    800012d8:	07013703          	ld	a4,112(sp)
    800012dc:	07813783          	ld	a5,120(sp)
    800012e0:	08013803          	ld	a6,128(sp)
    800012e4:	08813883          	ld	a7,136(sp)
    800012e8:	09013903          	ld	s2,144(sp)
    800012ec:	09813983          	ld	s3,152(sp)
    800012f0:	0a013a03          	ld	s4,160(sp)
    800012f4:	0a813a83          	ld	s5,168(sp)
    800012f8:	0b013b03          	ld	s6,176(sp)
    800012fc:	0b813b83          	ld	s7,184(sp)
    80001300:	0c013c03          	ld	s8,192(sp)
    80001304:	0c813c83          	ld	s9,200(sp)
    80001308:	0d013d03          	ld	s10,208(sp)
    8000130c:	0d813d83          	ld	s11,216(sp)
    80001310:	0e013e03          	ld	t3,224(sp)
    80001314:	0e813e83          	ld	t4,232(sp)
    80001318:	0f013f03          	ld	t5,240(sp)
    8000131c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001320:	10010113          	addi	sp,sp,256

    80001324:	10200073          	sret

0000000080001328 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001328:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    8000132c:	00b29a63          	bne	t0,a1,80001340 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001330:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001334:	fe029ae3          	bnez	t0,80001328 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001338:	00000513          	li	a0,0
    jr ra                  # Return.
    8000133c:	00008067          	ret

0000000080001340 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001340:	00100513          	li	a0,1
    80001344:	00008067          	ret

0000000080001348 <_Z9mem_allocm>:
//
// Created by os on 7/4/23.
//
#include "../h/syscall_c.hpp"

void *mem_alloc(size_t size) {
    80001348:	ff010113          	addi	sp,sp,-16
    8000134c:	00813423          	sd	s0,8(sp)
    80001350:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, a0");
    80001354:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x01");
    80001358:	00100513          	li	a0,1
    __asm__ volatile("ecall");
    8000135c:	00000073          	ecall
    void * retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    80001360:	00050513          	mv	a0,a0
    return retval;
}
    80001364:	00813403          	ld	s0,8(sp)
    80001368:	01010113          	addi	sp,sp,16
    8000136c:	00008067          	ret

0000000080001370 <_Z8mem_freePv>:

int mem_free(void * ptr) {
    80001370:	ff010113          	addi	sp,sp,-16
    80001374:	00813423          	sd	s0,8(sp)
    80001378:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, a0");
    8000137c:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x02");
    80001380:	00200513          	li	a0,2
    __asm__ volatile("ecall");
    80001384:	00000073          	ecall
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    80001388:	00050513          	mv	a0,a0
    return retval;
}
    8000138c:	0005051b          	sext.w	a0,a0
    80001390:	00813403          	ld	s0,8(sp)
    80001394:	01010113          	addi	sp,sp,16
    80001398:	00008067          	ret

000000008000139c <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    8000139c:	fd010113          	addi	sp,sp,-48
    800013a0:	02113423          	sd	ra,40(sp)
    800013a4:	02813023          	sd	s0,32(sp)
    800013a8:	00913c23          	sd	s1,24(sp)
    800013ac:	01213823          	sd	s2,16(sp)
    800013b0:	01313423          	sd	s3,8(sp)
    800013b4:	03010413          	addi	s0,sp,48
    800013b8:	00050493          	mv	s1,a0
    800013bc:	00058913          	mv	s2,a1
    800013c0:	00060993          	mv	s3,a2
    thread_t *hand = handle;
    uint64* body = (uint64*) start_routine;
    void* args = arg;
    uint64* stack = (uint64*) mem_alloc(DEFAULT_STACK_SIZE);
    800013c4:	00001537          	lui	a0,0x1
    800013c8:	00000097          	auipc	ra,0x0
    800013cc:	f80080e7          	jalr	-128(ra) # 80001348 <_Z9mem_allocm>
    if(stack == nullptr) return -1;
    800013d0:	04050663          	beqz	a0,8000141c <_Z13thread_createPP3TCBPFvPvES2_+0x80>
    stack+=DEFAULT_STACK_SIZE - 1;
    800013d4:	000087b7          	lui	a5,0x8
    800013d8:	ff878793          	addi	a5,a5,-8 # 7ff8 <_entry-0x7fff8008>
    800013dc:	00f507b3          	add	a5,a0,a5
    __asm__ volatile("mv a7, %[stack]" : : [stack] "r" (stack));
    800013e0:	00078893          	mv	a7,a5
    __asm__ volatile("mv a6, %[args]" : : [args] "r" (args));
    800013e4:	00098813          	mv	a6,s3
    __asm__ volatile("mv a2, %[body]" : : [body] "r" (body));
    800013e8:	00090613          	mv	a2,s2
    __asm__ volatile("mv a1, %[hand]" : : [hand] "r" (hand));
    800013ec:	00048593          	mv	a1,s1
    __asm__ volatile("li a0, 0x11");
    800013f0:	01100513          	li	a0,17
    __asm__ volatile("ecall");
    800013f4:	00000073          	ecall
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    800013f8:	00050513          	mv	a0,a0
    800013fc:	0005051b          	sext.w	a0,a0
    return retval;
}
    80001400:	02813083          	ld	ra,40(sp)
    80001404:	02013403          	ld	s0,32(sp)
    80001408:	01813483          	ld	s1,24(sp)
    8000140c:	01013903          	ld	s2,16(sp)
    80001410:	00813983          	ld	s3,8(sp)
    80001414:	03010113          	addi	sp,sp,48
    80001418:	00008067          	ret
    if(stack == nullptr) return -1;
    8000141c:	fff00513          	li	a0,-1
    80001420:	fe1ff06f          	j	80001400 <_Z13thread_createPP3TCBPFvPvES2_+0x64>

0000000080001424 <_Z11thread_exitv>:

int thread_exit() {
    80001424:	ff010113          	addi	sp,sp,-16
    80001428:	00813423          	sd	s0,8(sp)
    8000142c:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x12");
    80001430:	01200513          	li	a0,18
    __asm__ volatile("ecall");
    80001434:	00000073          	ecall
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    80001438:	00050513          	mv	a0,a0
    return retval;
}
    8000143c:	0005051b          	sext.w	a0,a0
    80001440:	00813403          	ld	s0,8(sp)
    80001444:	01010113          	addi	sp,sp,16
    80001448:	00008067          	ret

000000008000144c <_Z15thread_dispatchv>:

void thread_dispatch() {
    8000144c:	ff010113          	addi	sp,sp,-16
    80001450:	00813423          	sd	s0,8(sp)
    80001454:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x13");
    80001458:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    8000145c:	00000073          	ecall
}
    80001460:	00813403          	ld	s0,8(sp)
    80001464:	01010113          	addi	sp,sp,16
    80001468:	00008067          	ret

000000008000146c <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    8000146c:	ff010113          	addi	sp,sp,-16
    80001470:	00813423          	sd	s0,8(sp)
    80001474:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %[handle]" : : [handle] "r" (handle));
    80001478:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x14");
    8000147c:	01400513          	li	a0,20
    __asm__ volatile("ecall");
    80001480:	00000073          	ecall
}
    80001484:	00813403          	ld	s0,8(sp)
    80001488:	01010113          	addi	sp,sp,16
    8000148c:	00008067          	ret

0000000080001490 <_Z8sem_openPP3Semj>:

int sem_open(sem_t *handle, unsigned int init) {
    80001490:	ff010113          	addi	sp,sp,-16
    80001494:	00813423          	sd	s0,8(sp)
    80001498:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a7, %[init]" : : [init] "r" (init));
    8000149c:	00058893          	mv	a7,a1
    __asm__ volatile("mv a1, %[handle]" : : [handle] "r" (handle));
    800014a0:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x21");
    800014a4:	02100513          	li	a0,33
    __asm__ volatile("ecall");
    800014a8:	00000073          	ecall
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    800014ac:	00050513          	mv	a0,a0
    return retval;
}
    800014b0:	0005051b          	sext.w	a0,a0
    800014b4:	00813403          	ld	s0,8(sp)
    800014b8:	01010113          	addi	sp,sp,16
    800014bc:	00008067          	ret

00000000800014c0 <_Z9sem_closeP3Sem>:

int sem_close(sem_t handle) {
    800014c0:	ff010113          	addi	sp,sp,-16
    800014c4:	00813423          	sd	s0,8(sp)
    800014c8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %[handle]" : : [handle] "r" (handle));
    800014cc:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x22");
    800014d0:	02200513          	li	a0,34
    __asm__ volatile("ecall");
    800014d4:	00000073          	ecall
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    800014d8:	00050513          	mv	a0,a0
    return retval;
}
    800014dc:	0005051b          	sext.w	a0,a0
    800014e0:	00813403          	ld	s0,8(sp)
    800014e4:	01010113          	addi	sp,sp,16
    800014e8:	00008067          	ret

00000000800014ec <_Z8sem_waitP3Sem>:

int sem_wait(sem_t id) {
    800014ec:	ff010113          	addi	sp,sp,-16
    800014f0:	00813423          	sd	s0,8(sp)
    800014f4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %[id]" : : [id] "r" (id));
    800014f8:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x23");
    800014fc:	02300513          	li	a0,35
    __asm__ volatile("ecall");
    80001500:	00000073          	ecall
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    80001504:	00050513          	mv	a0,a0
    return retval;
}
    80001508:	0005051b          	sext.w	a0,a0
    8000150c:	00813403          	ld	s0,8(sp)
    80001510:	01010113          	addi	sp,sp,16
    80001514:	00008067          	ret

0000000080001518 <_Z10sem_signalP3Sem>:

int sem_signal(sem_t id) {
    80001518:	ff010113          	addi	sp,sp,-16
    8000151c:	00813423          	sd	s0,8(sp)
    80001520:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %[id]" : : [id] "r" (id));
    80001524:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x24");
    80001528:	02400513          	li	a0,36
    __asm__ volatile("ecall");
    8000152c:	00000073          	ecall
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    80001530:	00050513          	mv	a0,a0
    return retval;
}
    80001534:	0005051b          	sext.w	a0,a0
    80001538:	00813403          	ld	s0,8(sp)
    8000153c:	01010113          	addi	sp,sp,16
    80001540:	00008067          	ret

0000000080001544 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    80001544:	ff010113          	addi	sp,sp,-16
    80001548:	00813423          	sd	s0,8(sp)
    8000154c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %[time]" : : [time] "r" (time));
    80001550:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x31");
    80001554:	03100513          	li	a0,49
    __asm__ volatile("ecall");
    80001558:	00000073          	ecall
    int retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    8000155c:	00050513          	mv	a0,a0
    return retval;
}
    80001560:	0005051b          	sext.w	a0,a0
    80001564:	00813403          	ld	s0,8(sp)
    80001568:	01010113          	addi	sp,sp,16
    8000156c:	00008067          	ret

0000000080001570 <_Z4getcv>:

char getc() {
    80001570:	ff010113          	addi	sp,sp,-16
    80001574:	00813423          	sd	s0,8(sp)
    80001578:	01010413          	addi	s0,sp,16
    __asm__ volatile("li a0, 0x41");
    8000157c:	04100513          	li	a0,65
    __asm__ volatile("ecall");
    80001580:	00000073          	ecall
    char retval;
    __asm__ volatile("mv %[ret], a0" : [ret] "=r" (retval));
    80001584:	00050513          	mv	a0,a0
    return retval;
}
    80001588:	0ff57513          	andi	a0,a0,255
    8000158c:	00813403          	ld	s0,8(sp)
    80001590:	01010113          	addi	sp,sp,16
    80001594:	00008067          	ret

0000000080001598 <_Z4putcc>:

void putc(char c) {
    80001598:	ff010113          	addi	sp,sp,-16
    8000159c:	00813423          	sd	s0,8(sp)
    800015a0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %[c]" : : [c] "r" (c));
    800015a4:	00050593          	mv	a1,a0
    __asm__ volatile("li a0, 0x42");
    800015a8:	04200513          	li	a0,66
    __asm__ volatile("ecall");
    800015ac:	00000073          	ecall
}
    800015b0:	00813403          	ld	s0,8(sp)
    800015b4:	01010113          	addi	sp,sp,16
    800015b8:	00008067          	ret

00000000800015bc <_ZN7KBufferC1Ei>:
// Created by os on 8/14/23.
//

#include "../h/KBuffer.h"

KBuffer::KBuffer(int _cap) : cap(_cap+1), head(0), tail(0) {
    800015bc:	fe010113          	addi	sp,sp,-32
    800015c0:	00113c23          	sd	ra,24(sp)
    800015c4:	00813823          	sd	s0,16(sp)
    800015c8:	00913423          	sd	s1,8(sp)
    800015cc:	01213023          	sd	s2,0(sp)
    800015d0:	02010413          	addi	s0,sp,32
    800015d4:	00050493          	mv	s1,a0
    800015d8:	00058913          	mv	s2,a1
    800015dc:	0015879b          	addiw	a5,a1,1
    800015e0:	0007851b          	sext.w	a0,a5
    800015e4:	00f4a023          	sw	a5,0(s1)
    800015e8:	0004a823          	sw	zero,16(s1)
    800015ec:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)MemoryAllocator::mem_alloc(sizeof(int) * cap);
    800015f0:	00251513          	slli	a0,a0,0x2
    800015f4:	00002097          	auipc	ra,0x2
    800015f8:	a2c080e7          	jalr	-1492(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
    800015fc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Sem(0);
    80001600:	01800513          	li	a0,24
    80001604:	00000097          	auipc	ra,0x0
    80001608:	508080e7          	jalr	1288(ra) # 80001b0c <_ZN3SemnwEm>

#include "TCB.h"

class Sem {
private:
    Sem (int initValue=1) : val(initValue) {
    8000160c:	00052823          	sw	zero,16(a0) # 1010 <_entry-0x7fffeff0>
        head = tail = 0;
    80001610:	00053423          	sd	zero,8(a0)
    80001614:	00053023          	sd	zero,0(a0)
    80001618:	02a4b023          	sd	a0,32(s1)
    spaceAvailable = new Sem(_cap);
    8000161c:	01800513          	li	a0,24
    80001620:	00000097          	auipc	ra,0x0
    80001624:	4ec080e7          	jalr	1260(ra) # 80001b0c <_ZN3SemnwEm>
    Sem (int initValue=1) : val(initValue) {
    80001628:	01252823          	sw	s2,16(a0)
        head = tail = 0;
    8000162c:	00053423          	sd	zero,8(a0)
    80001630:	00053023          	sd	zero,0(a0)
    80001634:	00a4bc23          	sd	a0,24(s1)
    mutexHead = new Sem(1);
    80001638:	01800513          	li	a0,24
    8000163c:	00000097          	auipc	ra,0x0
    80001640:	4d0080e7          	jalr	1232(ra) # 80001b0c <_ZN3SemnwEm>
    Sem (int initValue=1) : val(initValue) {
    80001644:	00100913          	li	s2,1
    80001648:	01252823          	sw	s2,16(a0)
        head = tail = 0;
    8000164c:	00053423          	sd	zero,8(a0)
    80001650:	00053023          	sd	zero,0(a0)
    80001654:	02a4b423          	sd	a0,40(s1)
    mutexTail = new Sem(1);
    80001658:	01800513          	li	a0,24
    8000165c:	00000097          	auipc	ra,0x0
    80001660:	4b0080e7          	jalr	1200(ra) # 80001b0c <_ZN3SemnwEm>
    Sem (int initValue=1) : val(initValue) {
    80001664:	01252823          	sw	s2,16(a0)
        head = tail = 0;
    80001668:	00053423          	sd	zero,8(a0)
    8000166c:	00053023          	sd	zero,0(a0)
    80001670:	02a4b823          	sd	a0,48(s1)
}
    80001674:	01813083          	ld	ra,24(sp)
    80001678:	01013403          	ld	s0,16(sp)
    8000167c:	00813483          	ld	s1,8(sp)
    80001680:	00013903          	ld	s2,0(sp)
    80001684:	02010113          	addi	sp,sp,32
    80001688:	00008067          	ret

000000008000168c <_ZN7KBuffer3putEi>:

void KBuffer::put(int val) {
    8000168c:	fe010113          	addi	sp,sp,-32
    80001690:	00113c23          	sd	ra,24(sp)
    80001694:	00813823          	sd	s0,16(sp)
    80001698:	00913423          	sd	s1,8(sp)
    8000169c:	01213023          	sd	s2,0(sp)
    800016a0:	02010413          	addi	s0,sp,32
    800016a4:	00050493          	mv	s1,a0
    800016a8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800016ac:	01853503          	ld	a0,24(a0)
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	590080e7          	jalr	1424(ra) # 80001c40 <_ZN3Sem4waitEv>

    mutexTail->wait();
    800016b8:	0304b503          	ld	a0,48(s1)
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	584080e7          	jalr	1412(ra) # 80001c40 <_ZN3Sem4waitEv>
    buffer[tail] = val;
    800016c4:	0084b783          	ld	a5,8(s1)
    800016c8:	0144a703          	lw	a4,20(s1)
    800016cc:	00271713          	slli	a4,a4,0x2
    800016d0:	00e787b3          	add	a5,a5,a4
    800016d4:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800016d8:	0144a783          	lw	a5,20(s1)
    800016dc:	0017879b          	addiw	a5,a5,1
    800016e0:	0004a703          	lw	a4,0(s1)
    800016e4:	02e7e7bb          	remw	a5,a5,a4
    800016e8:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800016ec:	0304b503          	ld	a0,48(s1)
    800016f0:	00000097          	auipc	ra,0x0
    800016f4:	6b0080e7          	jalr	1712(ra) # 80001da0 <_ZN3Sem6signalEv>

    itemAvailable->signal();
    800016f8:	0204b503          	ld	a0,32(s1)
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	6a4080e7          	jalr	1700(ra) # 80001da0 <_ZN3Sem6signalEv>
}
    80001704:	01813083          	ld	ra,24(sp)
    80001708:	01013403          	ld	s0,16(sp)
    8000170c:	00813483          	ld	s1,8(sp)
    80001710:	00013903          	ld	s2,0(sp)
    80001714:	02010113          	addi	sp,sp,32
    80001718:	00008067          	ret

000000008000171c <_ZN7KBuffer3getEv>:

int KBuffer::get() {
    8000171c:	fe010113          	addi	sp,sp,-32
    80001720:	00113c23          	sd	ra,24(sp)
    80001724:	00813823          	sd	s0,16(sp)
    80001728:	00913423          	sd	s1,8(sp)
    8000172c:	01213023          	sd	s2,0(sp)
    80001730:	02010413          	addi	s0,sp,32
    80001734:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80001738:	02053503          	ld	a0,32(a0)
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	504080e7          	jalr	1284(ra) # 80001c40 <_ZN3Sem4waitEv>

    mutexHead->wait();
    80001744:	0284b503          	ld	a0,40(s1)
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	4f8080e7          	jalr	1272(ra) # 80001c40 <_ZN3Sem4waitEv>

    int ret = buffer[head];
    80001750:	0084b703          	ld	a4,8(s1)
    80001754:	0104a783          	lw	a5,16(s1)
    80001758:	00279693          	slli	a3,a5,0x2
    8000175c:	00d70733          	add	a4,a4,a3
    80001760:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80001764:	0017879b          	addiw	a5,a5,1
    80001768:	0004a703          	lw	a4,0(s1)
    8000176c:	02e7e7bb          	remw	a5,a5,a4
    80001770:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80001774:	0284b503          	ld	a0,40(s1)
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	628080e7          	jalr	1576(ra) # 80001da0 <_ZN3Sem6signalEv>

    spaceAvailable->signal();
    80001780:	0184b503          	ld	a0,24(s1)
    80001784:	00000097          	auipc	ra,0x0
    80001788:	61c080e7          	jalr	1564(ra) # 80001da0 <_ZN3Sem6signalEv>

    return ret;
}
    8000178c:	00090513          	mv	a0,s2
    80001790:	01813083          	ld	ra,24(sp)
    80001794:	01013403          	ld	s0,16(sp)
    80001798:	00813483          	ld	s1,8(sp)
    8000179c:	00013903          	ld	s2,0(sp)
    800017a0:	02010113          	addi	sp,sp,32
    800017a4:	00008067          	ret

00000000800017a8 <_ZN7KBuffer6getCntEv>:

int KBuffer::getCnt() {
    800017a8:	fe010113          	addi	sp,sp,-32
    800017ac:	00113c23          	sd	ra,24(sp)
    800017b0:	00813823          	sd	s0,16(sp)
    800017b4:	00913423          	sd	s1,8(sp)
    800017b8:	01213023          	sd	s2,0(sp)
    800017bc:	02010413          	addi	s0,sp,32
    800017c0:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800017c4:	02853503          	ld	a0,40(a0)
    800017c8:	00000097          	auipc	ra,0x0
    800017cc:	478080e7          	jalr	1144(ra) # 80001c40 <_ZN3Sem4waitEv>
    mutexTail->wait();
    800017d0:	0304b503          	ld	a0,48(s1)
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	46c080e7          	jalr	1132(ra) # 80001c40 <_ZN3Sem4waitEv>

    if (tail >= head) {
    800017dc:	0144a783          	lw	a5,20(s1)
    800017e0:	0104a903          	lw	s2,16(s1)
    800017e4:	0327ce63          	blt	a5,s2,80001820 <_ZN7KBuffer6getCntEv+0x78>
        ret = tail - head;
    800017e8:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800017ec:	0304b503          	ld	a0,48(s1)
    800017f0:	00000097          	auipc	ra,0x0
    800017f4:	5b0080e7          	jalr	1456(ra) # 80001da0 <_ZN3Sem6signalEv>
    mutexHead->signal();
    800017f8:	0284b503          	ld	a0,40(s1)
    800017fc:	00000097          	auipc	ra,0x0
    80001800:	5a4080e7          	jalr	1444(ra) # 80001da0 <_ZN3Sem6signalEv>

    return ret;
}
    80001804:	00090513          	mv	a0,s2
    80001808:	01813083          	ld	ra,24(sp)
    8000180c:	01013403          	ld	s0,16(sp)
    80001810:	00813483          	ld	s1,8(sp)
    80001814:	00013903          	ld	s2,0(sp)
    80001818:	02010113          	addi	sp,sp,32
    8000181c:	00008067          	ret
        ret = cap - head + tail;
    80001820:	0004a703          	lw	a4,0(s1)
    80001824:	4127093b          	subw	s2,a4,s2
    80001828:	00f9093b          	addw	s2,s2,a5
    8000182c:	fc1ff06f          	j	800017ec <_ZN7KBuffer6getCntEv+0x44>

0000000080001830 <_ZN7KBuffer7isEmptyEv>:

bool KBuffer::isEmpty() {
    80001830:	ff010113          	addi	sp,sp,-16
    80001834:	00113423          	sd	ra,8(sp)
    80001838:	00813023          	sd	s0,0(sp)
    8000183c:	01010413          	addi	s0,sp,16
    return getCnt() == 0;
    80001840:	00000097          	auipc	ra,0x0
    80001844:	f68080e7          	jalr	-152(ra) # 800017a8 <_ZN7KBuffer6getCntEv>
}
    80001848:	00153513          	seqz	a0,a0
    8000184c:	00813083          	ld	ra,8(sp)
    80001850:	00013403          	ld	s0,0(sp)
    80001854:	01010113          	addi	sp,sp,16
    80001858:	00008067          	ret

000000008000185c <_ZN7KBuffer6isFullEv>:

bool KBuffer::isFull() {
    8000185c:	fe010113          	addi	sp,sp,-32
    80001860:	00113c23          	sd	ra,24(sp)
    80001864:	00813823          	sd	s0,16(sp)
    80001868:	00913423          	sd	s1,8(sp)
    8000186c:	02010413          	addi	s0,sp,32
    80001870:	00050493          	mv	s1,a0
    return getCnt() == cap-1;
    80001874:	00000097          	auipc	ra,0x0
    80001878:	f34080e7          	jalr	-204(ra) # 800017a8 <_ZN7KBuffer6getCntEv>
    8000187c:	0004a783          	lw	a5,0(s1)
    80001880:	fff7879b          	addiw	a5,a5,-1
    80001884:	40a78533          	sub	a0,a5,a0
}
    80001888:	00153513          	seqz	a0,a0
    8000188c:	01813083          	ld	ra,24(sp)
    80001890:	01013403          	ld	s0,16(sp)
    80001894:	00813483          	ld	s1,8(sp)
    80001898:	02010113          	addi	sp,sp,32
    8000189c:	00008067          	ret

00000000800018a0 <_ZN7KBufferD1Ev>:

KBuffer::~KBuffer() {
    800018a0:	fe010113          	addi	sp,sp,-32
    800018a4:	00113c23          	sd	ra,24(sp)
    800018a8:	00813823          	sd	s0,16(sp)
    800018ac:	00913423          	sd	s1,8(sp)
    800018b0:	01213023          	sd	s2,0(sp)
    800018b4:	02010413          	addi	s0,sp,32
    800018b8:	00050493          	mv	s1,a0
    delete spaceAvailable;
    800018bc:	01853903          	ld	s2,24(a0)
    800018c0:	00090e63          	beqz	s2,800018dc <_ZN7KBufferD1Ev+0x3c>
    800018c4:	00090513          	mv	a0,s2
    800018c8:	00000097          	auipc	ra,0x0
    800018cc:	44c080e7          	jalr	1100(ra) # 80001d14 <_ZN3SemD1Ev>
    800018d0:	00090513          	mv	a0,s2
    800018d4:	00000097          	auipc	ra,0x0
    800018d8:	260080e7          	jalr	608(ra) # 80001b34 <_ZN3SemdlEPv>
    delete itemAvailable;
    800018dc:	0204b903          	ld	s2,32(s1)
    800018e0:	00090e63          	beqz	s2,800018fc <_ZN7KBufferD1Ev+0x5c>
    800018e4:	00090513          	mv	a0,s2
    800018e8:	00000097          	auipc	ra,0x0
    800018ec:	42c080e7          	jalr	1068(ra) # 80001d14 <_ZN3SemD1Ev>
    800018f0:	00090513          	mv	a0,s2
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	240080e7          	jalr	576(ra) # 80001b34 <_ZN3SemdlEPv>
    delete mutexHead;
    800018fc:	0284b903          	ld	s2,40(s1)
    80001900:	00090e63          	beqz	s2,8000191c <_ZN7KBufferD1Ev+0x7c>
    80001904:	00090513          	mv	a0,s2
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	40c080e7          	jalr	1036(ra) # 80001d14 <_ZN3SemD1Ev>
    80001910:	00090513          	mv	a0,s2
    80001914:	00000097          	auipc	ra,0x0
    80001918:	220080e7          	jalr	544(ra) # 80001b34 <_ZN3SemdlEPv>
    delete mutexTail;
    8000191c:	0304b483          	ld	s1,48(s1)
    80001920:	00048e63          	beqz	s1,8000193c <_ZN7KBufferD1Ev+0x9c>
    80001924:	00048513          	mv	a0,s1
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	3ec080e7          	jalr	1004(ra) # 80001d14 <_ZN3SemD1Ev>
    80001930:	00048513          	mv	a0,s1
    80001934:	00000097          	auipc	ra,0x0
    80001938:	200080e7          	jalr	512(ra) # 80001b34 <_ZN3SemdlEPv>
}
    8000193c:	01813083          	ld	ra,24(sp)
    80001940:	01013403          	ld	s0,16(sp)
    80001944:	00813483          	ld	s1,8(sp)
    80001948:	00013903          	ld	s2,0(sp)
    8000194c:	02010113          	addi	sp,sp,32
    80001950:	00008067          	ret

0000000080001954 <_ZN7KBuffernwEm>:

void *KBuffer::operator new(size_t size) {
    80001954:	ff010113          	addi	sp,sp,-16
    80001958:	00113423          	sd	ra,8(sp)
    8000195c:	00813023          	sd	s0,0(sp)
    80001960:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80001964:	00001097          	auipc	ra,0x1
    80001968:	6bc080e7          	jalr	1724(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
}
    8000196c:	00813083          	ld	ra,8(sp)
    80001970:	00013403          	ld	s0,0(sp)
    80001974:	01010113          	addi	sp,sp,16
    80001978:	00008067          	ret

000000008000197c <_ZN7KBufferdlEPv>:

void KBuffer::operator delete(void *ptr) {
    8000197c:	ff010113          	addi	sp,sp,-16
    80001980:	00113423          	sd	ra,8(sp)
    80001984:	00813023          	sd	s0,0(sp)
    80001988:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    8000198c:	00002097          	auipc	ra,0x2
    80001990:	818080e7          	jalr	-2024(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001994:	00813083          	ld	ra,8(sp)
    80001998:	00013403          	ld	s0,0(sp)
    8000199c:	01010113          	addi	sp,sp,16
    800019a0:	00008067          	ret

00000000800019a4 <_ZN8KConsole7putcharEc>:
#include "../h/KConsole.h"

KBuffer* KConsole::inputBuffer = nullptr;
KBuffer* KConsole::outputBuffer = nullptr;

void KConsole::putchar(char c) {
    800019a4:	ff010113          	addi	sp,sp,-16
    800019a8:	00113423          	sd	ra,8(sp)
    800019ac:	00813023          	sd	s0,0(sp)
    800019b0:	01010413          	addi	s0,sp,16
    800019b4:	00050593          	mv	a1,a0
    inputBuffer->put(c);
    800019b8:	0000a517          	auipc	a0,0xa
    800019bc:	13853503          	ld	a0,312(a0) # 8000baf0 <_ZN8KConsole11inputBufferE>
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	ccc080e7          	jalr	-820(ra) # 8000168c <_ZN7KBuffer3putEi>
    while(((*(char*) CONSOLE_STATUS) & 0x20) && !KConsole::inputBuffer->isEmpty()){
    800019c8:	0000a797          	auipc	a5,0xa
    800019cc:	0a87b783          	ld	a5,168(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x10>
    800019d0:	0007b783          	ld	a5,0(a5)
    800019d4:	0007c783          	lbu	a5,0(a5)
    800019d8:	0207f793          	andi	a5,a5,32
    800019dc:	02078e63          	beqz	a5,80001a18 <_ZN8KConsole7putcharEc+0x74>
    800019e0:	0000a517          	auipc	a0,0xa
    800019e4:	11053503          	ld	a0,272(a0) # 8000baf0 <_ZN8KConsole11inputBufferE>
    800019e8:	00000097          	auipc	ra,0x0
    800019ec:	e48080e7          	jalr	-440(ra) # 80001830 <_ZN7KBuffer7isEmptyEv>
    800019f0:	02051463          	bnez	a0,80001a18 <_ZN8KConsole7putcharEc+0x74>
        (*(char*) CONSOLE_TX_DATA) = KConsole::inputBuffer->get();
    800019f4:	0000a517          	auipc	a0,0xa
    800019f8:	0fc53503          	ld	a0,252(a0) # 8000baf0 <_ZN8KConsole11inputBufferE>
    800019fc:	00000097          	auipc	ra,0x0
    80001a00:	d20080e7          	jalr	-736(ra) # 8000171c <_ZN7KBuffer3getEv>
    80001a04:	0000a797          	auipc	a5,0xa
    80001a08:	07c7b783          	ld	a5,124(a5) # 8000ba80 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001a0c:	0007b783          	ld	a5,0(a5)
    80001a10:	00a78023          	sb	a0,0(a5)
    while(((*(char*) CONSOLE_STATUS) & 0x20) && !KConsole::inputBuffer->isEmpty()){
    80001a14:	fb5ff06f          	j	800019c8 <_ZN8KConsole7putcharEc+0x24>
    }
}
    80001a18:	00813083          	ld	ra,8(sp)
    80001a1c:	00013403          	ld	s0,0(sp)
    80001a20:	01010113          	addi	sp,sp,16
    80001a24:	00008067          	ret

0000000080001a28 <_ZN8KConsole7getcharEv>:

char KConsole::getchar() {
    80001a28:	ff010113          	addi	sp,sp,-16
    80001a2c:	00113423          	sd	ra,8(sp)
    80001a30:	00813023          	sd	s0,0(sp)
    80001a34:	01010413          	addi	s0,sp,16
    return outputBuffer->get();
    80001a38:	0000a517          	auipc	a0,0xa
    80001a3c:	0c053503          	ld	a0,192(a0) # 8000baf8 <_ZN8KConsole12outputBufferE>
    80001a40:	00000097          	auipc	ra,0x0
    80001a44:	cdc080e7          	jalr	-804(ra) # 8000171c <_ZN7KBuffer3getEv>
}
    80001a48:	0ff57513          	andi	a0,a0,255
    80001a4c:	00813083          	ld	ra,8(sp)
    80001a50:	00013403          	ld	s0,0(sp)
    80001a54:	01010113          	addi	sp,sp,16
    80001a58:	00008067          	ret

0000000080001a5c <_ZN8KConsole4initEv>:

void KConsole::init() {
    80001a5c:	fe010113          	addi	sp,sp,-32
    80001a60:	00113c23          	sd	ra,24(sp)
    80001a64:	00813823          	sd	s0,16(sp)
    80001a68:	00913423          	sd	s1,8(sp)
    80001a6c:	01213023          	sd	s2,0(sp)
    80001a70:	02010413          	addi	s0,sp,32
    inputBuffer = new KBuffer(1000);
    80001a74:	03800513          	li	a0,56
    80001a78:	00000097          	auipc	ra,0x0
    80001a7c:	edc080e7          	jalr	-292(ra) # 80001954 <_ZN7KBuffernwEm>
    80001a80:	00050493          	mv	s1,a0
    80001a84:	3e800593          	li	a1,1000
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	b34080e7          	jalr	-1228(ra) # 800015bc <_ZN7KBufferC1Ei>
    80001a90:	0000a797          	auipc	a5,0xa
    80001a94:	0697b023          	sd	s1,96(a5) # 8000baf0 <_ZN8KConsole11inputBufferE>
    outputBuffer = new KBuffer(1000);
    80001a98:	03800513          	li	a0,56
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	eb8080e7          	jalr	-328(ra) # 80001954 <_ZN7KBuffernwEm>
    80001aa4:	00050493          	mv	s1,a0
    80001aa8:	3e800593          	li	a1,1000
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	b10080e7          	jalr	-1264(ra) # 800015bc <_ZN7KBufferC1Ei>
    80001ab4:	0000a797          	auipc	a5,0xa
    80001ab8:	0497b223          	sd	s1,68(a5) # 8000baf8 <_ZN8KConsole12outputBufferE>
}
    80001abc:	01813083          	ld	ra,24(sp)
    80001ac0:	01013403          	ld	s0,16(sp)
    80001ac4:	00813483          	ld	s1,8(sp)
    80001ac8:	00013903          	ld	s2,0(sp)
    80001acc:	02010113          	addi	sp,sp,32
    80001ad0:	00008067          	ret
    80001ad4:	00050913          	mv	s2,a0
    inputBuffer = new KBuffer(1000);
    80001ad8:	00048513          	mv	a0,s1
    80001adc:	00000097          	auipc	ra,0x0
    80001ae0:	ea0080e7          	jalr	-352(ra) # 8000197c <_ZN7KBufferdlEPv>
    80001ae4:	00090513          	mv	a0,s2
    80001ae8:	0000b097          	auipc	ra,0xb
    80001aec:	160080e7          	jalr	352(ra) # 8000cc48 <_Unwind_Resume>
    80001af0:	00050913          	mv	s2,a0
    outputBuffer = new KBuffer(1000);
    80001af4:	00048513          	mv	a0,s1
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	e84080e7          	jalr	-380(ra) # 8000197c <_ZN7KBufferdlEPv>
    80001b00:	00090513          	mv	a0,s2
    80001b04:	0000b097          	auipc	ra,0xb
    80001b08:	144080e7          	jalr	324(ra) # 8000cc48 <_Unwind_Resume>

0000000080001b0c <_ZN3SemnwEm>:
    if(head == nullptr)
        tail = nullptr;
    return data;
}

void *Sem::operator new(size_t size) {
    80001b0c:	ff010113          	addi	sp,sp,-16
    80001b10:	00113423          	sd	ra,8(sp)
    80001b14:	00813023          	sd	s0,0(sp)
    80001b18:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80001b1c:	00001097          	auipc	ra,0x1
    80001b20:	504080e7          	jalr	1284(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
}
    80001b24:	00813083          	ld	ra,8(sp)
    80001b28:	00013403          	ld	s0,0(sp)
    80001b2c:	01010113          	addi	sp,sp,16
    80001b30:	00008067          	ret

0000000080001b34 <_ZN3SemdlEPv>:

void Sem::operator delete(void *ptr) {
    80001b34:	ff010113          	addi	sp,sp,-16
    80001b38:	00113423          	sd	ra,8(sp)
    80001b3c:	00813023          	sd	s0,0(sp)
    80001b40:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    80001b44:	00001097          	auipc	ra,0x1
    80001b48:	660080e7          	jalr	1632(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001b4c:	00813083          	ld	ra,8(sp)
    80001b50:	00013403          	ld	s0,0(sp)
    80001b54:	01010113          	addi	sp,sp,16
    80001b58:	00008067          	ret

0000000080001b5c <_ZN3Sem4NodenwEm>:

void *Sem::Node::operator new(size_t size) {
    80001b5c:	ff010113          	addi	sp,sp,-16
    80001b60:	00113423          	sd	ra,8(sp)
    80001b64:	00813023          	sd	s0,0(sp)
    80001b68:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80001b6c:	00001097          	auipc	ra,0x1
    80001b70:	4b4080e7          	jalr	1204(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
}
    80001b74:	00813083          	ld	ra,8(sp)
    80001b78:	00013403          	ld	s0,0(sp)
    80001b7c:	01010113          	addi	sp,sp,16
    80001b80:	00008067          	ret

0000000080001b84 <_ZN3Sem3putEP3TCB>:
void Sem::put(TCB *data) {
    80001b84:	fe010113          	addi	sp,sp,-32
    80001b88:	00113c23          	sd	ra,24(sp)
    80001b8c:	00813823          	sd	s0,16(sp)
    80001b90:	00913423          	sd	s1,8(sp)
    80001b94:	01213023          	sd	s2,0(sp)
    80001b98:	02010413          	addi	s0,sp,32
    80001b9c:	00050493          	mv	s1,a0
    80001ba0:	00058913          	mv	s2,a1
    Node* cur = new Node();
    80001ba4:	01000513          	li	a0,16
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	fb4080e7          	jalr	-76(ra) # 80001b5c <_ZN3Sem4NodenwEm>
        TCB* data;
        Node* next;

        Node(){
            data = nullptr;
            next = nullptr;
    80001bb0:	00053423          	sd	zero,8(a0)
    cur->data = data;
    80001bb4:	01253023          	sd	s2,0(a0)
    if(!tail)
    80001bb8:	0084b783          	ld	a5,8(s1)
    80001bbc:	02078463          	beqz	a5,80001be4 <_ZN3Sem3putEP3TCB+0x60>
        tail->next = cur;
    80001bc0:	00a7b423          	sd	a0,8(a5)
        tail = cur;
    80001bc4:	00a4b423          	sd	a0,8(s1)
        tail->next = nullptr;
    80001bc8:	00053423          	sd	zero,8(a0)
}
    80001bcc:	01813083          	ld	ra,24(sp)
    80001bd0:	01013403          	ld	s0,16(sp)
    80001bd4:	00813483          	ld	s1,8(sp)
    80001bd8:	00013903          	ld	s2,0(sp)
    80001bdc:	02010113          	addi	sp,sp,32
    80001be0:	00008067          	ret
        head = tail = cur;
    80001be4:	00a4b423          	sd	a0,8(s1)
    80001be8:	00a4b023          	sd	a0,0(s1)
    80001bec:	fe1ff06f          	j	80001bcc <_ZN3Sem3putEP3TCB+0x48>

0000000080001bf0 <_ZN3Sem5blockEv>:
void Sem::block () {
    80001bf0:	fe010113          	addi	sp,sp,-32
    80001bf4:	00113c23          	sd	ra,24(sp)
    80001bf8:	00813823          	sd	s0,16(sp)
    80001bfc:	00913423          	sd	s1,8(sp)
    80001c00:	02010413          	addi	s0,sp,32
    put(TCB::running);
    80001c04:	0000a497          	auipc	s1,0xa
    80001c08:	e9c4b483          	ld	s1,-356(s1) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001c0c:	0004b583          	ld	a1,0(s1)
    80001c10:	00000097          	auipc	ra,0x0
    80001c14:	f74080e7          	jalr	-140(ra) # 80001b84 <_ZN3Sem3putEP3TCB>
    TCB::running->setState(TCB::STATE::BLOCKED);
    80001c18:	0004b783          	ld	a5,0(s1)
    STATE state;
    Node * head;
    bool retFromClosedSem;

    bool isFinished() const { return state == STATE::FINISHED; }
    void setState(STATE value) { state = value; }
    80001c1c:	00200713          	li	a4,2
    80001c20:	02e7ac23          	sw	a4,56(a5)
    TCB::dispatch();
    80001c24:	00001097          	auipc	ra,0x1
    80001c28:	cb8080e7          	jalr	-840(ra) # 800028dc <_ZN3TCB8dispatchEv>
}
    80001c2c:	01813083          	ld	ra,24(sp)
    80001c30:	01013403          	ld	s0,16(sp)
    80001c34:	00813483          	ld	s1,8(sp)
    80001c38:	02010113          	addi	sp,sp,32
    80001c3c:	00008067          	ret

0000000080001c40 <_ZN3Sem4waitEv>:
    if (--val<0) {
    80001c40:	01052783          	lw	a5,16(a0)
    80001c44:	fff7879b          	addiw	a5,a5,-1
    80001c48:	00f52823          	sw	a5,16(a0)
    80001c4c:	02079713          	slli	a4,a5,0x20
    80001c50:	00074463          	bltz	a4,80001c58 <_ZN3Sem4waitEv+0x18>
    80001c54:	00008067          	ret
void Sem::wait () {
    80001c58:	ff010113          	addi	sp,sp,-16
    80001c5c:	00113423          	sd	ra,8(sp)
    80001c60:	00813023          	sd	s0,0(sp)
    80001c64:	01010413          	addi	s0,sp,16
        block();
    80001c68:	00000097          	auipc	ra,0x0
    80001c6c:	f88080e7          	jalr	-120(ra) # 80001bf0 <_ZN3Sem5blockEv>
}
    80001c70:	00813083          	ld	ra,8(sp)
    80001c74:	00013403          	ld	s0,0(sp)
    80001c78:	01010113          	addi	sp,sp,16
    80001c7c:	00008067          	ret

0000000080001c80 <_ZN3Sem4NodedlEPv>:

void Sem::Node::operator delete(void *ptr) {
    80001c80:	ff010113          	addi	sp,sp,-16
    80001c84:	00113423          	sd	ra,8(sp)
    80001c88:	00813023          	sd	s0,0(sp)
    80001c8c:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    80001c90:	00001097          	auipc	ra,0x1
    80001c94:	514080e7          	jalr	1300(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001c98:	00813083          	ld	ra,8(sp)
    80001c9c:	00013403          	ld	s0,0(sp)
    80001ca0:	01010113          	addi	sp,sp,16
    80001ca4:	00008067          	ret

0000000080001ca8 <_ZN3Sem3getEv>:
TCB *Sem::get() {
    80001ca8:	fe010113          	addi	sp,sp,-32
    80001cac:	00113c23          	sd	ra,24(sp)
    80001cb0:	00813823          	sd	s0,16(sp)
    80001cb4:	00913423          	sd	s1,8(sp)
    80001cb8:	01213023          	sd	s2,0(sp)
    80001cbc:	02010413          	addi	s0,sp,32
    80001cc0:	00050493          	mv	s1,a0
    if(!head) return nullptr;
    80001cc4:	00053503          	ld	a0,0(a0)
    80001cc8:	04050263          	beqz	a0,80001d0c <_ZN3Sem3getEv+0x64>
    TCB* data = head->data;
    80001ccc:	00053903          	ld	s2,0(a0)
    head = head->next;
    80001cd0:	00853783          	ld	a5,8(a0)
    80001cd4:	00f4b023          	sd	a5,0(s1)
    delete prev;
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	fa8080e7          	jalr	-88(ra) # 80001c80 <_ZN3Sem4NodedlEPv>
    if(head == nullptr)
    80001ce0:	0004b783          	ld	a5,0(s1)
    80001ce4:	02078063          	beqz	a5,80001d04 <_ZN3Sem3getEv+0x5c>
}
    80001ce8:	00090513          	mv	a0,s2
    80001cec:	01813083          	ld	ra,24(sp)
    80001cf0:	01013403          	ld	s0,16(sp)
    80001cf4:	00813483          	ld	s1,8(sp)
    80001cf8:	00013903          	ld	s2,0(sp)
    80001cfc:	02010113          	addi	sp,sp,32
    80001d00:	00008067          	ret
        tail = nullptr;
    80001d04:	0004b423          	sd	zero,8(s1)
    80001d08:	fe1ff06f          	j	80001ce8 <_ZN3Sem3getEv+0x40>
    if(!head) return nullptr;
    80001d0c:	00050913          	mv	s2,a0
    80001d10:	fd9ff06f          	j	80001ce8 <_ZN3Sem3getEv+0x40>

0000000080001d14 <_ZN3SemD1Ev>:
Sem::~Sem () {
    80001d14:	fe010113          	addi	sp,sp,-32
    80001d18:	00113c23          	sd	ra,24(sp)
    80001d1c:	00813823          	sd	s0,16(sp)
    80001d20:	00913423          	sd	s1,8(sp)
    80001d24:	02010413          	addi	s0,sp,32
    80001d28:	00050493          	mv	s1,a0
    while((t = get()) != nullptr){
    80001d2c:	00048513          	mv	a0,s1
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	f78080e7          	jalr	-136(ra) # 80001ca8 <_ZN3Sem3getEv>
    80001d38:	00050e63          	beqz	a0,80001d54 <_ZN3SemD1Ev+0x40>
    80001d3c:	00100793          	li	a5,1
    80001d40:	02f52c23          	sw	a5,56(a0)
        t->retFromClosedSem = true;
    80001d44:	04f50423          	sb	a5,72(a0)
        Scheduler::put(t);
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	3ac080e7          	jalr	940(ra) # 800020f4 <_ZN9Scheduler3putEP3TCB>
    while((t = get()) != nullptr){
    80001d50:	fddff06f          	j	80001d2c <_ZN3SemD1Ev+0x18>
}
    80001d54:	01813083          	ld	ra,24(sp)
    80001d58:	01013403          	ld	s0,16(sp)
    80001d5c:	00813483          	ld	s1,8(sp)
    80001d60:	02010113          	addi	sp,sp,32
    80001d64:	00008067          	ret

0000000080001d68 <_ZN3Sem7deblockEv>:
void Sem::deblock () {
    80001d68:	ff010113          	addi	sp,sp,-16
    80001d6c:	00113423          	sd	ra,8(sp)
    80001d70:	00813023          	sd	s0,0(sp)
    80001d74:	01010413          	addi	s0,sp,16
    TCB* t = get();
    80001d78:	00000097          	auipc	ra,0x0
    80001d7c:	f30080e7          	jalr	-208(ra) # 80001ca8 <_ZN3Sem3getEv>
    80001d80:	00100793          	li	a5,1
    80001d84:	02f52c23          	sw	a5,56(a0)
    Scheduler::put(t);
    80001d88:	00000097          	auipc	ra,0x0
    80001d8c:	36c080e7          	jalr	876(ra) # 800020f4 <_ZN9Scheduler3putEP3TCB>
}
    80001d90:	00813083          	ld	ra,8(sp)
    80001d94:	00013403          	ld	s0,0(sp)
    80001d98:	01010113          	addi	sp,sp,16
    80001d9c:	00008067          	ret

0000000080001da0 <_ZN3Sem6signalEv>:
    if (val++<0)
    80001da0:	01052783          	lw	a5,16(a0)
    80001da4:	0017871b          	addiw	a4,a5,1
    80001da8:	00e52823          	sw	a4,16(a0)
    80001dac:	0007c463          	bltz	a5,80001db4 <_ZN3Sem6signalEv+0x14>
    80001db0:	00008067          	ret
void Sem::signal () {
    80001db4:	ff010113          	addi	sp,sp,-16
    80001db8:	00113423          	sd	ra,8(sp)
    80001dbc:	00813023          	sd	s0,0(sp)
    80001dc0:	01010413          	addi	s0,sp,16
        deblock();
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	fa4080e7          	jalr	-92(ra) # 80001d68 <_ZN3Sem7deblockEv>
}
    80001dcc:	00813083          	ld	ra,8(sp)
    80001dd0:	00013403          	ld	s0,0(sp)
    80001dd4:	01010113          	addi	sp,sp,16
    80001dd8:	00008067          	ret

0000000080001ddc <_ZN10TimerSleep3putEP3TCBm>:
//
#include "../h/TimerSleep.h"

TimerSleep::Node* TimerSleep::head = nullptr;

void TimerSleep::put(TCB *data, uint64 time) {
    80001ddc:	fe010113          	addi	sp,sp,-32
    80001de0:	00113c23          	sd	ra,24(sp)
    80001de4:	00813823          	sd	s0,16(sp)
    80001de8:	00913423          	sd	s1,8(sp)
    80001dec:	01213023          	sd	s2,0(sp)
    80001df0:	02010413          	addi	s0,sp,32
    80001df4:	00050913          	mv	s2,a0
    80001df8:	00058493          	mv	s1,a1
    Node *newNode = (Node*) MemoryAllocator::mem_alloc(sizeof(Node));
    80001dfc:	01800513          	li	a0,24
    80001e00:	00001097          	auipc	ra,0x1
    80001e04:	220080e7          	jalr	544(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
    newNode->data = data;
    80001e08:	01253023          	sd	s2,0(a0)
    newNode->next = nullptr;
    80001e0c:	00053423          	sd	zero,8(a0)

    if(!head) {
    80001e10:	0000a797          	auipc	a5,0xa
    80001e14:	cf07b783          	ld	a5,-784(a5) # 8000bb00 <_ZN10TimerSleep4headE>
    80001e18:	00078663          	beqz	a5,80001e24 <_ZN10TimerSleep3putEP3TCBm+0x48>
        head = newNode;
        newNode->time = time;
    }
    else{
        Node* prev = nullptr, *cur = head;
    80001e1c:	00000693          	li	a3,0
    80001e20:	02c0006f          	j	80001e4c <_ZN10TimerSleep3putEP3TCBm+0x70>
        head = newNode;
    80001e24:	0000a797          	auipc	a5,0xa
    80001e28:	cca7be23          	sd	a0,-804(a5) # 8000bb00 <_ZN10TimerSleep4headE>
        newNode->time = time;
    80001e2c:	00953823          	sd	s1,16(a0)
    80001e30:	0500006f          	j	80001e80 <_ZN10TimerSleep3putEP3TCBm+0xa4>
            if(time <= cur->time){
                newNode->time = time;
                newNode->next = cur;
                cur->time -= time;
                if(!prev)
                    head = newNode;
    80001e34:	0000a797          	auipc	a5,0xa
    80001e38:	cca7b623          	sd	a0,-820(a5) # 8000bb00 <_ZN10TimerSleep4headE>
    80001e3c:	0440006f          	j	80001e80 <_ZN10TimerSleep3putEP3TCBm+0xa4>
                else
                    prev->next = newNode;
                return;
            }

            time-=cur->time;
    80001e40:	40e484b3          	sub	s1,s1,a4
            prev = cur;
    80001e44:	00078693          	mv	a3,a5
            cur = cur->next;
    80001e48:	0087b783          	ld	a5,8(a5)
        while(cur != nullptr){
    80001e4c:	02078663          	beqz	a5,80001e78 <_ZN10TimerSleep3putEP3TCBm+0x9c>
            if(time <= cur->time){
    80001e50:	0107b703          	ld	a4,16(a5)
    80001e54:	fe9766e3          	bltu	a4,s1,80001e40 <_ZN10TimerSleep3putEP3TCBm+0x64>
                newNode->time = time;
    80001e58:	00953823          	sd	s1,16(a0)
                newNode->next = cur;
    80001e5c:	00f53423          	sd	a5,8(a0)
                cur->time -= time;
    80001e60:	0107b703          	ld	a4,16(a5)
    80001e64:	409704b3          	sub	s1,a4,s1
    80001e68:	0097b823          	sd	s1,16(a5)
                if(!prev)
    80001e6c:	fc0684e3          	beqz	a3,80001e34 <_ZN10TimerSleep3putEP3TCBm+0x58>
                    prev->next = newNode;
    80001e70:	00a6b423          	sd	a0,8(a3)
                return;
    80001e74:	00c0006f          	j	80001e80 <_ZN10TimerSleep3putEP3TCBm+0xa4>
        }

        newNode->time = time;
    80001e78:	00953823          	sd	s1,16(a0)
        prev->next = newNode;
    80001e7c:	00a6b423          	sd	a0,8(a3)
    }
}
    80001e80:	01813083          	ld	ra,24(sp)
    80001e84:	01013403          	ld	s0,16(sp)
    80001e88:	00813483          	ld	s1,8(sp)
    80001e8c:	00013903          	ld	s2,0(sp)
    80001e90:	02010113          	addi	sp,sp,32
    80001e94:	00008067          	ret

0000000080001e98 <_ZN10TimerSleep3getEv>:

void TimerSleep::get() {
    if(!head) return;
    80001e98:	0000a797          	auipc	a5,0xa
    80001e9c:	c687b783          	ld	a5,-920(a5) # 8000bb00 <_ZN10TimerSleep4headE>
    80001ea0:	08078263          	beqz	a5,80001f24 <_ZN10TimerSleep3getEv+0x8c>
void TimerSleep::get() {
    80001ea4:	fe010113          	addi	sp,sp,-32
    80001ea8:	00113c23          	sd	ra,24(sp)
    80001eac:	00813823          	sd	s0,16(sp)
    80001eb0:	00913423          	sd	s1,8(sp)
    80001eb4:	02010413          	addi	s0,sp,32

    head->time--;
    80001eb8:	0107b703          	ld	a4,16(a5)
    80001ebc:	fff70713          	addi	a4,a4,-1
    80001ec0:	00e7b823          	sd	a4,16(a5)
    while(head != nullptr && head->time <= 0){
    80001ec4:	0000a497          	auipc	s1,0xa
    80001ec8:	c3c4b483          	ld	s1,-964(s1) # 8000bb00 <_ZN10TimerSleep4headE>
    80001ecc:	04048263          	beqz	s1,80001f10 <_ZN10TimerSleep3getEv+0x78>
    80001ed0:	0104b783          	ld	a5,16(s1)
    80001ed4:	02079e63          	bnez	a5,80001f10 <_ZN10TimerSleep3getEv+0x78>
        Node* prev = head;
        TCB* data = head->data;
    80001ed8:	0004b503          	ld	a0,0(s1)
    80001edc:	00100793          	li	a5,1
    80001ee0:	02f52c23          	sw	a5,56(a0)
        data->setState(TCB::READY);
        Scheduler::put(data);
    80001ee4:	00000097          	auipc	ra,0x0
    80001ee8:	210080e7          	jalr	528(ra) # 800020f4 <_ZN9Scheduler3putEP3TCB>

        head = head->next;
    80001eec:	0000a797          	auipc	a5,0xa
    80001ef0:	c1478793          	addi	a5,a5,-1004 # 8000bb00 <_ZN10TimerSleep4headE>
    80001ef4:	0007b703          	ld	a4,0(a5)
    80001ef8:	00873703          	ld	a4,8(a4)
    80001efc:	00e7b023          	sd	a4,0(a5)
        MemoryAllocator::mem_free(prev);
    80001f00:	00048513          	mv	a0,s1
    80001f04:	00001097          	auipc	ra,0x1
    80001f08:	2a0080e7          	jalr	672(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
    while(head != nullptr && head->time <= 0){
    80001f0c:	fb9ff06f          	j	80001ec4 <_ZN10TimerSleep3getEv+0x2c>
    }
}
    80001f10:	01813083          	ld	ra,24(sp)
    80001f14:	01013403          	ld	s0,16(sp)
    80001f18:	00813483          	ld	s1,8(sp)
    80001f1c:	02010113          	addi	sp,sp,32
    80001f20:	00008067          	ret
    80001f24:	00008067          	ret

0000000080001f28 <_ZN10TimerSleep4NodenwEm>:

void *TimerSleep::Node::operator new(size_t size) {
    80001f28:	ff010113          	addi	sp,sp,-16
    80001f2c:	00113423          	sd	ra,8(sp)
    80001f30:	00813023          	sd	s0,0(sp)
    80001f34:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80001f38:	00001097          	auipc	ra,0x1
    80001f3c:	0e8080e7          	jalr	232(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
}
    80001f40:	00813083          	ld	ra,8(sp)
    80001f44:	00013403          	ld	s0,0(sp)
    80001f48:	01010113          	addi	sp,sp,16
    80001f4c:	00008067          	ret

0000000080001f50 <_ZN10TimerSleep4NodedlEPv>:

void TimerSleep::Node::operator delete(void *ptr) {
    80001f50:	ff010113          	addi	sp,sp,-16
    80001f54:	00113423          	sd	ra,8(sp)
    80001f58:	00813023          	sd	s0,0(sp)
    80001f5c:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    80001f60:	00001097          	auipc	ra,0x1
    80001f64:	244080e7          	jalr	580(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
    80001f68:	00813083          	ld	ra,8(sp)
    80001f6c:	00013403          	ld	s0,0(sp)
    80001f70:	01010113          	addi	sp,sp,16
    80001f74:	00008067          	ret

0000000080001f78 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "../test/System_Mode_test.hpp"

#endif

void userMain() {
    80001f78:	fe010113          	addi	sp,sp,-32
    80001f7c:	00113c23          	sd	ra,24(sp)
    80001f80:	00813823          	sd	s0,16(sp)
    80001f84:	00913423          	sd	s1,8(sp)
    80001f88:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80001f8c:	00007517          	auipc	a0,0x7
    80001f90:	09450513          	addi	a0,a0,148 # 80009020 <CONSOLE_STATUS+0x10>
    80001f94:	00003097          	auipc	ra,0x3
    80001f98:	788080e7          	jalr	1928(ra) # 8000571c <_Z11printStringPKc>
    int test = getc() - '0';
    80001f9c:	fffff097          	auipc	ra,0xfffff
    80001fa0:	5d4080e7          	jalr	1492(ra) # 80001570 <_Z4getcv>
    80001fa4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80001fa8:	fffff097          	auipc	ra,0xfffff
    80001fac:	5c8080e7          	jalr	1480(ra) # 80001570 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80001fb0:	00700793          	li	a5,7
    80001fb4:	1097e263          	bltu	a5,s1,800020b8 <_Z8userMainv+0x140>
    80001fb8:	00249493          	slli	s1,s1,0x2
    80001fbc:	00007717          	auipc	a4,0x7
    80001fc0:	2bc70713          	addi	a4,a4,700 # 80009278 <CONSOLE_STATUS+0x268>
    80001fc4:	00e484b3          	add	s1,s1,a4
    80001fc8:	0004a783          	lw	a5,0(s1)
    80001fcc:	00e787b3          	add	a5,a5,a4
    80001fd0:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80001fd4:	00003097          	auipc	ra,0x3
    80001fd8:	dc0080e7          	jalr	-576(ra) # 80004d94 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80001fdc:	00007517          	auipc	a0,0x7
    80001fe0:	06450513          	addi	a0,a0,100 # 80009040 <CONSOLE_STATUS+0x30>
    80001fe4:	00003097          	auipc	ra,0x3
    80001fe8:	738080e7          	jalr	1848(ra) # 8000571c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80001fec:	01813083          	ld	ra,24(sp)
    80001ff0:	01013403          	ld	s0,16(sp)
    80001ff4:	00813483          	ld	s1,8(sp)
    80001ff8:	02010113          	addi	sp,sp,32
    80001ffc:	00008067          	ret
            Threads_CPP_API_test();
    80002000:	00002097          	auipc	ra,0x2
    80002004:	c74080e7          	jalr	-908(ra) # 80003c74 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80002008:	00007517          	auipc	a0,0x7
    8000200c:	07850513          	addi	a0,a0,120 # 80009080 <CONSOLE_STATUS+0x70>
    80002010:	00003097          	auipc	ra,0x3
    80002014:	70c080e7          	jalr	1804(ra) # 8000571c <_Z11printStringPKc>
            break;
    80002018:	fd5ff06f          	j	80001fec <_Z8userMainv+0x74>
            producerConsumer_C_API();
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	4ac080e7          	jalr	1196(ra) # 800034c8 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80002024:	00007517          	auipc	a0,0x7
    80002028:	09c50513          	addi	a0,a0,156 # 800090c0 <CONSOLE_STATUS+0xb0>
    8000202c:	00003097          	auipc	ra,0x3
    80002030:	6f0080e7          	jalr	1776(ra) # 8000571c <_Z11printStringPKc>
            break;
    80002034:	fb9ff06f          	j	80001fec <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80002038:	00003097          	auipc	ra,0x3
    8000203c:	0a0080e7          	jalr	160(ra) # 800050d8 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80002040:	00007517          	auipc	a0,0x7
    80002044:	0d050513          	addi	a0,a0,208 # 80009110 <CONSOLE_STATUS+0x100>
    80002048:	00003097          	auipc	ra,0x3
    8000204c:	6d4080e7          	jalr	1748(ra) # 8000571c <_Z11printStringPKc>
            break;
    80002050:	f9dff06f          	j	80001fec <_Z8userMainv+0x74>
            testSleeping();
    80002054:	00004097          	auipc	ra,0x4
    80002058:	e34080e7          	jalr	-460(ra) # 80005e88 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    8000205c:	00007517          	auipc	a0,0x7
    80002060:	10c50513          	addi	a0,a0,268 # 80009168 <CONSOLE_STATUS+0x158>
    80002064:	00003097          	auipc	ra,0x3
    80002068:	6b8080e7          	jalr	1720(ra) # 8000571c <_Z11printStringPKc>
            break;
    8000206c:	f81ff06f          	j	80001fec <_Z8userMainv+0x74>
            testConsumerProducer();
    80002070:	00002097          	auipc	ra,0x2
    80002074:	0c4080e7          	jalr	196(ra) # 80004134 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80002078:	00007517          	auipc	a0,0x7
    8000207c:	12050513          	addi	a0,a0,288 # 80009198 <CONSOLE_STATUS+0x188>
    80002080:	00003097          	auipc	ra,0x3
    80002084:	69c080e7          	jalr	1692(ra) # 8000571c <_Z11printStringPKc>
            break;
    80002088:	f65ff06f          	j	80001fec <_Z8userMainv+0x74>
            System_Mode_test();
    8000208c:	00004097          	auipc	ra,0x4
    80002090:	370080e7          	jalr	880(ra) # 800063fc <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80002094:	00007517          	auipc	a0,0x7
    80002098:	14450513          	addi	a0,a0,324 # 800091d8 <CONSOLE_STATUS+0x1c8>
    8000209c:	00003097          	auipc	ra,0x3
    800020a0:	680080e7          	jalr	1664(ra) # 8000571c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800020a4:	00007517          	auipc	a0,0x7
    800020a8:	15450513          	addi	a0,a0,340 # 800091f8 <CONSOLE_STATUS+0x1e8>
    800020ac:	00003097          	auipc	ra,0x3
    800020b0:	670080e7          	jalr	1648(ra) # 8000571c <_Z11printStringPKc>
            break;
    800020b4:	f39ff06f          	j	80001fec <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800020b8:	00007517          	auipc	a0,0x7
    800020bc:	19850513          	addi	a0,a0,408 # 80009250 <CONSOLE_STATUS+0x240>
    800020c0:	00003097          	auipc	ra,0x3
    800020c4:	65c080e7          	jalr	1628(ra) # 8000571c <_Z11printStringPKc>
    800020c8:	f25ff06f          	j	80001fec <_Z8userMainv+0x74>

00000000800020cc <_ZN9Scheduler4NodenwEm>:
    if(head == nullptr)
        tail = nullptr;
    return data;
}

void *Scheduler::Node::operator new(size_t size) {
    800020cc:	ff010113          	addi	sp,sp,-16
    800020d0:	00113423          	sd	ra,8(sp)
    800020d4:	00813023          	sd	s0,0(sp)
    800020d8:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    800020dc:	00001097          	auipc	ra,0x1
    800020e0:	f44080e7          	jalr	-188(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
}
    800020e4:	00813083          	ld	ra,8(sp)
    800020e8:	00013403          	ld	s0,0(sp)
    800020ec:	01010113          	addi	sp,sp,16
    800020f0:	00008067          	ret

00000000800020f4 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *data) {
    800020f4:	fe010113          	addi	sp,sp,-32
    800020f8:	00113c23          	sd	ra,24(sp)
    800020fc:	00813823          	sd	s0,16(sp)
    80002100:	00913423          	sd	s1,8(sp)
    80002104:	02010413          	addi	s0,sp,32
    80002108:	00050493          	mv	s1,a0
    Node* cur = new Node();
    8000210c:	01000513          	li	a0,16
    80002110:	00000097          	auipc	ra,0x0
    80002114:	fbc080e7          	jalr	-68(ra) # 800020cc <_ZN9Scheduler4NodenwEm>
    80002118:	00053423          	sd	zero,8(a0)
    cur->data = data;
    8000211c:	00953023          	sd	s1,0(a0)
    if(!tail)
    80002120:	0000a797          	auipc	a5,0xa
    80002124:	9e87b783          	ld	a5,-1560(a5) # 8000bb08 <_ZN9Scheduler4tailE>
    80002128:	02078463          	beqz	a5,80002150 <_ZN9Scheduler3putEP3TCB+0x5c>
        tail->next = cur;
    8000212c:	00a7b423          	sd	a0,8(a5)
        tail = cur;
    80002130:	0000a797          	auipc	a5,0xa
    80002134:	9ca7bc23          	sd	a0,-1576(a5) # 8000bb08 <_ZN9Scheduler4tailE>
        tail->next = nullptr;
    80002138:	00053423          	sd	zero,8(a0)
}
    8000213c:	01813083          	ld	ra,24(sp)
    80002140:	01013403          	ld	s0,16(sp)
    80002144:	00813483          	ld	s1,8(sp)
    80002148:	02010113          	addi	sp,sp,32
    8000214c:	00008067          	ret
        head = tail = cur;
    80002150:	0000a797          	auipc	a5,0xa
    80002154:	9b878793          	addi	a5,a5,-1608 # 8000bb08 <_ZN9Scheduler4tailE>
    80002158:	00a7b023          	sd	a0,0(a5)
    8000215c:	00a7b423          	sd	a0,8(a5)
    80002160:	fddff06f          	j	8000213c <_ZN9Scheduler3putEP3TCB+0x48>

0000000080002164 <_ZN9Scheduler4NodedlEPv>:

void Scheduler::Node::operator delete(void *ptr) {
    80002164:	ff010113          	addi	sp,sp,-16
    80002168:	00113423          	sd	ra,8(sp)
    8000216c:	00813023          	sd	s0,0(sp)
    80002170:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    80002174:	00001097          	auipc	ra,0x1
    80002178:	030080e7          	jalr	48(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
}
    8000217c:	00813083          	ld	ra,8(sp)
    80002180:	00013403          	ld	s0,0(sp)
    80002184:	01010113          	addi	sp,sp,16
    80002188:	00008067          	ret

000000008000218c <_ZN9Scheduler3getEv>:
TCB* Scheduler::get() {
    8000218c:	fe010113          	addi	sp,sp,-32
    80002190:	00113c23          	sd	ra,24(sp)
    80002194:	00813823          	sd	s0,16(sp)
    80002198:	00913423          	sd	s1,8(sp)
    8000219c:	01213023          	sd	s2,0(sp)
    800021a0:	02010413          	addi	s0,sp,32
    if(!head) return nullptr;
    800021a4:	0000a517          	auipc	a0,0xa
    800021a8:	96c53503          	ld	a0,-1684(a0) # 8000bb10 <_ZN9Scheduler4headE>
    800021ac:	04050863          	beqz	a0,800021fc <_ZN9Scheduler3getEv+0x70>
    TCB* data = head->data;
    800021b0:	00053903          	ld	s2,0(a0)
    head= head->next;
    800021b4:	00853783          	ld	a5,8(a0)
    800021b8:	0000a497          	auipc	s1,0xa
    800021bc:	95048493          	addi	s1,s1,-1712 # 8000bb08 <_ZN9Scheduler4tailE>
    800021c0:	00f4b423          	sd	a5,8(s1)
    delete prev;
    800021c4:	00000097          	auipc	ra,0x0
    800021c8:	fa0080e7          	jalr	-96(ra) # 80002164 <_ZN9Scheduler4NodedlEPv>
    if(head == nullptr)
    800021cc:	0084b783          	ld	a5,8(s1)
    800021d0:	02078063          	beqz	a5,800021f0 <_ZN9Scheduler3getEv+0x64>
}
    800021d4:	00090513          	mv	a0,s2
    800021d8:	01813083          	ld	ra,24(sp)
    800021dc:	01013403          	ld	s0,16(sp)
    800021e0:	00813483          	ld	s1,8(sp)
    800021e4:	00013903          	ld	s2,0(sp)
    800021e8:	02010113          	addi	sp,sp,32
    800021ec:	00008067          	ret
        tail = nullptr;
    800021f0:	0000a797          	auipc	a5,0xa
    800021f4:	9007bc23          	sd	zero,-1768(a5) # 8000bb08 <_ZN9Scheduler4tailE>
    800021f8:	fddff06f          	j	800021d4 <_ZN9Scheduler3getEv+0x48>
    if(!head) return nullptr;
    800021fc:	00050913          	mv	s2,a0
    80002200:	fd5ff06f          	j	800021d4 <_ZN9Scheduler3getEv+0x48>

0000000080002204 <_Z11mainWrapperPv>:
#include "../h/KConsole.h"

extern "C" void SuperVisorTrap();
void userMain();

void mainWrapper(void*){
    80002204:	ff010113          	addi	sp,sp,-16
    80002208:	00113423          	sd	ra,8(sp)
    8000220c:	00813023          	sd	s0,0(sp)
    80002210:	01010413          	addi	s0,sp,16
    userMain();
    80002214:	00000097          	auipc	ra,0x0
    80002218:	d64080e7          	jalr	-668(ra) # 80001f78 <_Z8userMainv>
}
    8000221c:	00813083          	ld	ra,8(sp)
    80002220:	00013403          	ld	s0,0(sp)
    80002224:	01010113          	addi	sp,sp,16
    80002228:	00008067          	ret

000000008000222c <main>:

int main(){
    8000222c:	fe010113          	addi	sp,sp,-32
    80002230:	00113c23          	sd	ra,24(sp)
    80002234:	00813823          	sd	s0,16(sp)
    80002238:	02010413          	addi	s0,sp,32

    Riscv::w_stvec((uint64)SuperVisorTrap | 1);
    8000223c:	0000a797          	auipc	a5,0xa
    80002240:	84c7b783          	ld	a5,-1972(a5) # 8000ba88 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002244:	0017e793          	ori	a5,a5,1
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80002248:	10579073          	csrw	stvec,a5

    KConsole::init();
    8000224c:	00000097          	auipc	ra,0x0
    80002250:	810080e7          	jalr	-2032(ra) # 80001a5c <_ZN8KConsole4initEv>
    thread_t t;
    thread_create(&t, mainWrapper, nullptr);
    80002254:	00000613          	li	a2,0
    80002258:	00000597          	auipc	a1,0x0
    8000225c:	fac58593          	addi	a1,a1,-84 # 80002204 <_Z11mainWrapperPv>
    80002260:	fe840513          	addi	a0,s0,-24
    80002264:	fffff097          	auipc	ra,0xfffff
    80002268:	138080e7          	jalr	312(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>

    thread_join(t);
    8000226c:	fe843503          	ld	a0,-24(s0)
    80002270:	fffff097          	auipc	ra,0xfffff
    80002274:	1fc080e7          	jalr	508(ra) # 8000146c <_Z11thread_joinP3TCB>

    return 0;
}
    80002278:	00000513          	li	a0,0
    8000227c:	01813083          	ld	ra,24(sp)
    80002280:	01013403          	ld	s0,16(sp)
    80002284:	02010113          	addi	sp,sp,32
    80002288:	00008067          	ret

000000008000228c <_ZN6Thread7wrapperEPv>:
    else
        return thread_create(&myHandle, wrapper, this);
}


void Thread::wrapper(void* par){
    8000228c:	ff010113          	addi	sp,sp,-16
    80002290:	00113423          	sd	ra,8(sp)
    80002294:	00813023          	sd	s0,0(sp)
    80002298:	01010413          	addi	s0,sp,16
    Thread* t = (Thread*) par;
    t->run();
    8000229c:	00053783          	ld	a5,0(a0)
    800022a0:	0107b783          	ld	a5,16(a5)
    800022a4:	000780e7          	jalr	a5
}
    800022a8:	00813083          	ld	ra,8(sp)
    800022ac:	00013403          	ld	s0,0(sp)
    800022b0:	01010113          	addi	sp,sp,16
    800022b4:	00008067          	ret

00000000800022b8 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800022b8:	fe010113          	addi	sp,sp,-32
    800022bc:	00113c23          	sd	ra,24(sp)
    800022c0:	00813823          	sd	s0,16(sp)
    800022c4:	00913423          	sd	s1,8(sp)
    800022c8:	02010413          	addi	s0,sp,32
    800022cc:	00009797          	auipc	a5,0x9
    800022d0:	57c78793          	addi	a5,a5,1404 # 8000b848 <_ZTV6Thread+0x10>
    800022d4:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    800022d8:	00853483          	ld	s1,8(a0)
    800022dc:	02048c63          	beqz	s1,80002314 <_ZN6ThreadD1Ev+0x5c>
        running->stack -= (DEFAULT_STACK_SIZE - 1);
    800022e0:	00009797          	auipc	a5,0x9
    800022e4:	7c07b783          	ld	a5,1984(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x40>
    800022e8:	0007b703          	ld	a4,0(a5)
    800022ec:	00873503          	ld	a0,8(a4)
    800022f0:	ffff87b7          	lui	a5,0xffff8
    800022f4:	00878793          	addi	a5,a5,8 # ffffffffffff8008 <end+0xffffffff7ffeb228>
    800022f8:	00f50533          	add	a0,a0,a5
    800022fc:	00a73423          	sd	a0,8(a4)
        MemoryAllocator::mem_free(running->stack);
    80002300:	00001097          	auipc	ra,0x1
    80002304:	ea4080e7          	jalr	-348(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
    80002308:	00048513          	mv	a0,s1
    8000230c:	00000097          	auipc	ra,0x0
    80002310:	49c080e7          	jalr	1180(ra) # 800027a8 <_ZN3TCBdlEPv>
}
    80002314:	01813083          	ld	ra,24(sp)
    80002318:	01013403          	ld	s0,16(sp)
    8000231c:	00813483          	ld	s1,8(sp)
    80002320:	02010113          	addi	sp,sp,32
    80002324:	00008067          	ret

0000000080002328 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002328:	ff010113          	addi	sp,sp,-16
    8000232c:	00113423          	sd	ra,8(sp)
    80002330:	00813023          	sd	s0,0(sp)
    80002334:	01010413          	addi	s0,sp,16
    80002338:	00009797          	auipc	a5,0x9
    8000233c:	53878793          	addi	a5,a5,1336 # 8000b870 <_ZTV9Semaphore+0x10>
    80002340:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002344:	00853503          	ld	a0,8(a0)
    80002348:	fffff097          	auipc	ra,0xfffff
    8000234c:	178080e7          	jalr	376(ra) # 800014c0 <_Z9sem_closeP3Sem>
}
    80002350:	00813083          	ld	ra,8(sp)
    80002354:	00013403          	ld	s0,0(sp)
    80002358:	01010113          	addi	sp,sp,16
    8000235c:	00008067          	ret

0000000080002360 <_Znwm>:
void *operator new(size_t size) {
    80002360:	ff010113          	addi	sp,sp,-16
    80002364:	00113423          	sd	ra,8(sp)
    80002368:	00813023          	sd	s0,0(sp)
    8000236c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002370:	fffff097          	auipc	ra,0xfffff
    80002374:	fd8080e7          	jalr	-40(ra) # 80001348 <_Z9mem_allocm>
}
    80002378:	00813083          	ld	ra,8(sp)
    8000237c:	00013403          	ld	s0,0(sp)
    80002380:	01010113          	addi	sp,sp,16
    80002384:	00008067          	ret

0000000080002388 <_ZdlPv>:
void operator delete(void *ptr) {
    80002388:	ff010113          	addi	sp,sp,-16
    8000238c:	00113423          	sd	ra,8(sp)
    80002390:	00813023          	sd	s0,0(sp)
    80002394:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80002398:	fffff097          	auipc	ra,0xfffff
    8000239c:	fd8080e7          	jalr	-40(ra) # 80001370 <_Z8mem_freePv>
}
    800023a0:	00813083          	ld	ra,8(sp)
    800023a4:	00013403          	ld	s0,0(sp)
    800023a8:	01010113          	addi	sp,sp,16
    800023ac:	00008067          	ret

00000000800023b0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800023b0:	fe010113          	addi	sp,sp,-32
    800023b4:	00113c23          	sd	ra,24(sp)
    800023b8:	00813823          	sd	s0,16(sp)
    800023bc:	00913423          	sd	s1,8(sp)
    800023c0:	02010413          	addi	s0,sp,32
    800023c4:	00050493          	mv	s1,a0
}
    800023c8:	00000097          	auipc	ra,0x0
    800023cc:	ef0080e7          	jalr	-272(ra) # 800022b8 <_ZN6ThreadD1Ev>
    800023d0:	00048513          	mv	a0,s1
    800023d4:	00000097          	auipc	ra,0x0
    800023d8:	fb4080e7          	jalr	-76(ra) # 80002388 <_ZdlPv>
    800023dc:	01813083          	ld	ra,24(sp)
    800023e0:	01013403          	ld	s0,16(sp)
    800023e4:	00813483          	ld	s1,8(sp)
    800023e8:	02010113          	addi	sp,sp,32
    800023ec:	00008067          	ret

00000000800023f0 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    800023f0:	fe010113          	addi	sp,sp,-32
    800023f4:	00113c23          	sd	ra,24(sp)
    800023f8:	00813823          	sd	s0,16(sp)
    800023fc:	00913423          	sd	s1,8(sp)
    80002400:	02010413          	addi	s0,sp,32
    80002404:	00050493          	mv	s1,a0
}
    80002408:	00000097          	auipc	ra,0x0
    8000240c:	f20080e7          	jalr	-224(ra) # 80002328 <_ZN9SemaphoreD1Ev>
    80002410:	00048513          	mv	a0,s1
    80002414:	00000097          	auipc	ra,0x0
    80002418:	f74080e7          	jalr	-140(ra) # 80002388 <_ZdlPv>
    8000241c:	01813083          	ld	ra,24(sp)
    80002420:	01013403          	ld	s0,16(sp)
    80002424:	00813483          	ld	s1,8(sp)
    80002428:	02010113          	addi	sp,sp,32
    8000242c:	00008067          	ret

0000000080002430 <_ZN6Thread5startEv>:
int Thread::start() {
    80002430:	ff010113          	addi	sp,sp,-16
    80002434:	00113423          	sd	ra,8(sp)
    80002438:	00813023          	sd	s0,0(sp)
    8000243c:	01010413          	addi	s0,sp,16
    if(body)
    80002440:	01053583          	ld	a1,16(a0)
    80002444:	02058263          	beqz	a1,80002468 <_ZN6Thread5startEv+0x38>
        return thread_create(&myHandle, body, arg);
    80002448:	01853603          	ld	a2,24(a0)
    8000244c:	00850513          	addi	a0,a0,8
    80002450:	fffff097          	auipc	ra,0xfffff
    80002454:	f4c080e7          	jalr	-180(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
}
    80002458:	00813083          	ld	ra,8(sp)
    8000245c:	00013403          	ld	s0,0(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret
        return thread_create(&myHandle, wrapper, this);
    80002468:	00050613          	mv	a2,a0
    8000246c:	00000597          	auipc	a1,0x0
    80002470:	e2058593          	addi	a1,a1,-480 # 8000228c <_ZN6Thread7wrapperEPv>
    80002474:	00850513          	addi	a0,a0,8
    80002478:	fffff097          	auipc	ra,0xfffff
    8000247c:	f24080e7          	jalr	-220(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    80002480:	fd9ff06f          	j	80002458 <_ZN6Thread5startEv+0x28>

0000000080002484 <_ZN6Thread4joinEv>:
void Thread::join() {
    80002484:	ff010113          	addi	sp,sp,-16
    80002488:	00113423          	sd	ra,8(sp)
    8000248c:	00813023          	sd	s0,0(sp)
    80002490:	01010413          	addi	s0,sp,16
    thread_join(myHandle);
    80002494:	00853503          	ld	a0,8(a0)
    80002498:	fffff097          	auipc	ra,0xfffff
    8000249c:	fd4080e7          	jalr	-44(ra) # 8000146c <_Z11thread_joinP3TCB>
}
    800024a0:	00813083          	ld	ra,8(sp)
    800024a4:	00013403          	ld	s0,0(sp)
    800024a8:	01010113          	addi	sp,sp,16
    800024ac:	00008067          	ret

00000000800024b0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    800024b0:	ff010113          	addi	sp,sp,-16
    800024b4:	00113423          	sd	ra,8(sp)
    800024b8:	00813023          	sd	s0,0(sp)
    800024bc:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800024c0:	fffff097          	auipc	ra,0xfffff
    800024c4:	f8c080e7          	jalr	-116(ra) # 8000144c <_Z15thread_dispatchv>
}
    800024c8:	00813083          	ld	ra,8(sp)
    800024cc:	00013403          	ld	s0,0(sp)
    800024d0:	01010113          	addi	sp,sp,16
    800024d4:	00008067          	ret

00000000800024d8 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    800024d8:	ff010113          	addi	sp,sp,-16
    800024dc:	00113423          	sd	ra,8(sp)
    800024e0:	00813023          	sd	s0,0(sp)
    800024e4:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    800024e8:	fffff097          	auipc	ra,0xfffff
    800024ec:	05c080e7          	jalr	92(ra) # 80001544 <_Z10time_sleepm>
}
    800024f0:	00813083          	ld	ra,8(sp)
    800024f4:	00013403          	ld	s0,0(sp)
    800024f8:	01010113          	addi	sp,sp,16
    800024fc:	00008067          	ret

0000000080002500 <_ZN14PeriodicThread3runEv>:

void PeriodicThread::terminate() {
    period = 0;
}

void PeriodicThread::run() {
    80002500:	fe010113          	addi	sp,sp,-32
    80002504:	00113c23          	sd	ra,24(sp)
    80002508:	00813823          	sd	s0,16(sp)
    8000250c:	00913423          	sd	s1,8(sp)
    80002510:	02010413          	addi	s0,sp,32
    80002514:	00050493          	mv	s1,a0
    while(period != 0){
    80002518:	0204b783          	ld	a5,32(s1)
    8000251c:	02078263          	beqz	a5,80002540 <_ZN14PeriodicThread3runEv+0x40>
        periodicActivation();
    80002520:	0004b783          	ld	a5,0(s1)
    80002524:	0187b783          	ld	a5,24(a5)
    80002528:	00048513          	mv	a0,s1
    8000252c:	000780e7          	jalr	a5
        sleep(period);
    80002530:	0204b503          	ld	a0,32(s1)
    80002534:	00000097          	auipc	ra,0x0
    80002538:	fa4080e7          	jalr	-92(ra) # 800024d8 <_ZN6Thread5sleepEm>
    while(period != 0){
    8000253c:	fddff06f          	j	80002518 <_ZN14PeriodicThread3runEv+0x18>
    }
}
    80002540:	01813083          	ld	ra,24(sp)
    80002544:	01013403          	ld	s0,16(sp)
    80002548:	00813483          	ld	s1,8(sp)
    8000254c:	02010113          	addi	sp,sp,32
    80002550:	00008067          	ret

0000000080002554 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002554:	ff010113          	addi	sp,sp,-16
    80002558:	00813423          	sd	s0,8(sp)
    8000255c:	01010413          	addi	s0,sp,16
    80002560:	00009797          	auipc	a5,0x9
    80002564:	2e878793          	addi	a5,a5,744 # 8000b848 <_ZTV6Thread+0x10>
    80002568:	00f53023          	sd	a5,0(a0)
    body = nullptr;
    8000256c:	00053823          	sd	zero,16(a0)
    arg = nullptr;
    80002570:	00053c23          	sd	zero,24(a0)
}
    80002574:	00813403          	ld	s0,8(sp)
    80002578:	01010113          	addi	sp,sp,16
    8000257c:	00008067          	ret

0000000080002580 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002580:	ff010113          	addi	sp,sp,-16
    80002584:	00113423          	sd	ra,8(sp)
    80002588:	00813023          	sd	s0,0(sp)
    8000258c:	01010413          	addi	s0,sp,16
    80002590:	00009797          	auipc	a5,0x9
    80002594:	2e078793          	addi	a5,a5,736 # 8000b870 <_ZTV9Semaphore+0x10>
    80002598:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    8000259c:	00850513          	addi	a0,a0,8
    800025a0:	fffff097          	auipc	ra,0xfffff
    800025a4:	ef0080e7          	jalr	-272(ra) # 80001490 <_Z8sem_openPP3Semj>
}
    800025a8:	00813083          	ld	ra,8(sp)
    800025ac:	00013403          	ld	s0,0(sp)
    800025b0:	01010113          	addi	sp,sp,16
    800025b4:	00008067          	ret

00000000800025b8 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800025b8:	ff010113          	addi	sp,sp,-16
    800025bc:	00113423          	sd	ra,8(sp)
    800025c0:	00813023          	sd	s0,0(sp)
    800025c4:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800025c8:	00853503          	ld	a0,8(a0)
    800025cc:	fffff097          	auipc	ra,0xfffff
    800025d0:	f20080e7          	jalr	-224(ra) # 800014ec <_Z8sem_waitP3Sem>
}
    800025d4:	00813083          	ld	ra,8(sp)
    800025d8:	00013403          	ld	s0,0(sp)
    800025dc:	01010113          	addi	sp,sp,16
    800025e0:	00008067          	ret

00000000800025e4 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800025e4:	ff010113          	addi	sp,sp,-16
    800025e8:	00113423          	sd	ra,8(sp)
    800025ec:	00813023          	sd	s0,0(sp)
    800025f0:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800025f4:	00853503          	ld	a0,8(a0)
    800025f8:	fffff097          	auipc	ra,0xfffff
    800025fc:	f20080e7          	jalr	-224(ra) # 80001518 <_Z10sem_signalP3Sem>
}
    80002600:	00813083          	ld	ra,8(sp)
    80002604:	00013403          	ld	s0,0(sp)
    80002608:	01010113          	addi	sp,sp,16
    8000260c:	00008067          	ret

0000000080002610 <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    80002610:	ff010113          	addi	sp,sp,-16
    80002614:	00813423          	sd	s0,8(sp)
    80002618:	01010413          	addi	s0,sp,16
    period = 0;
    8000261c:	02053023          	sd	zero,32(a0)
}
    80002620:	00813403          	ld	s0,8(sp)
    80002624:	01010113          	addi	sp,sp,16
    80002628:	00008067          	ret

000000008000262c <_ZN7Console4getcEv>:

char Console::getc() {
    8000262c:	ff010113          	addi	sp,sp,-16
    80002630:	00113423          	sd	ra,8(sp)
    80002634:	00813023          	sd	s0,0(sp)
    80002638:	01010413          	addi	s0,sp,16
    return ::getc();
    8000263c:	fffff097          	auipc	ra,0xfffff
    80002640:	f34080e7          	jalr	-204(ra) # 80001570 <_Z4getcv>
}
    80002644:	00813083          	ld	ra,8(sp)
    80002648:	00013403          	ld	s0,0(sp)
    8000264c:	01010113          	addi	sp,sp,16
    80002650:	00008067          	ret

0000000080002654 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002654:	ff010113          	addi	sp,sp,-16
    80002658:	00113423          	sd	ra,8(sp)
    8000265c:	00813023          	sd	s0,0(sp)
    80002660:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002664:	fffff097          	auipc	ra,0xfffff
    80002668:	f34080e7          	jalr	-204(ra) # 80001598 <_Z4putcc>
}
    8000266c:	00813083          	ld	ra,8(sp)
    80002670:	00013403          	ld	s0,0(sp)
    80002674:	01010113          	addi	sp,sp,16
    80002678:	00008067          	ret

000000008000267c <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);
protected:
    Thread ();
    static void wrapper(void*);
    virtual void run () {}
    8000267c:	ff010113          	addi	sp,sp,-16
    80002680:	00813423          	sd	s0,8(sp)
    80002684:	01010413          	addi	s0,sp,16
    80002688:	00813403          	ld	s0,8(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <_ZN14PeriodicThread18periodicActivationEv>:
class PeriodicThread : public Thread {
public:
    void terminate ();
protected:
    PeriodicThread (time_t period) : period(period) {}
    virtual void periodicActivation () {}
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00813423          	sd	s0,8(sp)
    8000269c:	01010413          	addi	s0,sp,16
    800026a0:	00813403          	ld	s0,8(sp)
    800026a4:	01010113          	addi	sp,sp,16
    800026a8:	00008067          	ret

00000000800026ac <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800026ac:	ff010113          	addi	sp,sp,-16
    800026b0:	00113423          	sd	ra,8(sp)
    800026b4:	00813023          	sd	s0,0(sp)
    800026b8:	01010413          	addi	s0,sp,16
    800026bc:	00009797          	auipc	a5,0x9
    800026c0:	1d478793          	addi	a5,a5,468 # 8000b890 <_ZTV14PeriodicThread+0x10>
    800026c4:	00f53023          	sd	a5,0(a0)
    800026c8:	00000097          	auipc	ra,0x0
    800026cc:	bf0080e7          	jalr	-1040(ra) # 800022b8 <_ZN6ThreadD1Ev>
    800026d0:	00813083          	ld	ra,8(sp)
    800026d4:	00013403          	ld	s0,0(sp)
    800026d8:	01010113          	addi	sp,sp,16
    800026dc:	00008067          	ret

00000000800026e0 <_ZN14PeriodicThreadD0Ev>:
    800026e0:	fe010113          	addi	sp,sp,-32
    800026e4:	00113c23          	sd	ra,24(sp)
    800026e8:	00813823          	sd	s0,16(sp)
    800026ec:	00913423          	sd	s1,8(sp)
    800026f0:	02010413          	addi	s0,sp,32
    800026f4:	00050493          	mv	s1,a0
    800026f8:	00009797          	auipc	a5,0x9
    800026fc:	19878793          	addi	a5,a5,408 # 8000b890 <_ZTV14PeriodicThread+0x10>
    80002700:	00f53023          	sd	a5,0(a0)
    80002704:	00000097          	auipc	ra,0x0
    80002708:	bb4080e7          	jalr	-1100(ra) # 800022b8 <_ZN6ThreadD1Ev>
    8000270c:	00048513          	mv	a0,s1
    80002710:	00000097          	auipc	ra,0x0
    80002714:	c78080e7          	jalr	-904(ra) # 80002388 <_ZdlPv>
    80002718:	01813083          	ld	ra,24(sp)
    8000271c:	01013403          	ld	s0,16(sp)
    80002720:	00813483          	ld	s1,8(sp)
    80002724:	02010113          	addi	sp,sp,32
    80002728:	00008067          	ret

000000008000272c <_ZN3TCB10idleThreadEPv>:
        sem->wait();
        delete sem;
    }
}

void TCB::idleThread(void *) {
    8000272c:	ff010113          	addi	sp,sp,-16
    80002730:	00813423          	sd	s0,8(sp)
    80002734:	01010413          	addi	s0,sp,16
    while(true);
    80002738:	0000006f          	j	80002738 <_ZN3TCB10idleThreadEPv+0xc>

000000008000273c <_ZN3TCB13threadWrapperEv>:
{
    8000273c:	ff010113          	addi	sp,sp,-16
    80002740:	00113423          	sd	ra,8(sp)
    80002744:	00813023          	sd	s0,0(sp)
    80002748:	01010413          	addi	s0,sp,16
    Riscv::popSppSpie();
    8000274c:	00001097          	auipc	ra,0x1
    80002750:	8a4080e7          	jalr	-1884(ra) # 80002ff0 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    80002754:	00009797          	auipc	a5,0x9
    80002758:	3c47b783          	ld	a5,964(a5) # 8000bb18 <_ZN3TCB7runningE>
    8000275c:	0007b703          	ld	a4,0(a5)
    80002760:	0207b503          	ld	a0,32(a5)
    80002764:	000700e7          	jalr	a4
    thread_exit();
    80002768:	fffff097          	auipc	ra,0xfffff
    8000276c:	cbc080e7          	jalr	-836(ra) # 80001424 <_Z11thread_exitv>
}
    80002770:	00813083          	ld	ra,8(sp)
    80002774:	00013403          	ld	s0,0(sp)
    80002778:	01010113          	addi	sp,sp,16
    8000277c:	00008067          	ret

0000000080002780 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
void TCB::contextSwitch(TCB::Context *oldContext, TCB::Context *runningContext) {
    80002780:	ff010113          	addi	sp,sp,-16
    80002784:	00813423          	sd	s0,8(sp)
    80002788:	01010413          	addi	s0,sp,16
    __asm__ volatile("sd ra, 0 * 8(a0)");
    8000278c:	00153023          	sd	ra,0(a0)
    __asm__ volatile("sd sp, 1 * 8(a0)");
    80002790:	00253423          	sd	sp,8(a0)
    __asm__ volatile("ld ra, 0 * 8(a1)");
    80002794:	0005b083          	ld	ra,0(a1)
    __asm__ volatile("ld sp, 1 * 8(a1)");
    80002798:	0085b103          	ld	sp,8(a1)
}
    8000279c:	00813403          	ld	s0,8(sp)
    800027a0:	01010113          	addi	sp,sp,16
    800027a4:	00008067          	ret

00000000800027a8 <_ZN3TCBdlEPv>:
}

void TCB::operator delete(void *ptr) {
    800027a8:	ff010113          	addi	sp,sp,-16
    800027ac:	00113423          	sd	ra,8(sp)
    800027b0:	00813023          	sd	s0,0(sp)
    800027b4:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    800027b8:	00001097          	auipc	ra,0x1
    800027bc:	9ec080e7          	jalr	-1556(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800027c0:	00813083          	ld	ra,8(sp)
    800027c4:	00013403          	ld	s0,0(sp)
    800027c8:	01010113          	addi	sp,sp,16
    800027cc:	00008067          	ret

00000000800027d0 <_ZN3TCBnwEm>:

void *TCB::operator new(size_t size) {
    800027d0:	ff010113          	addi	sp,sp,-16
    800027d4:	00113423          	sd	ra,8(sp)
    800027d8:	00813023          	sd	s0,0(sp)
    800027dc:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    800027e0:	00001097          	auipc	ra,0x1
    800027e4:	840080e7          	jalr	-1984(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
}
    800027e8:	00813083          	ld	ra,8(sp)
    800027ec:	00013403          	ld	s0,0(sp)
    800027f0:	01010113          	addi	sp,sp,16
    800027f4:	00008067          	ret

00000000800027f8 <_ZN3TCB12createThreadEPFvPvEPmS0_>:
{
    800027f8:	fd010113          	addi	sp,sp,-48
    800027fc:	02113423          	sd	ra,40(sp)
    80002800:	02813023          	sd	s0,32(sp)
    80002804:	00913c23          	sd	s1,24(sp)
    80002808:	01213823          	sd	s2,16(sp)
    8000280c:	01313423          	sd	s3,8(sp)
    80002810:	03010413          	addi	s0,sp,48
    80002814:	00050993          	mv	s3,a0
    80002818:	00058493          	mv	s1,a1
    8000281c:	00060913          	mv	s2,a2
    if(running == nullptr){
    80002820:	00009797          	auipc	a5,0x9
    80002824:	2f87b783          	ld	a5,760(a5) # 8000bb18 <_ZN3TCB7runningE>
    80002828:	06078263          	beqz	a5,8000288c <_ZN3TCB12createThreadEPFvPvEPmS0_+0x94>
    return new TCB(body, stack, arg, DEFAULT_TIME_SLICE);
    8000282c:	05000513          	li	a0,80
    80002830:	00000097          	auipc	ra,0x0
    80002834:	fa0080e7          	jalr	-96(ra) # 800027d0 <_ZN3TCBnwEm>
        state(READY)
    80002838:	01353023          	sd	s3,0(a0)
    8000283c:	00953423          	sd	s1,8(a0)
    80002840:	00000717          	auipc	a4,0x0
    80002844:	efc70713          	addi	a4,a4,-260 # 8000273c <_ZN3TCB13threadWrapperEv>
    80002848:	00e53823          	sd	a4,16(a0)
    8000284c:	00953c23          	sd	s1,24(a0)
    80002850:	03253023          	sd	s2,32(a0)
    80002854:	00200713          	li	a4,2
    80002858:	02e53423          	sd	a4,40(a0)
    8000285c:	02e53823          	sd	a4,48(a0)
    80002860:	00100713          	li	a4,1
    80002864:	02e52c23          	sw	a4,56(a0)
        head = nullptr;
    80002868:	04053023          	sd	zero,64(a0)
        retFromClosedSem = false;
    8000286c:	04050423          	sb	zero,72(a0)
}
    80002870:	02813083          	ld	ra,40(sp)
    80002874:	02013403          	ld	s0,32(sp)
    80002878:	01813483          	ld	s1,24(sp)
    8000287c:	01013903          	ld	s2,16(sp)
    80002880:	00813983          	ld	s3,8(sp)
    80002884:	03010113          	addi	sp,sp,48
    80002888:	00008067          	ret
        running = new TCB(nullptr, nullptr, nullptr, DEFAULT_TIME_SLICE);
    8000288c:	05000513          	li	a0,80
    80002890:	00000097          	auipc	ra,0x0
    80002894:	f40080e7          	jalr	-192(ra) # 800027d0 <_ZN3TCBnwEm>
        state(READY)
    80002898:	00053023          	sd	zero,0(a0)
    8000289c:	00053423          	sd	zero,8(a0)
    800028a0:	00000717          	auipc	a4,0x0
    800028a4:	e9c70713          	addi	a4,a4,-356 # 8000273c <_ZN3TCB13threadWrapperEv>
    800028a8:	00e53823          	sd	a4,16(a0)
    800028ac:	00053c23          	sd	zero,24(a0)
    800028b0:	02053023          	sd	zero,32(a0)
    800028b4:	00200713          	li	a4,2
    800028b8:	02e53423          	sd	a4,40(a0)
    800028bc:	02e53823          	sd	a4,48(a0)
    800028c0:	00100713          	li	a4,1
    800028c4:	02e52c23          	sw	a4,56(a0)
        head = nullptr;
    800028c8:	04053023          	sd	zero,64(a0)
        retFromClosedSem = false;
    800028cc:	04050423          	sb	zero,72(a0)
    800028d0:	00009717          	auipc	a4,0x9
    800028d4:	24a73423          	sd	a0,584(a4) # 8000bb18 <_ZN3TCB7runningE>
    800028d8:	f55ff06f          	j	8000282c <_ZN3TCB12createThreadEPFvPvEPmS0_+0x34>

00000000800028dc <_ZN3TCB8dispatchEv>:
{
    800028dc:	fe010113          	addi	sp,sp,-32
    800028e0:	00113c23          	sd	ra,24(sp)
    800028e4:	00813823          	sd	s0,16(sp)
    800028e8:	00913423          	sd	s1,8(sp)
    800028ec:	01213023          	sd	s2,0(sp)
    800028f0:	02010413          	addi	s0,sp,32
    TCB *old = running;
    800028f4:	00009497          	auipc	s1,0x9
    800028f8:	2244b483          	ld	s1,548(s1) # 8000bb18 <_ZN3TCB7runningE>
    uint64 getTimeSlice() const { return timeSlice; }
    void setTimeSlice(uint64 time) { restimeSlice = time; }
    void resTimeSlice() { timeSlice = restimeSlice; }
    800028fc:	0304b783          	ld	a5,48(s1)
    80002900:	02f4b423          	sd	a5,40(s1)
    if (old->state == TCB::READY) { Scheduler::put(old); }
    80002904:	0384a703          	lw	a4,56(s1)
    80002908:	00100793          	li	a5,1
    8000290c:	04f70e63          	beq	a4,a5,80002968 <_ZN3TCB8dispatchEv+0x8c>
    if(running->state == TCB::IDLE) {
    80002910:	00009917          	auipc	s2,0x9
    80002914:	20893903          	ld	s2,520(s2) # 8000bb18 <_ZN3TCB7runningE>
    80002918:	03892703          	lw	a4,56(s2)
    8000291c:	00400793          	li	a5,4
    80002920:	04f70c63          	beq	a4,a5,80002978 <_ZN3TCB8dispatchEv+0x9c>
    running = Scheduler::get();
    80002924:	00000097          	auipc	ra,0x0
    80002928:	868080e7          	jalr	-1944(ra) # 8000218c <_ZN9Scheduler3getEv>
    8000292c:	00009797          	auipc	a5,0x9
    80002930:	1ea7b623          	sd	a0,492(a5) # 8000bb18 <_ZN3TCB7runningE>
    if(running == nullptr){
    80002934:	06050a63          	beqz	a0,800029a8 <_ZN3TCB8dispatchEv+0xcc>
    TCB::contextSwitch(&old->context, &running->context);
    80002938:	00009597          	auipc	a1,0x9
    8000293c:	1e05b583          	ld	a1,480(a1) # 8000bb18 <_ZN3TCB7runningE>
    80002940:	01058593          	addi	a1,a1,16
    80002944:	01048513          	addi	a0,s1,16
    80002948:	00000097          	auipc	ra,0x0
    8000294c:	e38080e7          	jalr	-456(ra) # 80002780 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002950:	01813083          	ld	ra,24(sp)
    80002954:	01013403          	ld	s0,16(sp)
    80002958:	00813483          	ld	s1,8(sp)
    8000295c:	00013903          	ld	s2,0(sp)
    80002960:	02010113          	addi	sp,sp,32
    80002964:	00008067          	ret
    if (old->state == TCB::READY) { Scheduler::put(old); }
    80002968:	00048513          	mv	a0,s1
    8000296c:	fffff097          	auipc	ra,0xfffff
    80002970:	788080e7          	jalr	1928(ra) # 800020f4 <_ZN9Scheduler3putEP3TCB>
    80002974:	f9dff06f          	j	80002910 <_ZN3TCB8dispatchEv+0x34>
        delete running;
    80002978:	fa0906e3          	beqz	s2,80002924 <_ZN3TCB8dispatchEv+0x48>
        running->stack -= (DEFAULT_STACK_SIZE - 1);
    8000297c:	00893503          	ld	a0,8(s2)
    80002980:	ffff87b7          	lui	a5,0xffff8
    80002984:	00878793          	addi	a5,a5,8 # ffffffffffff8008 <end+0xffffffff7ffeb228>
    80002988:	00f50533          	add	a0,a0,a5
    8000298c:	00a93423          	sd	a0,8(s2)
        MemoryAllocator::mem_free(running->stack);
    80002990:	00001097          	auipc	ra,0x1
    80002994:	814080e7          	jalr	-2028(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
    80002998:	00090513          	mv	a0,s2
    8000299c:	00000097          	auipc	ra,0x0
    800029a0:	e0c080e7          	jalr	-500(ra) # 800027a8 <_ZN3TCBdlEPv>
    800029a4:	f81ff06f          	j	80002924 <_ZN3TCB8dispatchEv+0x48>
        uint64* stack = (uint64*) mem_alloc(DEFAULT_STACK_SIZE);
    800029a8:	00001537          	lui	a0,0x1
    800029ac:	fffff097          	auipc	ra,0xfffff
    800029b0:	99c080e7          	jalr	-1636(ra) # 80001348 <_Z9mem_allocm>
        stack+=DEFAULT_STACK_SIZE - 1;
    800029b4:	00008937          	lui	s2,0x8
    800029b8:	ff890913          	addi	s2,s2,-8 # 7ff8 <_entry-0x7fff8008>
    800029bc:	01250933          	add	s2,a0,s2
        running = new TCB(idleThread, stack, nullptr, DEFAULT_TIME_SLICE);
    800029c0:	05000513          	li	a0,80
    800029c4:	00000097          	auipc	ra,0x0
    800029c8:	e0c080e7          	jalr	-500(ra) # 800027d0 <_ZN3TCBnwEm>
        state(READY)
    800029cc:	00000797          	auipc	a5,0x0
    800029d0:	d6078793          	addi	a5,a5,-672 # 8000272c <_ZN3TCB10idleThreadEPv>
    800029d4:	00f53023          	sd	a5,0(a0) # 1000 <_entry-0x7ffff000>
    800029d8:	01253423          	sd	s2,8(a0)
    800029dc:	00000797          	auipc	a5,0x0
    800029e0:	d6078793          	addi	a5,a5,-672 # 8000273c <_ZN3TCB13threadWrapperEv>
    800029e4:	00f53823          	sd	a5,16(a0)
    800029e8:	01253c23          	sd	s2,24(a0)
    800029ec:	02053023          	sd	zero,32(a0)
    800029f0:	00200793          	li	a5,2
    800029f4:	02f53423          	sd	a5,40(a0)
    800029f8:	02f53823          	sd	a5,48(a0)
        head = nullptr;
    800029fc:	04053023          	sd	zero,64(a0)
        retFromClosedSem = false;
    80002a00:	04050423          	sb	zero,72(a0)
    80002a04:	00009797          	auipc	a5,0x9
    80002a08:	10a7ba23          	sd	a0,276(a5) # 8000bb18 <_ZN3TCB7runningE>
    void setState(STATE value) { state = value; }
    80002a0c:	00400793          	li	a5,4
    80002a10:	02f52c23          	sw	a5,56(a0)
    80002a14:	f25ff06f          	j	80002938 <_ZN3TCB8dispatchEv+0x5c>

0000000080002a18 <_ZN3TCB4NodenwEm>:

void *TCB::Node::operator new(size_t size) {
    80002a18:	ff010113          	addi	sp,sp,-16
    80002a1c:	00113423          	sd	ra,8(sp)
    80002a20:	00813023          	sd	s0,0(sp)
    80002a24:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(size);
    80002a28:	00000097          	auipc	ra,0x0
    80002a2c:	5f8080e7          	jalr	1528(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
}
    80002a30:	00813083          	ld	ra,8(sp)
    80002a34:	00013403          	ld	s0,0(sp)
    80002a38:	01010113          	addi	sp,sp,16
    80002a3c:	00008067          	ret

0000000080002a40 <_ZN3TCB11pushJoinSemEP3Sem>:
void TCB::pushJoinSem(Sem *data) {
    80002a40:	fe010113          	addi	sp,sp,-32
    80002a44:	00113c23          	sd	ra,24(sp)
    80002a48:	00813823          	sd	s0,16(sp)
    80002a4c:	00913423          	sd	s1,8(sp)
    80002a50:	01213023          	sd	s2,0(sp)
    80002a54:	02010413          	addi	s0,sp,32
    80002a58:	00050493          	mv	s1,a0
    80002a5c:	00058913          	mv	s2,a1
    Node *cur = new Node();
    80002a60:	01000513          	li	a0,16
    80002a64:	00000097          	auipc	ra,0x0
    80002a68:	fb4080e7          	jalr	-76(ra) # 80002a18 <_ZN3TCB4NodenwEm>
    80002a6c:	00053423          	sd	zero,8(a0)
    cur->data = data;
    80002a70:	01253023          	sd	s2,0(a0)
    cur->next = head;
    80002a74:	0404b783          	ld	a5,64(s1)
    80002a78:	00f53423          	sd	a5,8(a0)
    head = cur;
    80002a7c:	04a4b023          	sd	a0,64(s1)
}
    80002a80:	01813083          	ld	ra,24(sp)
    80002a84:	01013403          	ld	s0,16(sp)
    80002a88:	00813483          	ld	s1,8(sp)
    80002a8c:	00013903          	ld	s2,0(sp)
    80002a90:	02010113          	addi	sp,sp,32
    80002a94:	00008067          	ret

0000000080002a98 <_ZN3TCB4joinEPS_>:
    bool isFinished() const { return state == STATE::FINISHED; }
    80002a98:	0385a783          	lw	a5,56(a1)
    if(!thread->isFinished()) {
    80002a9c:	00079463          	bnez	a5,80002aa4 <_ZN3TCB4joinEPS_+0xc>
    80002aa0:	00008067          	ret
void TCB::join(TCB *thread) {
    80002aa4:	fe010113          	addi	sp,sp,-32
    80002aa8:	00113c23          	sd	ra,24(sp)
    80002aac:	00813823          	sd	s0,16(sp)
    80002ab0:	00913423          	sd	s1,8(sp)
    80002ab4:	01213023          	sd	s2,0(sp)
    80002ab8:	02010413          	addi	s0,sp,32
    80002abc:	00058493          	mv	s1,a1
        return new Sem(value);
    80002ac0:	01800513          	li	a0,24
    80002ac4:	fffff097          	auipc	ra,0xfffff
    80002ac8:	048080e7          	jalr	72(ra) # 80001b0c <_ZN3SemnwEm>
    80002acc:	00050913          	mv	s2,a0
    Sem (int initValue=1) : val(initValue) {
    80002ad0:	00052823          	sw	zero,16(a0)
        head = tail = 0;
    80002ad4:	00053423          	sd	zero,8(a0)
    80002ad8:	00053023          	sd	zero,0(a0)
        thread->pushJoinSem(sem);
    80002adc:	00050593          	mv	a1,a0
    80002ae0:	00048513          	mv	a0,s1
    80002ae4:	00000097          	auipc	ra,0x0
    80002ae8:	f5c080e7          	jalr	-164(ra) # 80002a40 <_ZN3TCB11pushJoinSemEP3Sem>
        sem->wait();
    80002aec:	00090513          	mv	a0,s2
    80002af0:	fffff097          	auipc	ra,0xfffff
    80002af4:	150080e7          	jalr	336(ra) # 80001c40 <_ZN3Sem4waitEv>
        delete sem;
    80002af8:	00090e63          	beqz	s2,80002b14 <_ZN3TCB4joinEPS_+0x7c>
    80002afc:	00090513          	mv	a0,s2
    80002b00:	fffff097          	auipc	ra,0xfffff
    80002b04:	214080e7          	jalr	532(ra) # 80001d14 <_ZN3SemD1Ev>
    80002b08:	00090513          	mv	a0,s2
    80002b0c:	fffff097          	auipc	ra,0xfffff
    80002b10:	028080e7          	jalr	40(ra) # 80001b34 <_ZN3SemdlEPv>
}
    80002b14:	01813083          	ld	ra,24(sp)
    80002b18:	01013403          	ld	s0,16(sp)
    80002b1c:	00813483          	ld	s1,8(sp)
    80002b20:	00013903          	ld	s2,0(sp)
    80002b24:	02010113          	addi	sp,sp,32
    80002b28:	00008067          	ret

0000000080002b2c <_ZN3TCB4NodedlEPv>:

void TCB::Node::operator delete(void *ptr) {
    80002b2c:	ff010113          	addi	sp,sp,-16
    80002b30:	00113423          	sd	ra,8(sp)
    80002b34:	00813023          	sd	s0,0(sp)
    80002b38:	01010413          	addi	s0,sp,16
    MemoryAllocator::mem_free(ptr);
    80002b3c:	00000097          	auipc	ra,0x0
    80002b40:	668080e7          	jalr	1640(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80002b44:	00813083          	ld	ra,8(sp)
    80002b48:	00013403          	ld	s0,0(sp)
    80002b4c:	01010113          	addi	sp,sp,16
    80002b50:	00008067          	ret

0000000080002b54 <_ZN3TCB17notifayAllJoinSemEv>:
void TCB::notifayAllJoinSem() {
    80002b54:	fe010113          	addi	sp,sp,-32
    80002b58:	00113c23          	sd	ra,24(sp)
    80002b5c:	00813823          	sd	s0,16(sp)
    80002b60:	00913423          	sd	s1,8(sp)
    80002b64:	01213023          	sd	s2,0(sp)
    80002b68:	02010413          	addi	s0,sp,32
    80002b6c:	00050913          	mv	s2,a0
    while(head != nullptr){
    80002b70:	04093483          	ld	s1,64(s2)
    80002b74:	02048863          	beqz	s1,80002ba4 <_ZN3TCB17notifayAllJoinSemEv+0x50>
        head->data->signal();
    80002b78:	0004b503          	ld	a0,0(s1)
    80002b7c:	fffff097          	auipc	ra,0xfffff
    80002b80:	224080e7          	jalr	548(ra) # 80001da0 <_ZN3Sem6signalEv>
        head = head->next;
    80002b84:	04093783          	ld	a5,64(s2)
    80002b88:	0087b783          	ld	a5,8(a5)
    80002b8c:	04f93023          	sd	a5,64(s2)
        delete prev;
    80002b90:	fe0480e3          	beqz	s1,80002b70 <_ZN3TCB17notifayAllJoinSemEv+0x1c>
    80002b94:	00048513          	mv	a0,s1
    80002b98:	00000097          	auipc	ra,0x0
    80002b9c:	f94080e7          	jalr	-108(ra) # 80002b2c <_ZN3TCB4NodedlEPv>
    80002ba0:	fd1ff06f          	j	80002b70 <_ZN3TCB17notifayAllJoinSemEv+0x1c>
}
    80002ba4:	01813083          	ld	ra,24(sp)
    80002ba8:	01013403          	ld	s0,16(sp)
    80002bac:	00813483          	ld	s1,8(sp)
    80002bb0:	00013903          	ld	s2,0(sp)
    80002bb4:	02010113          	addi	sp,sp,32
    80002bb8:	00008067          	ret

0000000080002bbc <_ZN3TCB4exitEv>:
    if(running == nullptr) return -1;
    80002bbc:	00009517          	auipc	a0,0x9
    80002bc0:	f5c53503          	ld	a0,-164(a0) # 8000bb18 <_ZN3TCB7runningE>
    80002bc4:	02050e63          	beqz	a0,80002c00 <_ZN3TCB4exitEv+0x44>
int TCB::exit() {
    80002bc8:	ff010113          	addi	sp,sp,-16
    80002bcc:	00113423          	sd	ra,8(sp)
    80002bd0:	00813023          	sd	s0,0(sp)
    80002bd4:	01010413          	addi	s0,sp,16
    void setState(STATE value) { state = value; }
    80002bd8:	02052c23          	sw	zero,56(a0)
    running->notifayAllJoinSem();
    80002bdc:	00000097          	auipc	ra,0x0
    80002be0:	f78080e7          	jalr	-136(ra) # 80002b54 <_ZN3TCB17notifayAllJoinSemEv>
    dispatch();
    80002be4:	00000097          	auipc	ra,0x0
    80002be8:	cf8080e7          	jalr	-776(ra) # 800028dc <_ZN3TCB8dispatchEv>
    return 0;
    80002bec:	00000513          	li	a0,0
}
    80002bf0:	00813083          	ld	ra,8(sp)
    80002bf4:	00013403          	ld	s0,0(sp)
    80002bf8:	01010113          	addi	sp,sp,16
    80002bfc:	00008067          	ret
    if(running == nullptr) return -1;
    80002c00:	fff00513          	li	a0,-1
}
    80002c04:	00008067          	ret

0000000080002c08 <_ZN5Riscv16interruptHandlerEv>:
// Created by os on 6/30/23.
//

#include "../h/Riscv.h"

void Riscv::interruptHandler() {
    80002c08:	fb010113          	addi	sp,sp,-80
    80002c0c:	04113423          	sd	ra,72(sp)
    80002c10:	04813023          	sd	s0,64(sp)
    80002c14:	02913c23          	sd	s1,56(sp)
    80002c18:	03213823          	sd	s2,48(sp)
    80002c1c:	03313423          	sd	s3,40(sp)
    80002c20:	03413023          	sd	s4,32(sp)
    80002c24:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002c28:	141027f3          	csrr	a5,sepc
    80002c2c:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002c30:	fc843483          	ld	s1,-56(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002c34:	100027f3          	csrr	a5,sstatus
    80002c38:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002c3c:	fc043903          	ld	s2,-64(s0)
    uint64 sepc = Riscv::r_sepc() + 4;
    uint64 sstatus = Riscv::r_sstatus();

    uint64 sys_code;
    __asm__ volatile("mv %[sys_code], a0" : [sys_code] "=r" (sys_code));
    80002c40:	00050793          	mv	a5,a0
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002c44:	14202773          	csrr	a4,scause
    80002c48:	fae43c23          	sd	a4,-72(s0)
    return scause;
    80002c4c:	fb843703          	ld	a4,-72(s0)

    uint64 scause = r_scause();

    uint64 a2;
    __asm__ volatile("mv %[sys_code], a2" : [sys_code] "=r" (a2));
    80002c50:	00060513          	mv	a0,a2

    if(scause == 8 || scause == 9) {
    80002c54:	ff870713          	addi	a4,a4,-8
    80002c58:	00100693          	li	a3,1
    80002c5c:	02e6f263          	bgeu	a3,a4,80002c80 <_ZN5Riscv16interruptHandlerEv+0x78>
        Riscv::w_sstatus(sstatus);
        Riscv::w_sepc(sepc);
    }

    return;
}
    80002c60:	04813083          	ld	ra,72(sp)
    80002c64:	04013403          	ld	s0,64(sp)
    80002c68:	03813483          	ld	s1,56(sp)
    80002c6c:	03013903          	ld	s2,48(sp)
    80002c70:	02813983          	ld	s3,40(sp)
    80002c74:	02013a03          	ld	s4,32(sp)
    80002c78:	05010113          	addi	sp,sp,80
    80002c7c:	00008067          	ret
    80002c80:	00448493          	addi	s1,s1,4
        switch (sys_code) {
    80002c84:	04200713          	li	a4,66
    80002c88:	02f76663          	bltu	a4,a5,80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
    80002c8c:	00279793          	slli	a5,a5,0x2
    80002c90:	00006717          	auipc	a4,0x6
    80002c94:	60870713          	addi	a4,a4,1544 # 80009298 <CONSOLE_STATUS+0x288>
    80002c98:	00e787b3          	add	a5,a5,a4
    80002c9c:	0007a783          	lw	a5,0(a5)
    80002ca0:	00e787b3          	add	a5,a5,a4
    80002ca4:	00078067          	jr	a5
                __asm__ volatile("mv %[size], a1" : [size] "=r"(size));
    80002ca8:	00058513          	mv	a0,a1
                MemoryAllocator::mem_alloc(size);
    80002cac:	00000097          	auipc	ra,0x0
    80002cb0:	374080e7          	jalr	884(ra) # 80003020 <_ZN15MemoryAllocator9mem_allocEm>
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002cb4:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002cb8:	14149073          	csrw	sepc,s1
    return;
    80002cbc:	fa5ff06f          	j	80002c60 <_ZN5Riscv16interruptHandlerEv+0x58>
                __asm__ volatile("mv %[ptr], a1" : [ptr] "=r"(ptr));
    80002cc0:	00058513          	mv	a0,a1
                MemoryAllocator::mem_free(ptr);
    80002cc4:	00000097          	auipc	ra,0x0
    80002cc8:	4e0080e7          	jalr	1248(ra) # 800031a4 <_ZN15MemoryAllocator8mem_freeEPv>
                break;
    80002ccc:	fe9ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                __asm__ volatile("mv %[thread], a1" : [thread] "=r"(thread));
    80002cd0:	00058993          	mv	s3,a1
                __asm__ volatile("mv %[arg], a6" : [arg] "=r"(arg));
    80002cd4:	00080613          	mv	a2,a6
                __asm__ volatile("mv %[stack], a7" : [stack] "=r"(stack));
    80002cd8:	00088593          	mv	a1,a7
                tt = TCB::createThread((TCB::Body) body, stack, arg);
    80002cdc:	00000097          	auipc	ra,0x0
    80002ce0:	b1c080e7          	jalr	-1252(ra) # 800027f8 <_ZN3TCB12createThreadEPFvPvEPmS0_>
                *thread = tt;
    80002ce4:	00a9b023          	sd	a0,0(s3)
                if (tt == nullptr)
    80002ce8:	00050a63          	beqz	a0,80002cfc <_ZN5Riscv16interruptHandlerEv+0xf4>
                    Scheduler::put(*thread);
    80002cec:	fffff097          	auipc	ra,0xfffff
    80002cf0:	408080e7          	jalr	1032(ra) # 800020f4 <_ZN9Scheduler3putEP3TCB>
                    __asm__ volatile("li a0, 0");
    80002cf4:	00000513          	li	a0,0
    80002cf8:	fbdff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                    __asm__ volatile("li a0, -1");
    80002cfc:	fff00513          	li	a0,-1
    80002d00:	fb5ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                TCB::exit();
    80002d04:	00000097          	auipc	ra,0x0
    80002d08:	eb8080e7          	jalr	-328(ra) # 80002bbc <_ZN3TCB4exitEv>
                break;
    80002d0c:	fa9ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                TCB::running->resTimeSlice();
    80002d10:	00009797          	auipc	a5,0x9
    80002d14:	d907b783          	ld	a5,-624(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002d18:	0007b783          	ld	a5,0(a5)
    void resTimeSlice() { timeSlice = restimeSlice; }
    80002d1c:	0307b703          	ld	a4,48(a5)
    80002d20:	02e7b423          	sd	a4,40(a5)
                TCB::dispatch();
    80002d24:	00000097          	auipc	ra,0x0
    80002d28:	bb8080e7          	jalr	-1096(ra) # 800028dc <_ZN3TCB8dispatchEv>
                break;
    80002d2c:	f89ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                __asm__ volatile("mv %[thr], a1" : [thr] "=r"(thr));
    80002d30:	00058593          	mv	a1,a1
                TCB::running->join(thr);
    80002d34:	00009797          	auipc	a5,0x9
    80002d38:	d6c7b783          	ld	a5,-660(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002d3c:	0007b503          	ld	a0,0(a5)
    80002d40:	00000097          	auipc	ra,0x0
    80002d44:	d58080e7          	jalr	-680(ra) # 80002a98 <_ZN3TCB4joinEPS_>
                break;
    80002d48:	f6dff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                __asm__ volatile("mv %[handle], a1" : [handle] "=r"(handle));
    80002d4c:	00058a13          	mv	s4,a1
                __asm__ volatile("mv %[init], a7" : [init] "=r"(init));
    80002d50:	00088993          	mv	s3,a7
                *handle = Sem::createSem(init);
    80002d54:	0009899b          	sext.w	s3,s3
        return new Sem(value);
    80002d58:	01800513          	li	a0,24
    80002d5c:	fffff097          	auipc	ra,0xfffff
    80002d60:	db0080e7          	jalr	-592(ra) # 80001b0c <_ZN3SemnwEm>
    Sem (int initValue=1) : val(initValue) {
    80002d64:	01352823          	sw	s3,16(a0)
        head = tail = 0;
    80002d68:	00053423          	sd	zero,8(a0)
    80002d6c:	00053023          	sd	zero,0(a0)
    80002d70:	00aa3023          	sd	a0,0(s4)
                if (*handle == nullptr)
    80002d74:	00050663          	beqz	a0,80002d80 <_ZN5Riscv16interruptHandlerEv+0x178>
                    __asm__ volatile("li a0, 0");
    80002d78:	00000513          	li	a0,0
    80002d7c:	f39ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                    __asm__ volatile("li a0, -1");
    80002d80:	fff00513          	li	a0,-1
    80002d84:	f31ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                __asm__ volatile("mv %[hand], a1" : [hand] "=r"(hand));
    80002d88:	00058993          	mv	s3,a1
                if (hand == nullptr)
    80002d8c:	02098263          	beqz	s3,80002db0 <_ZN5Riscv16interruptHandlerEv+0x1a8>
                    delete hand;
    80002d90:	00098513          	mv	a0,s3
    80002d94:	fffff097          	auipc	ra,0xfffff
    80002d98:	f80080e7          	jalr	-128(ra) # 80001d14 <_ZN3SemD1Ev>
    80002d9c:	00098513          	mv	a0,s3
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	d94080e7          	jalr	-620(ra) # 80001b34 <_ZN3SemdlEPv>
                    __asm__ volatile("li a0, 0");
    80002da8:	00000513          	li	a0,0
    80002dac:	f09ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                    __asm__ volatile("li a0, -1");
    80002db0:	fff00513          	li	a0,-1
    80002db4:	f01ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                __asm__ volatile("mv %[id], a1" : [id] "=r"(id));
    80002db8:	00058513          	mv	a0,a1
                id->wait();
    80002dbc:	fffff097          	auipc	ra,0xfffff
    80002dc0:	e84080e7          	jalr	-380(ra) # 80001c40 <_ZN3Sem4waitEv>
                if(TCB::running->retFromClosedSem){
    80002dc4:	00009797          	auipc	a5,0x9
    80002dc8:	cdc7b783          	ld	a5,-804(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002dcc:	0007b783          	ld	a5,0(a5)
    80002dd0:	0487c703          	lbu	a4,72(a5)
    80002dd4:	00070863          	beqz	a4,80002de4 <_ZN5Riscv16interruptHandlerEv+0x1dc>
                    TCB::running->retFromClosedSem = false;
    80002dd8:	04078423          	sb	zero,72(a5)
                    __asm__ volatile("li a0, -1");
    80002ddc:	fff00513          	li	a0,-1
    80002de0:	ed5ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                    __asm__ volatile("li a0, 0");
    80002de4:	00000513          	li	a0,0
    80002de8:	ecdff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                __asm__ volatile("mv %[idd], a1" : [idd] "=r"(idd));
    80002dec:	00058513          	mv	a0,a1
                if (idd == nullptr)
    80002df0:	00050a63          	beqz	a0,80002e04 <_ZN5Riscv16interruptHandlerEv+0x1fc>
                    idd->signal();
    80002df4:	fffff097          	auipc	ra,0xfffff
    80002df8:	fac080e7          	jalr	-84(ra) # 80001da0 <_ZN3Sem6signalEv>
                    __asm__ volatile("li a0, 0");
    80002dfc:	00000513          	li	a0,0
    80002e00:	eb5ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                    __asm__ volatile("li a0, -1");
    80002e04:	fff00513          	li	a0,-1
    80002e08:	eadff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                __asm__ volatile("mv %[time], a1" : [time] "=r"(time));
    80002e0c:	00058593          	mv	a1,a1
                if(time == 0){
    80002e10:	04058063          	beqz	a1,80002e50 <_ZN5Riscv16interruptHandlerEv+0x248>
                if(TCB::running == nullptr)
    80002e14:	00009797          	auipc	a5,0x9
    80002e18:	c8c7b783          	ld	a5,-884(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002e1c:	0007b503          	ld	a0,0(a5)
    80002e20:	04050063          	beqz	a0,80002e60 <_ZN5Riscv16interruptHandlerEv+0x258>
                    TimerSleep::put(TCB::running, time);
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	fb8080e7          	jalr	-72(ra) # 80001ddc <_ZN10TimerSleep3putEP3TCBm>
                    TCB::running->setState(TCB::SLEEPING);
    80002e2c:	00009797          	auipc	a5,0x9
    80002e30:	c747b783          	ld	a5,-908(a5) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002e34:	0007b783          	ld	a5,0(a5)
    void setState(STATE value) { state = value; }
    80002e38:	00300713          	li	a4,3
    80002e3c:	02e7ac23          	sw	a4,56(a5)
                    TCB::dispatch();
    80002e40:	00000097          	auipc	ra,0x0
    80002e44:	a9c080e7          	jalr	-1380(ra) # 800028dc <_ZN3TCB8dispatchEv>
                    __asm__ volatile("li a0, 0");
    80002e48:	00000513          	li	a0,0
    80002e4c:	e69ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                    TCB::dispatch();
    80002e50:	00000097          	auipc	ra,0x0
    80002e54:	a8c080e7          	jalr	-1396(ra) # 800028dc <_ZN3TCB8dispatchEv>
                    __asm__ volatile("li a0, 0");
    80002e58:	00000513          	li	a0,0
                    break;
    80002e5c:	e59ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                    __asm__ volatile("li a0, -1");
    80002e60:	fff00513          	li	a0,-1
    80002e64:	e51ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                KConsole::getchar();
    80002e68:	fffff097          	auipc	ra,0xfffff
    80002e6c:	bc0080e7          	jalr	-1088(ra) # 80001a28 <_ZN8KConsole7getcharEv>
                break;
    80002e70:	e45ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>
                __asm__ volatile("mv %[c], a1" : [c] "=r"(c));
    80002e74:	00058513          	mv	a0,a1
                KConsole::putchar(c);
    80002e78:	0ff57513          	andi	a0,a0,255
    80002e7c:	fffff097          	auipc	ra,0xfffff
    80002e80:	b28080e7          	jalr	-1240(ra) # 800019a4 <_ZN8KConsole7putcharEc>
                break;
    80002e84:	e31ff06f          	j	80002cb4 <_ZN5Riscv16interruptHandlerEv+0xac>

0000000080002e88 <_ZN5Riscv12timerHandlerEv>:

void Riscv::timerHandler() {
    80002e88:	fc010113          	addi	sp,sp,-64
    80002e8c:	02113c23          	sd	ra,56(sp)
    80002e90:	02813823          	sd	s0,48(sp)
    80002e94:	02913423          	sd	s1,40(sp)
    80002e98:	03213023          	sd	s2,32(sp)
    80002e9c:	01313c23          	sd	s3,24(sp)
    80002ea0:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002ea4:	141027f3          	csrr	a5,sepc
    80002ea8:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002eac:	fc843903          	ld	s2,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002eb0:	100027f3          	csrr	a5,sstatus
    80002eb4:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002eb8:	fc043983          	ld	s3,-64(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002ebc:	00200793          	li	a5,2
    80002ec0:	1447b073          	csrc	sip,a5
    uint64 sepc = Riscv::r_sepc();
    uint64 sstatus = Riscv::r_sstatus();

    mc_sip(SIP_SSIE);
    TCB::running->decTimeSlice();
    80002ec4:	00009497          	auipc	s1,0x9
    80002ec8:	bdc4b483          	ld	s1,-1060(s1) # 8000baa0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002ecc:	0004b703          	ld	a4,0(s1)
    void decTimeSlice() { timeSlice--; }
    80002ed0:	02873783          	ld	a5,40(a4)
    80002ed4:	fff78793          	addi	a5,a5,-1
    80002ed8:	02f73423          	sd	a5,40(a4)
    TimerSleep::get();
    80002edc:	fffff097          	auipc	ra,0xfffff
    80002ee0:	fbc080e7          	jalr	-68(ra) # 80001e98 <_ZN10TimerSleep3getEv>
    if(TCB::running->getTimeSlice() <= 0){
    80002ee4:	0004b783          	ld	a5,0(s1)
    uint64 getTimeSlice() const { return timeSlice; }
    80002ee8:	0287b783          	ld	a5,40(a5)
    80002eec:	02078463          	beqz	a5,80002f14 <_ZN5Riscv12timerHandlerEv+0x8c>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002ef0:	10099073          	csrw	sstatus,s3
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002ef4:	14191073          	csrw	sepc,s2
        TCB::dispatch();
    }

    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
}
    80002ef8:	03813083          	ld	ra,56(sp)
    80002efc:	03013403          	ld	s0,48(sp)
    80002f00:	02813483          	ld	s1,40(sp)
    80002f04:	02013903          	ld	s2,32(sp)
    80002f08:	01813983          	ld	s3,24(sp)
    80002f0c:	04010113          	addi	sp,sp,64
    80002f10:	00008067          	ret
        TCB::dispatch();
    80002f14:	00000097          	auipc	ra,0x0
    80002f18:	9c8080e7          	jalr	-1592(ra) # 800028dc <_ZN3TCB8dispatchEv>
    80002f1c:	fd5ff06f          	j	80002ef0 <_ZN5Riscv12timerHandlerEv+0x68>

0000000080002f20 <_ZN5Riscv14consoleHandlerEv>:

void Riscv::consoleHandler() {
    80002f20:	fc010113          	addi	sp,sp,-64
    80002f24:	02113c23          	sd	ra,56(sp)
    80002f28:	02813823          	sd	s0,48(sp)
    80002f2c:	02913423          	sd	s1,40(sp)
    80002f30:	03213023          	sd	s2,32(sp)
    80002f34:	01313c23          	sd	s3,24(sp)
    80002f38:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002f3c:	141027f3          	csrr	a5,sepc
    80002f40:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002f44:	fc843903          	ld	s2,-56(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002f48:	100027f3          	csrr	a5,sstatus
    80002f4c:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002f50:	fc043983          	ld	s3,-64(s0)
    uint64 sepc = Riscv::r_sepc();
    uint64 sstatus = Riscv::r_sstatus();

    int cause = plic_claim();
    80002f54:	00004097          	auipc	ra,0x4
    80002f58:	120080e7          	jalr	288(ra) # 80007074 <plic_claim>
    80002f5c:	00050493          	mv	s1,a0
    if(cause == 10){
    80002f60:	00a00793          	li	a5,10
    80002f64:	02f50a63          	beq	a0,a5,80002f98 <_ZN5Riscv14consoleHandlerEv+0x78>
        while(((*(char*) CONSOLE_STATUS) & 0x01) && !KConsole::outputBuffer->isFull()){
            KConsole::outputBuffer->put((*(char*) CONSOLE_RX_DATA));
        }
    }

    plic_complete(cause);
    80002f68:	00048513          	mv	a0,s1
    80002f6c:	00004097          	auipc	ra,0x4
    80002f70:	140080e7          	jalr	320(ra) # 800070ac <plic_complete>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002f74:	10099073          	csrw	sstatus,s3
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002f78:	14191073          	csrw	sepc,s2
    Riscv::w_sstatus(sstatus);
    Riscv::w_sepc(sepc);
}
    80002f7c:	03813083          	ld	ra,56(sp)
    80002f80:	03013403          	ld	s0,48(sp)
    80002f84:	02813483          	ld	s1,40(sp)
    80002f88:	02013903          	ld	s2,32(sp)
    80002f8c:	01813983          	ld	s3,24(sp)
    80002f90:	04010113          	addi	sp,sp,64
    80002f94:	00008067          	ret
        while(((*(char*) CONSOLE_STATUS) & 0x01) && !KConsole::outputBuffer->isFull()){
    80002f98:	00009797          	auipc	a5,0x9
    80002f9c:	ad87b783          	ld	a5,-1320(a5) # 8000ba70 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002fa0:	0007b783          	ld	a5,0(a5)
    80002fa4:	0007c783          	lbu	a5,0(a5)
    80002fa8:	0017f793          	andi	a5,a5,1
    80002fac:	fa078ee3          	beqz	a5,80002f68 <_ZN5Riscv14consoleHandlerEv+0x48>
    80002fb0:	00009797          	auipc	a5,0x9
    80002fb4:	ae87b783          	ld	a5,-1304(a5) # 8000ba98 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002fb8:	0007b503          	ld	a0,0(a5)
    80002fbc:	fffff097          	auipc	ra,0xfffff
    80002fc0:	8a0080e7          	jalr	-1888(ra) # 8000185c <_ZN7KBuffer6isFullEv>
    80002fc4:	fa0512e3          	bnez	a0,80002f68 <_ZN5Riscv14consoleHandlerEv+0x48>
            KConsole::outputBuffer->put((*(char*) CONSOLE_RX_DATA));
    80002fc8:	00009797          	auipc	a5,0x9
    80002fcc:	aa07b783          	ld	a5,-1376(a5) # 8000ba68 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002fd0:	0007b783          	ld	a5,0(a5)
    80002fd4:	0007c583          	lbu	a1,0(a5)
    80002fd8:	00009797          	auipc	a5,0x9
    80002fdc:	ac07b783          	ld	a5,-1344(a5) # 8000ba98 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002fe0:	0007b503          	ld	a0,0(a5)
    80002fe4:	ffffe097          	auipc	ra,0xffffe
    80002fe8:	6a8080e7          	jalr	1704(ra) # 8000168c <_ZN7KBuffer3putEi>
        while(((*(char*) CONSOLE_STATUS) & 0x01) && !KConsole::outputBuffer->isFull()){
    80002fec:	fadff06f          	j	80002f98 <_ZN5Riscv14consoleHandlerEv+0x78>

0000000080002ff0 <_ZN5Riscv10popSppSpieEv>:

void Riscv::popSppSpie()
{
    80002ff0:	ff010113          	addi	sp,sp,-16
    80002ff4:	00813423          	sd	s0,8(sp)
    80002ff8:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80002ffc:	14109073          	csrw	sepc,ra
    __asm__ volatile("li t0, 256");
    80003000:	10000293          	li	t0,256
    __asm__ volatile("csrc sstatus, t0");
    80003004:	1002b073          	csrc	sstatus,t0

    __asm__ volatile("ld s0, 8(sp)");
    80003008:	00813403          	ld	s0,8(sp)
    __asm__ volatile("addi sp, sp, 16");
    8000300c:	01010113          	addi	sp,sp,16

     __asm__ volatile("sret");
    80003010:	10200073          	sret
}
    80003014:	00813403          	ld	s0,8(sp)
    80003018:	01010113          	addi	sp,sp,16
    8000301c:	00008067          	ret

0000000080003020 <_ZN15MemoryAllocator9mem_allocEm>:
#include "../h/MemoryAllocator.h"

MemoryAllocator::FreeMem* MemoryAllocator::head = nullptr;
bool MemoryAllocator::start = true;

void *MemoryAllocator::mem_alloc(size_t size) {
    80003020:	ff010113          	addi	sp,sp,-16
    80003024:	00813423          	sd	s0,8(sp)
    80003028:	01010413          	addi	s0,sp,16
    8000302c:	00050713          	mv	a4,a0
    if(start) {
    80003030:	00009797          	auipc	a5,0x9
    80003034:	8807c783          	lbu	a5,-1920(a5) # 8000b8b0 <_ZN15MemoryAllocator5startE>
    80003038:	04078463          	beqz	a5,80003080 <_ZN15MemoryAllocator9mem_allocEm+0x60>
        head = (FreeMem*) HEAP_START_ADDR;
    8000303c:	00009697          	auipc	a3,0x9
    80003040:	a3c6b683          	ld	a3,-1476(a3) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003044:	0006b783          	ld	a5,0(a3)
    80003048:	00009617          	auipc	a2,0x9
    8000304c:	ad860613          	addi	a2,a2,-1320 # 8000bb20 <_ZN15MemoryAllocator4headE>
    80003050:	00f63023          	sd	a5,0(a2)
        head->next = head->prev = nullptr;
    80003054:	0007b423          	sd	zero,8(a5)
    80003058:	0007b023          	sd	zero,0(a5)
        head->size = (uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR;
    8000305c:	00063603          	ld	a2,0(a2)
    80003060:	00009797          	auipc	a5,0x9
    80003064:	a487b783          	ld	a5,-1464(a5) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003068:	0007b783          	ld	a5,0(a5)
    8000306c:	0006b683          	ld	a3,0(a3)
    80003070:	40d787b3          	sub	a5,a5,a3
    80003074:	00f63823          	sd	a5,16(a2)
        start = false;
    80003078:	00009797          	auipc	a5,0x9
    8000307c:	82078c23          	sb	zero,-1992(a5) # 8000b8b0 <_ZN15MemoryAllocator5startE>
    }

    if(!head) return nullptr;
    80003080:	00009517          	auipc	a0,0x9
    80003084:	aa053503          	ld	a0,-1376(a0) # 8000bb20 <_ZN15MemoryAllocator4headE>
    80003088:	06050863          	beqz	a0,800030f8 <_ZN15MemoryAllocator9mem_allocEm+0xd8>

    FreeMem *cur = head;
    size = (size + sizeof(FreeMem) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE * MEM_BLOCK_SIZE;
    8000308c:	05770713          	addi	a4,a4,87
    80003090:	fc077713          	andi	a4,a4,-64
    while(cur->size < size) {
    80003094:	01053783          	ld	a5,16(a0)
    80003098:	00e7f863          	bgeu	a5,a4,800030a8 <_ZN15MemoryAllocator9mem_allocEm+0x88>
        cur = cur->next;
    8000309c:	00053503          	ld	a0,0(a0)
        if(!cur) return nullptr;
    800030a0:	fe051ae3          	bnez	a0,80003094 <_ZN15MemoryAllocator9mem_allocEm+0x74>
    800030a4:	0540006f          	j	800030f8 <_ZN15MemoryAllocator9mem_allocEm+0xd8>
    }


    if(cur->size - size > 0){
    800030a8:	02e78463          	beq	a5,a4,800030d0 <_ZN15MemoryAllocator9mem_allocEm+0xb0>
        FreeMem * newFree = (FreeMem*)((uint64)cur + size);
    800030ac:	00e506b3          	add	a3,a0,a4
        newFree->size = cur->size - size;
    800030b0:	40e787b3          	sub	a5,a5,a4
    800030b4:	00f6b823          	sd	a5,16(a3)
        newFree->prev = cur;
    800030b8:	00a6b423          	sd	a0,8(a3)
        newFree->next = cur->next;
    800030bc:	00053783          	ld	a5,0(a0)
    800030c0:	00f6b023          	sd	a5,0(a3)
        if(cur->next != nullptr)
    800030c4:	00078463          	beqz	a5,800030cc <_ZN15MemoryAllocator9mem_allocEm+0xac>
            cur->next->prev = newFree;
    800030c8:	00d7b423          	sd	a3,8(a5)
        cur->next = newFree;
    800030cc:	00d53023          	sd	a3,0(a0)
    }

    if(cur->prev == nullptr){
    800030d0:	00853783          	ld	a5,8(a0)
    800030d4:	02078863          	beqz	a5,80003104 <_ZN15MemoryAllocator9mem_allocEm+0xe4>
        head = cur->next;
        head->prev = nullptr;
    }
    else{
        cur->prev->next = cur->next;
    800030d8:	00053683          	ld	a3,0(a0)
    800030dc:	00d7b023          	sd	a3,0(a5)
        cur->next->prev = cur->prev;
    800030e0:	00853783          	ld	a5,8(a0)
    800030e4:	00f6b423          	sd	a5,8(a3)
    }

    cur->size = size;
    800030e8:	00e53823          	sd	a4,16(a0)
    cur->next = cur->prev = nullptr;
    800030ec:	00053423          	sd	zero,8(a0)
    800030f0:	00053023          	sd	zero,0(a0)

    return (void*)((uint64)cur + sizeof(FreeMem));
    800030f4:	01850513          	addi	a0,a0,24
}
    800030f8:	00813403          	ld	s0,8(sp)
    800030fc:	01010113          	addi	sp,sp,16
    80003100:	00008067          	ret
        head = cur->next;
    80003104:	00053783          	ld	a5,0(a0)
    80003108:	00009697          	auipc	a3,0x9
    8000310c:	a0f6bc23          	sd	a5,-1512(a3) # 8000bb20 <_ZN15MemoryAllocator4headE>
        head->prev = nullptr;
    80003110:	0007b423          	sd	zero,8(a5)
    80003114:	fd5ff06f          	j	800030e8 <_ZN15MemoryAllocator9mem_allocEm+0xc8>

0000000080003118 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE>:

    tryToJoin(newFree);
    return 0;
}

void MemoryAllocator::tryToJoin(FreeMem *cur) {
    80003118:	ff010113          	addi	sp,sp,-16
    8000311c:	00813423          	sd	s0,8(sp)
    80003120:	01010413          	addi	s0,sp,16
    if(cur->prev && (uint64) cur->prev + cur->prev->size == (uint64) cur){
    80003124:	00853783          	ld	a5,8(a0)
    80003128:	00078863          	beqz	a5,80003138 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x20>
    8000312c:	0107b703          	ld	a4,16(a5)
    80003130:	00e786b3          	add	a3,a5,a4
    80003134:	02a68263          	beq	a3,a0,80003158 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x40>
        if(cur->next)
            cur->next->prev = cur->prev;
        cur = cur->prev;
    }

    if(cur->next && (uint64) cur + cur->size == (uint64) cur->next){
    80003138:	00053783          	ld	a5,0(a0)
    8000313c:	00078863          	beqz	a5,8000314c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x34>
    80003140:	01053703          	ld	a4,16(a0)
    80003144:	00e506b3          	add	a3,a0,a4
    80003148:	02f68e63          	beq	a3,a5,80003184 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x6c>
        cur->size += cur->next->size;
        cur->next = cur->next->next;
        if(cur->next)
            cur->next->prev = cur;
    }
    8000314c:	00813403          	ld	s0,8(sp)
    80003150:	01010113          	addi	sp,sp,16
    80003154:	00008067          	ret
        cur->prev->size += cur->size;
    80003158:	01053683          	ld	a3,16(a0)
    8000315c:	00d70733          	add	a4,a4,a3
    80003160:	00e7b823          	sd	a4,16(a5)
        cur->prev->next = cur->next;
    80003164:	00853703          	ld	a4,8(a0)
    80003168:	00053783          	ld	a5,0(a0)
    8000316c:	00f73023          	sd	a5,0(a4)
        if(cur->next)
    80003170:	00078663          	beqz	a5,8000317c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x64>
            cur->next->prev = cur->prev;
    80003174:	00853703          	ld	a4,8(a0)
    80003178:	00e7b423          	sd	a4,8(a5)
        cur = cur->prev;
    8000317c:	00853503          	ld	a0,8(a0)
    80003180:	fb9ff06f          	j	80003138 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x20>
        cur->size += cur->next->size;
    80003184:	0107b683          	ld	a3,16(a5)
    80003188:	00d70733          	add	a4,a4,a3
    8000318c:	00e53823          	sd	a4,16(a0)
        cur->next = cur->next->next;
    80003190:	0007b783          	ld	a5,0(a5)
    80003194:	00f53023          	sd	a5,0(a0)
        if(cur->next)
    80003198:	fa078ae3          	beqz	a5,8000314c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x34>
            cur->next->prev = cur;
    8000319c:	00a7b423          	sd	a0,8(a5)
    800031a0:	fadff06f          	j	8000314c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x34>

00000000800031a4 <_ZN15MemoryAllocator8mem_freeEPv>:
    if(start) return -3;
    800031a4:	00008797          	auipc	a5,0x8
    800031a8:	70c7c783          	lbu	a5,1804(a5) # 8000b8b0 <_ZN15MemoryAllocator5startE>
    800031ac:	0c079c63          	bnez	a5,80003284 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
    800031b0:	00050693          	mv	a3,a0
    ptr = (void *)((uint64) ptr - sizeof(FreeMem));
    800031b4:	fe850513          	addi	a0,a0,-24
    800031b8:	00050613          	mv	a2,a0
    if((uint64*) ptr < (uint64*) HEAP_START_ADDR || (uint64*) ptr >= (uint64*) HEAP_END_ADDR) return -1;
    800031bc:	00009797          	auipc	a5,0x9
    800031c0:	8bc7b783          	ld	a5,-1860(a5) # 8000ba78 <_GLOBAL_OFFSET_TABLE_+0x18>
    800031c4:	0007b783          	ld	a5,0(a5)
    800031c8:	0cf56263          	bltu	a0,a5,8000328c <_ZN15MemoryAllocator8mem_freeEPv+0xe8>
    800031cc:	00009797          	auipc	a5,0x9
    800031d0:	8dc7b783          	ld	a5,-1828(a5) # 8000baa8 <_GLOBAL_OFFSET_TABLE_+0x48>
    800031d4:	0007b783          	ld	a5,0(a5)
    800031d8:	0af57e63          	bgeu	a0,a5,80003294 <_ZN15MemoryAllocator8mem_freeEPv+0xf0>
    if(head && (uint64*)ptr >= (uint64*) head){
    800031dc:	00009597          	auipc	a1,0x9
    800031e0:	9445b583          	ld	a1,-1724(a1) # 8000bb20 <_ZN15MemoryAllocator4headE>
    800031e4:	02058e63          	beqz	a1,80003220 <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    800031e8:	04b56263          	bltu	a0,a1,8000322c <_ZN15MemoryAllocator8mem_freeEPv+0x88>
        for(cur = head; cur->next != nullptr && (uint64*) ptr > (uint64*) cur->next; cur = cur->next);
    800031ec:	00058793          	mv	a5,a1
    800031f0:	00078713          	mv	a4,a5
    800031f4:	0007b783          	ld	a5,0(a5)
    800031f8:	00078463          	beqz	a5,80003200 <_ZN15MemoryAllocator8mem_freeEPv+0x5c>
    800031fc:	fec7eae3          	bltu	a5,a2,800031f0 <_ZN15MemoryAllocator8mem_freeEPv+0x4c>
        if((uint64) cur + cur->size >= (uint64) ptr) return -2;
    80003200:	01073783          	ld	a5,16(a4)
    80003204:	00f707b3          	add	a5,a4,a5
    80003208:	08a7fa63          	bgeu	a5,a0,8000329c <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    newFree->prev = cur;
    8000320c:	00e53423          	sd	a4,8(a0)
    if(cur)
    80003210:	02070263          	beqz	a4,80003234 <_ZN15MemoryAllocator8mem_freeEPv+0x90>
        newFree->next = cur->next;
    80003214:	00073783          	ld	a5,0(a4)
    80003218:	fef6b423          	sd	a5,-24(a3)
    8000321c:	01c0006f          	j	80003238 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
    newFree->prev = cur;
    80003220:	00053423          	sd	zero,8(a0)
    FreeMem* cur = nullptr;
    80003224:	00058713          	mv	a4,a1
    80003228:	00c0006f          	j	80003234 <_ZN15MemoryAllocator8mem_freeEPv+0x90>
    newFree->prev = cur;
    8000322c:	00053423          	sd	zero,8(a0)
    FreeMem* cur = nullptr;
    80003230:	00000713          	li	a4,0
        newFree->next = head;
    80003234:	feb6b423          	sd	a1,-24(a3)
int MemoryAllocator::mem_free(void * ptr) {
    80003238:	ff010113          	addi	sp,sp,-16
    8000323c:	00113423          	sd	ra,8(sp)
    80003240:	00813023          	sd	s0,0(sp)
    80003244:	01010413          	addi	s0,sp,16
    if(newFree->next)
    80003248:	fe86b783          	ld	a5,-24(a3)
    8000324c:	00078463          	beqz	a5,80003254 <_ZN15MemoryAllocator8mem_freeEPv+0xb0>
        newFree->next->prev = newFree;
    80003250:	00a7b423          	sd	a0,8(a5)
    if(cur)
    80003254:	02070263          	beqz	a4,80003278 <_ZN15MemoryAllocator8mem_freeEPv+0xd4>
        cur->next = newFree;
    80003258:	00a73023          	sd	a0,0(a4)
    tryToJoin(newFree);
    8000325c:	00000097          	auipc	ra,0x0
    80003260:	ebc080e7          	jalr	-324(ra) # 80003118 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE>
    return 0;
    80003264:	00000513          	li	a0,0
}
    80003268:	00813083          	ld	ra,8(sp)
    8000326c:	00013403          	ld	s0,0(sp)
    80003270:	01010113          	addi	sp,sp,16
    80003274:	00008067          	ret
        head = newFree;
    80003278:	00009797          	auipc	a5,0x9
    8000327c:	8aa7b423          	sd	a0,-1880(a5) # 8000bb20 <_ZN15MemoryAllocator4headE>
    80003280:	fddff06f          	j	8000325c <_ZN15MemoryAllocator8mem_freeEPv+0xb8>
    if(start) return -3;
    80003284:	ffd00513          	li	a0,-3
    80003288:	00008067          	ret
    if((uint64*) ptr < (uint64*) HEAP_START_ADDR || (uint64*) ptr >= (uint64*) HEAP_END_ADDR) return -1;
    8000328c:	fff00513          	li	a0,-1
    80003290:	00008067          	ret
    80003294:	fff00513          	li	a0,-1
    80003298:	00008067          	ret
        if((uint64) cur + cur->size >= (uint64) ptr) return -2;
    8000329c:	ffe00513          	li	a0,-2
}
    800032a0:	00008067          	ret

00000000800032a4 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    800032a4:	fe010113          	addi	sp,sp,-32
    800032a8:	00113c23          	sd	ra,24(sp)
    800032ac:	00813823          	sd	s0,16(sp)
    800032b0:	00913423          	sd	s1,8(sp)
    800032b4:	01213023          	sd	s2,0(sp)
    800032b8:	02010413          	addi	s0,sp,32
    800032bc:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800032c0:	00000913          	li	s2,0
    800032c4:	00c0006f          	j	800032d0 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    800032c8:	ffffe097          	auipc	ra,0xffffe
    800032cc:	184080e7          	jalr	388(ra) # 8000144c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    800032d0:	ffffe097          	auipc	ra,0xffffe
    800032d4:	2a0080e7          	jalr	672(ra) # 80001570 <_Z4getcv>
    800032d8:	0005059b          	sext.w	a1,a0
    800032dc:	01b00793          	li	a5,27
    800032e0:	02f58a63          	beq	a1,a5,80003314 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800032e4:	0084b503          	ld	a0,8(s1)
    800032e8:	00003097          	auipc	ra,0x3
    800032ec:	2ac080e7          	jalr	684(ra) # 80006594 <_ZN6Buffer3putEi>
        i++;
    800032f0:	0019071b          	addiw	a4,s2,1
    800032f4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800032f8:	0004a683          	lw	a3,0(s1)
    800032fc:	0026979b          	slliw	a5,a3,0x2
    80003300:	00d787bb          	addw	a5,a5,a3
    80003304:	0017979b          	slliw	a5,a5,0x1
    80003308:	02f767bb          	remw	a5,a4,a5
    8000330c:	fc0792e3          	bnez	a5,800032d0 <_ZL16producerKeyboardPv+0x2c>
    80003310:	fb9ff06f          	j	800032c8 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003314:	00100793          	li	a5,1
    80003318:	00009717          	auipc	a4,0x9
    8000331c:	80f72823          	sw	a5,-2032(a4) # 8000bb28 <_ZL9threadEnd>
    data->buffer->put('!');
    80003320:	02100593          	li	a1,33
    80003324:	0084b503          	ld	a0,8(s1)
    80003328:	00003097          	auipc	ra,0x3
    8000332c:	26c080e7          	jalr	620(ra) # 80006594 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003330:	0104b503          	ld	a0,16(s1)
    80003334:	ffffe097          	auipc	ra,0xffffe
    80003338:	1e4080e7          	jalr	484(ra) # 80001518 <_Z10sem_signalP3Sem>
}
    8000333c:	01813083          	ld	ra,24(sp)
    80003340:	01013403          	ld	s0,16(sp)
    80003344:	00813483          	ld	s1,8(sp)
    80003348:	00013903          	ld	s2,0(sp)
    8000334c:	02010113          	addi	sp,sp,32
    80003350:	00008067          	ret

0000000080003354 <_ZL8producerPv>:

static void producer(void *arg) {
    80003354:	fe010113          	addi	sp,sp,-32
    80003358:	00113c23          	sd	ra,24(sp)
    8000335c:	00813823          	sd	s0,16(sp)
    80003360:	00913423          	sd	s1,8(sp)
    80003364:	01213023          	sd	s2,0(sp)
    80003368:	02010413          	addi	s0,sp,32
    8000336c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003370:	00000913          	li	s2,0
    80003374:	00c0006f          	j	80003380 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003378:	ffffe097          	auipc	ra,0xffffe
    8000337c:	0d4080e7          	jalr	212(ra) # 8000144c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003380:	00008797          	auipc	a5,0x8
    80003384:	7a87a783          	lw	a5,1960(a5) # 8000bb28 <_ZL9threadEnd>
    80003388:	02079e63          	bnez	a5,800033c4 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    8000338c:	0004a583          	lw	a1,0(s1)
    80003390:	0305859b          	addiw	a1,a1,48
    80003394:	0084b503          	ld	a0,8(s1)
    80003398:	00003097          	auipc	ra,0x3
    8000339c:	1fc080e7          	jalr	508(ra) # 80006594 <_ZN6Buffer3putEi>
        i++;
    800033a0:	0019071b          	addiw	a4,s2,1
    800033a4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800033a8:	0004a683          	lw	a3,0(s1)
    800033ac:	0026979b          	slliw	a5,a3,0x2
    800033b0:	00d787bb          	addw	a5,a5,a3
    800033b4:	0017979b          	slliw	a5,a5,0x1
    800033b8:	02f767bb          	remw	a5,a4,a5
    800033bc:	fc0792e3          	bnez	a5,80003380 <_ZL8producerPv+0x2c>
    800033c0:	fb9ff06f          	j	80003378 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800033c4:	0104b503          	ld	a0,16(s1)
    800033c8:	ffffe097          	auipc	ra,0xffffe
    800033cc:	150080e7          	jalr	336(ra) # 80001518 <_Z10sem_signalP3Sem>
}
    800033d0:	01813083          	ld	ra,24(sp)
    800033d4:	01013403          	ld	s0,16(sp)
    800033d8:	00813483          	ld	s1,8(sp)
    800033dc:	00013903          	ld	s2,0(sp)
    800033e0:	02010113          	addi	sp,sp,32
    800033e4:	00008067          	ret

00000000800033e8 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800033e8:	fd010113          	addi	sp,sp,-48
    800033ec:	02113423          	sd	ra,40(sp)
    800033f0:	02813023          	sd	s0,32(sp)
    800033f4:	00913c23          	sd	s1,24(sp)
    800033f8:	01213823          	sd	s2,16(sp)
    800033fc:	01313423          	sd	s3,8(sp)
    80003400:	03010413          	addi	s0,sp,48
    80003404:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003408:	00000993          	li	s3,0
    8000340c:	01c0006f          	j	80003428 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003410:	ffffe097          	auipc	ra,0xffffe
    80003414:	03c080e7          	jalr	60(ra) # 8000144c <_Z15thread_dispatchv>
    80003418:	0500006f          	j	80003468 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    8000341c:	00a00513          	li	a0,10
    80003420:	ffffe097          	auipc	ra,0xffffe
    80003424:	178080e7          	jalr	376(ra) # 80001598 <_Z4putcc>
    while (!threadEnd) {
    80003428:	00008797          	auipc	a5,0x8
    8000342c:	7007a783          	lw	a5,1792(a5) # 8000bb28 <_ZL9threadEnd>
    80003430:	06079063          	bnez	a5,80003490 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003434:	00893503          	ld	a0,8(s2)
    80003438:	00003097          	auipc	ra,0x3
    8000343c:	1ec080e7          	jalr	492(ra) # 80006624 <_ZN6Buffer3getEv>
        i++;
    80003440:	0019849b          	addiw	s1,s3,1
    80003444:	0004899b          	sext.w	s3,s1
        putc(key);
    80003448:	0ff57513          	andi	a0,a0,255
    8000344c:	ffffe097          	auipc	ra,0xffffe
    80003450:	14c080e7          	jalr	332(ra) # 80001598 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003454:	00092703          	lw	a4,0(s2)
    80003458:	0027179b          	slliw	a5,a4,0x2
    8000345c:	00e787bb          	addw	a5,a5,a4
    80003460:	02f4e7bb          	remw	a5,s1,a5
    80003464:	fa0786e3          	beqz	a5,80003410 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003468:	05000793          	li	a5,80
    8000346c:	02f4e4bb          	remw	s1,s1,a5
    80003470:	fa049ce3          	bnez	s1,80003428 <_ZL8consumerPv+0x40>
    80003474:	fa9ff06f          	j	8000341c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003478:	00893503          	ld	a0,8(s2)
    8000347c:	00003097          	auipc	ra,0x3
    80003480:	1a8080e7          	jalr	424(ra) # 80006624 <_ZN6Buffer3getEv>
        putc(key);
    80003484:	0ff57513          	andi	a0,a0,255
    80003488:	ffffe097          	auipc	ra,0xffffe
    8000348c:	110080e7          	jalr	272(ra) # 80001598 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003490:	00893503          	ld	a0,8(s2)
    80003494:	00003097          	auipc	ra,0x3
    80003498:	21c080e7          	jalr	540(ra) # 800066b0 <_ZN6Buffer6getCntEv>
    8000349c:	fca04ee3          	bgtz	a0,80003478 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800034a0:	01093503          	ld	a0,16(s2)
    800034a4:	ffffe097          	auipc	ra,0xffffe
    800034a8:	074080e7          	jalr	116(ra) # 80001518 <_Z10sem_signalP3Sem>
}
    800034ac:	02813083          	ld	ra,40(sp)
    800034b0:	02013403          	ld	s0,32(sp)
    800034b4:	01813483          	ld	s1,24(sp)
    800034b8:	01013903          	ld	s2,16(sp)
    800034bc:	00813983          	ld	s3,8(sp)
    800034c0:	03010113          	addi	sp,sp,48
    800034c4:	00008067          	ret

00000000800034c8 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800034c8:	f9010113          	addi	sp,sp,-112
    800034cc:	06113423          	sd	ra,104(sp)
    800034d0:	06813023          	sd	s0,96(sp)
    800034d4:	04913c23          	sd	s1,88(sp)
    800034d8:	05213823          	sd	s2,80(sp)
    800034dc:	05313423          	sd	s3,72(sp)
    800034e0:	05413023          	sd	s4,64(sp)
    800034e4:	03513c23          	sd	s5,56(sp)
    800034e8:	03613823          	sd	s6,48(sp)
    800034ec:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800034f0:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800034f4:	00006517          	auipc	a0,0x6
    800034f8:	eb450513          	addi	a0,a0,-332 # 800093a8 <CONSOLE_STATUS+0x398>
    800034fc:	00002097          	auipc	ra,0x2
    80003500:	220080e7          	jalr	544(ra) # 8000571c <_Z11printStringPKc>
    getString(input, 30);
    80003504:	01e00593          	li	a1,30
    80003508:	fa040493          	addi	s1,s0,-96
    8000350c:	00048513          	mv	a0,s1
    80003510:	00002097          	auipc	ra,0x2
    80003514:	294080e7          	jalr	660(ra) # 800057a4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003518:	00048513          	mv	a0,s1
    8000351c:	00002097          	auipc	ra,0x2
    80003520:	360080e7          	jalr	864(ra) # 8000587c <_Z11stringToIntPKc>
    80003524:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003528:	00006517          	auipc	a0,0x6
    8000352c:	ea050513          	addi	a0,a0,-352 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80003530:	00002097          	auipc	ra,0x2
    80003534:	1ec080e7          	jalr	492(ra) # 8000571c <_Z11printStringPKc>
    getString(input, 30);
    80003538:	01e00593          	li	a1,30
    8000353c:	00048513          	mv	a0,s1
    80003540:	00002097          	auipc	ra,0x2
    80003544:	264080e7          	jalr	612(ra) # 800057a4 <_Z9getStringPci>
    n = stringToInt(input);
    80003548:	00048513          	mv	a0,s1
    8000354c:	00002097          	auipc	ra,0x2
    80003550:	330080e7          	jalr	816(ra) # 8000587c <_Z11stringToIntPKc>
    80003554:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003558:	00006517          	auipc	a0,0x6
    8000355c:	e9050513          	addi	a0,a0,-368 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80003560:	00002097          	auipc	ra,0x2
    80003564:	1bc080e7          	jalr	444(ra) # 8000571c <_Z11printStringPKc>
    80003568:	00000613          	li	a2,0
    8000356c:	00a00593          	li	a1,10
    80003570:	00090513          	mv	a0,s2
    80003574:	00002097          	auipc	ra,0x2
    80003578:	358080e7          	jalr	856(ra) # 800058cc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000357c:	00006517          	auipc	a0,0x6
    80003580:	e8450513          	addi	a0,a0,-380 # 80009400 <CONSOLE_STATUS+0x3f0>
    80003584:	00002097          	auipc	ra,0x2
    80003588:	198080e7          	jalr	408(ra) # 8000571c <_Z11printStringPKc>
    8000358c:	00000613          	li	a2,0
    80003590:	00a00593          	li	a1,10
    80003594:	00048513          	mv	a0,s1
    80003598:	00002097          	auipc	ra,0x2
    8000359c:	334080e7          	jalr	820(ra) # 800058cc <_Z8printIntiii>
    printString(".\n");
    800035a0:	00006517          	auipc	a0,0x6
    800035a4:	e7850513          	addi	a0,a0,-392 # 80009418 <CONSOLE_STATUS+0x408>
    800035a8:	00002097          	auipc	ra,0x2
    800035ac:	174080e7          	jalr	372(ra) # 8000571c <_Z11printStringPKc>
    if(threadNum > n) {
    800035b0:	0324c463          	blt	s1,s2,800035d8 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    800035b4:	03205c63          	blez	s2,800035ec <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    800035b8:	03800513          	li	a0,56
    800035bc:	fffff097          	auipc	ra,0xfffff
    800035c0:	da4080e7          	jalr	-604(ra) # 80002360 <_Znwm>
    800035c4:	00050a13          	mv	s4,a0
    800035c8:	00048593          	mv	a1,s1
    800035cc:	00003097          	auipc	ra,0x3
    800035d0:	f2c080e7          	jalr	-212(ra) # 800064f8 <_ZN6BufferC1Ei>
    800035d4:	0300006f          	j	80003604 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800035d8:	00006517          	auipc	a0,0x6
    800035dc:	e4850513          	addi	a0,a0,-440 # 80009420 <CONSOLE_STATUS+0x410>
    800035e0:	00002097          	auipc	ra,0x2
    800035e4:	13c080e7          	jalr	316(ra) # 8000571c <_Z11printStringPKc>
        return;
    800035e8:	0140006f          	j	800035fc <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800035ec:	00006517          	auipc	a0,0x6
    800035f0:	e7450513          	addi	a0,a0,-396 # 80009460 <CONSOLE_STATUS+0x450>
    800035f4:	00002097          	auipc	ra,0x2
    800035f8:	128080e7          	jalr	296(ra) # 8000571c <_Z11printStringPKc>
        return;
    800035fc:	000b0113          	mv	sp,s6
    80003600:	1500006f          	j	80003750 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003604:	00000593          	li	a1,0
    80003608:	00008517          	auipc	a0,0x8
    8000360c:	52850513          	addi	a0,a0,1320 # 8000bb30 <_ZL10waitForAll>
    80003610:	ffffe097          	auipc	ra,0xffffe
    80003614:	e80080e7          	jalr	-384(ra) # 80001490 <_Z8sem_openPP3Semj>
    thread_t threads[threadNum];
    80003618:	00391793          	slli	a5,s2,0x3
    8000361c:	00f78793          	addi	a5,a5,15
    80003620:	ff07f793          	andi	a5,a5,-16
    80003624:	40f10133          	sub	sp,sp,a5
    80003628:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    8000362c:	0019071b          	addiw	a4,s2,1
    80003630:	00171793          	slli	a5,a4,0x1
    80003634:	00e787b3          	add	a5,a5,a4
    80003638:	00379793          	slli	a5,a5,0x3
    8000363c:	00f78793          	addi	a5,a5,15
    80003640:	ff07f793          	andi	a5,a5,-16
    80003644:	40f10133          	sub	sp,sp,a5
    80003648:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    8000364c:	00191613          	slli	a2,s2,0x1
    80003650:	012607b3          	add	a5,a2,s2
    80003654:	00379793          	slli	a5,a5,0x3
    80003658:	00f987b3          	add	a5,s3,a5
    8000365c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003660:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003664:	00008717          	auipc	a4,0x8
    80003668:	4cc73703          	ld	a4,1228(a4) # 8000bb30 <_ZL10waitForAll>
    8000366c:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003670:	00078613          	mv	a2,a5
    80003674:	00000597          	auipc	a1,0x0
    80003678:	d7458593          	addi	a1,a1,-652 # 800033e8 <_ZL8consumerPv>
    8000367c:	f9840513          	addi	a0,s0,-104
    80003680:	ffffe097          	auipc	ra,0xffffe
    80003684:	d1c080e7          	jalr	-740(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003688:	00000493          	li	s1,0
    8000368c:	0280006f          	j	800036b4 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003690:	00000597          	auipc	a1,0x0
    80003694:	c1458593          	addi	a1,a1,-1004 # 800032a4 <_ZL16producerKeyboardPv>
                      data + i);
    80003698:	00179613          	slli	a2,a5,0x1
    8000369c:	00f60633          	add	a2,a2,a5
    800036a0:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800036a4:	00c98633          	add	a2,s3,a2
    800036a8:	ffffe097          	auipc	ra,0xffffe
    800036ac:	cf4080e7          	jalr	-780(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800036b0:	0014849b          	addiw	s1,s1,1
    800036b4:	0524d263          	bge	s1,s2,800036f8 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800036b8:	00149793          	slli	a5,s1,0x1
    800036bc:	009787b3          	add	a5,a5,s1
    800036c0:	00379793          	slli	a5,a5,0x3
    800036c4:	00f987b3          	add	a5,s3,a5
    800036c8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800036cc:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800036d0:	00008717          	auipc	a4,0x8
    800036d4:	46073703          	ld	a4,1120(a4) # 8000bb30 <_ZL10waitForAll>
    800036d8:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800036dc:	00048793          	mv	a5,s1
    800036e0:	00349513          	slli	a0,s1,0x3
    800036e4:	00aa8533          	add	a0,s5,a0
    800036e8:	fa9054e3          	blez	s1,80003690 <_Z22producerConsumer_C_APIv+0x1c8>
    800036ec:	00000597          	auipc	a1,0x0
    800036f0:	c6858593          	addi	a1,a1,-920 # 80003354 <_ZL8producerPv>
    800036f4:	fa5ff06f          	j	80003698 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800036f8:	ffffe097          	auipc	ra,0xffffe
    800036fc:	d54080e7          	jalr	-684(ra) # 8000144c <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003700:	00000493          	li	s1,0
    80003704:	00994e63          	blt	s2,s1,80003720 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003708:	00008517          	auipc	a0,0x8
    8000370c:	42853503          	ld	a0,1064(a0) # 8000bb30 <_ZL10waitForAll>
    80003710:	ffffe097          	auipc	ra,0xffffe
    80003714:	ddc080e7          	jalr	-548(ra) # 800014ec <_Z8sem_waitP3Sem>
    for (int i = 0; i <= threadNum; i++) {
    80003718:	0014849b          	addiw	s1,s1,1
    8000371c:	fe9ff06f          	j	80003704 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003720:	00008517          	auipc	a0,0x8
    80003724:	41053503          	ld	a0,1040(a0) # 8000bb30 <_ZL10waitForAll>
    80003728:	ffffe097          	auipc	ra,0xffffe
    8000372c:	d98080e7          	jalr	-616(ra) # 800014c0 <_Z9sem_closeP3Sem>
    delete buffer;
    80003730:	000a0e63          	beqz	s4,8000374c <_Z22producerConsumer_C_APIv+0x284>
    80003734:	000a0513          	mv	a0,s4
    80003738:	00003097          	auipc	ra,0x3
    8000373c:	000080e7          	jalr	ra # 80006738 <_ZN6BufferD1Ev>
    80003740:	000a0513          	mv	a0,s4
    80003744:	fffff097          	auipc	ra,0xfffff
    80003748:	c44080e7          	jalr	-956(ra) # 80002388 <_ZdlPv>
    8000374c:	000b0113          	mv	sp,s6

}
    80003750:	f9040113          	addi	sp,s0,-112
    80003754:	06813083          	ld	ra,104(sp)
    80003758:	06013403          	ld	s0,96(sp)
    8000375c:	05813483          	ld	s1,88(sp)
    80003760:	05013903          	ld	s2,80(sp)
    80003764:	04813983          	ld	s3,72(sp)
    80003768:	04013a03          	ld	s4,64(sp)
    8000376c:	03813a83          	ld	s5,56(sp)
    80003770:	03013b03          	ld	s6,48(sp)
    80003774:	07010113          	addi	sp,sp,112
    80003778:	00008067          	ret
    8000377c:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003780:	000a0513          	mv	a0,s4
    80003784:	fffff097          	auipc	ra,0xfffff
    80003788:	c04080e7          	jalr	-1020(ra) # 80002388 <_ZdlPv>
    8000378c:	00048513          	mv	a0,s1
    80003790:	00009097          	auipc	ra,0x9
    80003794:	4b8080e7          	jalr	1208(ra) # 8000cc48 <_Unwind_Resume>

0000000080003798 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003798:	fe010113          	addi	sp,sp,-32
    8000379c:	00113c23          	sd	ra,24(sp)
    800037a0:	00813823          	sd	s0,16(sp)
    800037a4:	00913423          	sd	s1,8(sp)
    800037a8:	01213023          	sd	s2,0(sp)
    800037ac:	02010413          	addi	s0,sp,32
    800037b0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800037b4:	00100793          	li	a5,1
    800037b8:	02a7f863          	bgeu	a5,a0,800037e8 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800037bc:	00a00793          	li	a5,10
    800037c0:	02f577b3          	remu	a5,a0,a5
    800037c4:	02078e63          	beqz	a5,80003800 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800037c8:	fff48513          	addi	a0,s1,-1
    800037cc:	00000097          	auipc	ra,0x0
    800037d0:	fcc080e7          	jalr	-52(ra) # 80003798 <_ZL9fibonaccim>
    800037d4:	00050913          	mv	s2,a0
    800037d8:	ffe48513          	addi	a0,s1,-2
    800037dc:	00000097          	auipc	ra,0x0
    800037e0:	fbc080e7          	jalr	-68(ra) # 80003798 <_ZL9fibonaccim>
    800037e4:	00a90533          	add	a0,s2,a0
}
    800037e8:	01813083          	ld	ra,24(sp)
    800037ec:	01013403          	ld	s0,16(sp)
    800037f0:	00813483          	ld	s1,8(sp)
    800037f4:	00013903          	ld	s2,0(sp)
    800037f8:	02010113          	addi	sp,sp,32
    800037fc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003800:	ffffe097          	auipc	ra,0xffffe
    80003804:	c4c080e7          	jalr	-948(ra) # 8000144c <_Z15thread_dispatchv>
    80003808:	fc1ff06f          	j	800037c8 <_ZL9fibonaccim+0x30>

000000008000380c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000380c:	fe010113          	addi	sp,sp,-32
    80003810:	00113c23          	sd	ra,24(sp)
    80003814:	00813823          	sd	s0,16(sp)
    80003818:	00913423          	sd	s1,8(sp)
    8000381c:	01213023          	sd	s2,0(sp)
    80003820:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003824:	00000913          	li	s2,0
    80003828:	0380006f          	j	80003860 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000382c:	ffffe097          	auipc	ra,0xffffe
    80003830:	c20080e7          	jalr	-992(ra) # 8000144c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003834:	00148493          	addi	s1,s1,1
    80003838:	000027b7          	lui	a5,0x2
    8000383c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003840:	0097ee63          	bltu	a5,s1,8000385c <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003844:	00000713          	li	a4,0
    80003848:	000077b7          	lui	a5,0x7
    8000384c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003850:	fce7eee3          	bltu	a5,a4,8000382c <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003854:	00170713          	addi	a4,a4,1
    80003858:	ff1ff06f          	j	80003848 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000385c:	00190913          	addi	s2,s2,1
    80003860:	00900793          	li	a5,9
    80003864:	0527e063          	bltu	a5,s2,800038a4 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003868:	00006517          	auipc	a0,0x6
    8000386c:	c2850513          	addi	a0,a0,-984 # 80009490 <CONSOLE_STATUS+0x480>
    80003870:	00002097          	auipc	ra,0x2
    80003874:	eac080e7          	jalr	-340(ra) # 8000571c <_Z11printStringPKc>
    80003878:	00000613          	li	a2,0
    8000387c:	00a00593          	li	a1,10
    80003880:	0009051b          	sext.w	a0,s2
    80003884:	00002097          	auipc	ra,0x2
    80003888:	048080e7          	jalr	72(ra) # 800058cc <_Z8printIntiii>
    8000388c:	00006517          	auipc	a0,0x6
    80003890:	8d450513          	addi	a0,a0,-1836 # 80009160 <CONSOLE_STATUS+0x150>
    80003894:	00002097          	auipc	ra,0x2
    80003898:	e88080e7          	jalr	-376(ra) # 8000571c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000389c:	00000493          	li	s1,0
    800038a0:	f99ff06f          	j	80003838 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    800038a4:	00006517          	auipc	a0,0x6
    800038a8:	bf450513          	addi	a0,a0,-1036 # 80009498 <CONSOLE_STATUS+0x488>
    800038ac:	00002097          	auipc	ra,0x2
    800038b0:	e70080e7          	jalr	-400(ra) # 8000571c <_Z11printStringPKc>
    finishedA = true;
    800038b4:	00100793          	li	a5,1
    800038b8:	00008717          	auipc	a4,0x8
    800038bc:	28f70023          	sb	a5,640(a4) # 8000bb38 <_ZL9finishedA>
}
    800038c0:	01813083          	ld	ra,24(sp)
    800038c4:	01013403          	ld	s0,16(sp)
    800038c8:	00813483          	ld	s1,8(sp)
    800038cc:	00013903          	ld	s2,0(sp)
    800038d0:	02010113          	addi	sp,sp,32
    800038d4:	00008067          	ret

00000000800038d8 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800038d8:	fe010113          	addi	sp,sp,-32
    800038dc:	00113c23          	sd	ra,24(sp)
    800038e0:	00813823          	sd	s0,16(sp)
    800038e4:	00913423          	sd	s1,8(sp)
    800038e8:	01213023          	sd	s2,0(sp)
    800038ec:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800038f0:	00000913          	li	s2,0
    800038f4:	0380006f          	j	8000392c <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800038f8:	ffffe097          	auipc	ra,0xffffe
    800038fc:	b54080e7          	jalr	-1196(ra) # 8000144c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003900:	00148493          	addi	s1,s1,1
    80003904:	000027b7          	lui	a5,0x2
    80003908:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000390c:	0097ee63          	bltu	a5,s1,80003928 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003910:	00000713          	li	a4,0
    80003914:	000077b7          	lui	a5,0x7
    80003918:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000391c:	fce7eee3          	bltu	a5,a4,800038f8 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003920:	00170713          	addi	a4,a4,1
    80003924:	ff1ff06f          	j	80003914 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003928:	00190913          	addi	s2,s2,1
    8000392c:	00f00793          	li	a5,15
    80003930:	0527e063          	bltu	a5,s2,80003970 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003934:	00006517          	auipc	a0,0x6
    80003938:	b7450513          	addi	a0,a0,-1164 # 800094a8 <CONSOLE_STATUS+0x498>
    8000393c:	00002097          	auipc	ra,0x2
    80003940:	de0080e7          	jalr	-544(ra) # 8000571c <_Z11printStringPKc>
    80003944:	00000613          	li	a2,0
    80003948:	00a00593          	li	a1,10
    8000394c:	0009051b          	sext.w	a0,s2
    80003950:	00002097          	auipc	ra,0x2
    80003954:	f7c080e7          	jalr	-132(ra) # 800058cc <_Z8printIntiii>
    80003958:	00006517          	auipc	a0,0x6
    8000395c:	80850513          	addi	a0,a0,-2040 # 80009160 <CONSOLE_STATUS+0x150>
    80003960:	00002097          	auipc	ra,0x2
    80003964:	dbc080e7          	jalr	-580(ra) # 8000571c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003968:	00000493          	li	s1,0
    8000396c:	f99ff06f          	j	80003904 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003970:	00006517          	auipc	a0,0x6
    80003974:	b4050513          	addi	a0,a0,-1216 # 800094b0 <CONSOLE_STATUS+0x4a0>
    80003978:	00002097          	auipc	ra,0x2
    8000397c:	da4080e7          	jalr	-604(ra) # 8000571c <_Z11printStringPKc>
    finishedB = true;
    80003980:	00100793          	li	a5,1
    80003984:	00008717          	auipc	a4,0x8
    80003988:	1af70aa3          	sb	a5,437(a4) # 8000bb39 <_ZL9finishedB>
    thread_dispatch();
    8000398c:	ffffe097          	auipc	ra,0xffffe
    80003990:	ac0080e7          	jalr	-1344(ra) # 8000144c <_Z15thread_dispatchv>
}
    80003994:	01813083          	ld	ra,24(sp)
    80003998:	01013403          	ld	s0,16(sp)
    8000399c:	00813483          	ld	s1,8(sp)
    800039a0:	00013903          	ld	s2,0(sp)
    800039a4:	02010113          	addi	sp,sp,32
    800039a8:	00008067          	ret

00000000800039ac <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800039ac:	fe010113          	addi	sp,sp,-32
    800039b0:	00113c23          	sd	ra,24(sp)
    800039b4:	00813823          	sd	s0,16(sp)
    800039b8:	00913423          	sd	s1,8(sp)
    800039bc:	01213023          	sd	s2,0(sp)
    800039c0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800039c4:	00000493          	li	s1,0
    800039c8:	0400006f          	j	80003a08 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800039cc:	00006517          	auipc	a0,0x6
    800039d0:	af450513          	addi	a0,a0,-1292 # 800094c0 <CONSOLE_STATUS+0x4b0>
    800039d4:	00002097          	auipc	ra,0x2
    800039d8:	d48080e7          	jalr	-696(ra) # 8000571c <_Z11printStringPKc>
    800039dc:	00000613          	li	a2,0
    800039e0:	00a00593          	li	a1,10
    800039e4:	00048513          	mv	a0,s1
    800039e8:	00002097          	auipc	ra,0x2
    800039ec:	ee4080e7          	jalr	-284(ra) # 800058cc <_Z8printIntiii>
    800039f0:	00005517          	auipc	a0,0x5
    800039f4:	77050513          	addi	a0,a0,1904 # 80009160 <CONSOLE_STATUS+0x150>
    800039f8:	00002097          	auipc	ra,0x2
    800039fc:	d24080e7          	jalr	-732(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003a00:	0014849b          	addiw	s1,s1,1
    80003a04:	0ff4f493          	andi	s1,s1,255
    80003a08:	00200793          	li	a5,2
    80003a0c:	fc97f0e3          	bgeu	a5,s1,800039cc <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003a10:	00006517          	auipc	a0,0x6
    80003a14:	ab850513          	addi	a0,a0,-1352 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80003a18:	00002097          	auipc	ra,0x2
    80003a1c:	d04080e7          	jalr	-764(ra) # 8000571c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003a20:	00700313          	li	t1,7
    thread_dispatch();
    80003a24:	ffffe097          	auipc	ra,0xffffe
    80003a28:	a28080e7          	jalr	-1496(ra) # 8000144c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003a2c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003a30:	00006517          	auipc	a0,0x6
    80003a34:	aa850513          	addi	a0,a0,-1368 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80003a38:	00002097          	auipc	ra,0x2
    80003a3c:	ce4080e7          	jalr	-796(ra) # 8000571c <_Z11printStringPKc>
    80003a40:	00000613          	li	a2,0
    80003a44:	00a00593          	li	a1,10
    80003a48:	0009051b          	sext.w	a0,s2
    80003a4c:	00002097          	auipc	ra,0x2
    80003a50:	e80080e7          	jalr	-384(ra) # 800058cc <_Z8printIntiii>
    80003a54:	00005517          	auipc	a0,0x5
    80003a58:	70c50513          	addi	a0,a0,1804 # 80009160 <CONSOLE_STATUS+0x150>
    80003a5c:	00002097          	auipc	ra,0x2
    80003a60:	cc0080e7          	jalr	-832(ra) # 8000571c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003a64:	00c00513          	li	a0,12
    80003a68:	00000097          	auipc	ra,0x0
    80003a6c:	d30080e7          	jalr	-720(ra) # 80003798 <_ZL9fibonaccim>
    80003a70:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003a74:	00006517          	auipc	a0,0x6
    80003a78:	a6c50513          	addi	a0,a0,-1428 # 800094e0 <CONSOLE_STATUS+0x4d0>
    80003a7c:	00002097          	auipc	ra,0x2
    80003a80:	ca0080e7          	jalr	-864(ra) # 8000571c <_Z11printStringPKc>
    80003a84:	00000613          	li	a2,0
    80003a88:	00a00593          	li	a1,10
    80003a8c:	0009051b          	sext.w	a0,s2
    80003a90:	00002097          	auipc	ra,0x2
    80003a94:	e3c080e7          	jalr	-452(ra) # 800058cc <_Z8printIntiii>
    80003a98:	00005517          	auipc	a0,0x5
    80003a9c:	6c850513          	addi	a0,a0,1736 # 80009160 <CONSOLE_STATUS+0x150>
    80003aa0:	00002097          	auipc	ra,0x2
    80003aa4:	c7c080e7          	jalr	-900(ra) # 8000571c <_Z11printStringPKc>
    80003aa8:	0400006f          	j	80003ae8 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003aac:	00006517          	auipc	a0,0x6
    80003ab0:	a1450513          	addi	a0,a0,-1516 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80003ab4:	00002097          	auipc	ra,0x2
    80003ab8:	c68080e7          	jalr	-920(ra) # 8000571c <_Z11printStringPKc>
    80003abc:	00000613          	li	a2,0
    80003ac0:	00a00593          	li	a1,10
    80003ac4:	00048513          	mv	a0,s1
    80003ac8:	00002097          	auipc	ra,0x2
    80003acc:	e04080e7          	jalr	-508(ra) # 800058cc <_Z8printIntiii>
    80003ad0:	00005517          	auipc	a0,0x5
    80003ad4:	69050513          	addi	a0,a0,1680 # 80009160 <CONSOLE_STATUS+0x150>
    80003ad8:	00002097          	auipc	ra,0x2
    80003adc:	c44080e7          	jalr	-956(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003ae0:	0014849b          	addiw	s1,s1,1
    80003ae4:	0ff4f493          	andi	s1,s1,255
    80003ae8:	00500793          	li	a5,5
    80003aec:	fc97f0e3          	bgeu	a5,s1,80003aac <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003af0:	00006517          	auipc	a0,0x6
    80003af4:	9a850513          	addi	a0,a0,-1624 # 80009498 <CONSOLE_STATUS+0x488>
    80003af8:	00002097          	auipc	ra,0x2
    80003afc:	c24080e7          	jalr	-988(ra) # 8000571c <_Z11printStringPKc>
    finishedC = true;
    80003b00:	00100793          	li	a5,1
    80003b04:	00008717          	auipc	a4,0x8
    80003b08:	02f70b23          	sb	a5,54(a4) # 8000bb3a <_ZL9finishedC>
    thread_dispatch();
    80003b0c:	ffffe097          	auipc	ra,0xffffe
    80003b10:	940080e7          	jalr	-1728(ra) # 8000144c <_Z15thread_dispatchv>
}
    80003b14:	01813083          	ld	ra,24(sp)
    80003b18:	01013403          	ld	s0,16(sp)
    80003b1c:	00813483          	ld	s1,8(sp)
    80003b20:	00013903          	ld	s2,0(sp)
    80003b24:	02010113          	addi	sp,sp,32
    80003b28:	00008067          	ret

0000000080003b2c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003b2c:	fe010113          	addi	sp,sp,-32
    80003b30:	00113c23          	sd	ra,24(sp)
    80003b34:	00813823          	sd	s0,16(sp)
    80003b38:	00913423          	sd	s1,8(sp)
    80003b3c:	01213023          	sd	s2,0(sp)
    80003b40:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003b44:	00a00493          	li	s1,10
    80003b48:	0400006f          	j	80003b88 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003b4c:	00006517          	auipc	a0,0x6
    80003b50:	9a450513          	addi	a0,a0,-1628 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80003b54:	00002097          	auipc	ra,0x2
    80003b58:	bc8080e7          	jalr	-1080(ra) # 8000571c <_Z11printStringPKc>
    80003b5c:	00000613          	li	a2,0
    80003b60:	00a00593          	li	a1,10
    80003b64:	00048513          	mv	a0,s1
    80003b68:	00002097          	auipc	ra,0x2
    80003b6c:	d64080e7          	jalr	-668(ra) # 800058cc <_Z8printIntiii>
    80003b70:	00005517          	auipc	a0,0x5
    80003b74:	5f050513          	addi	a0,a0,1520 # 80009160 <CONSOLE_STATUS+0x150>
    80003b78:	00002097          	auipc	ra,0x2
    80003b7c:	ba4080e7          	jalr	-1116(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003b80:	0014849b          	addiw	s1,s1,1
    80003b84:	0ff4f493          	andi	s1,s1,255
    80003b88:	00c00793          	li	a5,12
    80003b8c:	fc97f0e3          	bgeu	a5,s1,80003b4c <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003b90:	00006517          	auipc	a0,0x6
    80003b94:	96850513          	addi	a0,a0,-1688 # 800094f8 <CONSOLE_STATUS+0x4e8>
    80003b98:	00002097          	auipc	ra,0x2
    80003b9c:	b84080e7          	jalr	-1148(ra) # 8000571c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003ba0:	00500313          	li	t1,5
    thread_dispatch();
    80003ba4:	ffffe097          	auipc	ra,0xffffe
    80003ba8:	8a8080e7          	jalr	-1880(ra) # 8000144c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003bac:	01000513          	li	a0,16
    80003bb0:	00000097          	auipc	ra,0x0
    80003bb4:	be8080e7          	jalr	-1048(ra) # 80003798 <_ZL9fibonaccim>
    80003bb8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003bbc:	00006517          	auipc	a0,0x6
    80003bc0:	94c50513          	addi	a0,a0,-1716 # 80009508 <CONSOLE_STATUS+0x4f8>
    80003bc4:	00002097          	auipc	ra,0x2
    80003bc8:	b58080e7          	jalr	-1192(ra) # 8000571c <_Z11printStringPKc>
    80003bcc:	00000613          	li	a2,0
    80003bd0:	00a00593          	li	a1,10
    80003bd4:	0009051b          	sext.w	a0,s2
    80003bd8:	00002097          	auipc	ra,0x2
    80003bdc:	cf4080e7          	jalr	-780(ra) # 800058cc <_Z8printIntiii>
    80003be0:	00005517          	auipc	a0,0x5
    80003be4:	58050513          	addi	a0,a0,1408 # 80009160 <CONSOLE_STATUS+0x150>
    80003be8:	00002097          	auipc	ra,0x2
    80003bec:	b34080e7          	jalr	-1228(ra) # 8000571c <_Z11printStringPKc>
    80003bf0:	0400006f          	j	80003c30 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003bf4:	00006517          	auipc	a0,0x6
    80003bf8:	8fc50513          	addi	a0,a0,-1796 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80003bfc:	00002097          	auipc	ra,0x2
    80003c00:	b20080e7          	jalr	-1248(ra) # 8000571c <_Z11printStringPKc>
    80003c04:	00000613          	li	a2,0
    80003c08:	00a00593          	li	a1,10
    80003c0c:	00048513          	mv	a0,s1
    80003c10:	00002097          	auipc	ra,0x2
    80003c14:	cbc080e7          	jalr	-836(ra) # 800058cc <_Z8printIntiii>
    80003c18:	00005517          	auipc	a0,0x5
    80003c1c:	54850513          	addi	a0,a0,1352 # 80009160 <CONSOLE_STATUS+0x150>
    80003c20:	00002097          	auipc	ra,0x2
    80003c24:	afc080e7          	jalr	-1284(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003c28:	0014849b          	addiw	s1,s1,1
    80003c2c:	0ff4f493          	andi	s1,s1,255
    80003c30:	00f00793          	li	a5,15
    80003c34:	fc97f0e3          	bgeu	a5,s1,80003bf4 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003c38:	00006517          	auipc	a0,0x6
    80003c3c:	8e050513          	addi	a0,a0,-1824 # 80009518 <CONSOLE_STATUS+0x508>
    80003c40:	00002097          	auipc	ra,0x2
    80003c44:	adc080e7          	jalr	-1316(ra) # 8000571c <_Z11printStringPKc>
    finishedD = true;
    80003c48:	00100793          	li	a5,1
    80003c4c:	00008717          	auipc	a4,0x8
    80003c50:	eef707a3          	sb	a5,-273(a4) # 8000bb3b <_ZL9finishedD>
    thread_dispatch();
    80003c54:	ffffd097          	auipc	ra,0xffffd
    80003c58:	7f8080e7          	jalr	2040(ra) # 8000144c <_Z15thread_dispatchv>
}
    80003c5c:	01813083          	ld	ra,24(sp)
    80003c60:	01013403          	ld	s0,16(sp)
    80003c64:	00813483          	ld	s1,8(sp)
    80003c68:	00013903          	ld	s2,0(sp)
    80003c6c:	02010113          	addi	sp,sp,32
    80003c70:	00008067          	ret

0000000080003c74 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003c74:	fc010113          	addi	sp,sp,-64
    80003c78:	02113c23          	sd	ra,56(sp)
    80003c7c:	02813823          	sd	s0,48(sp)
    80003c80:	02913423          	sd	s1,40(sp)
    80003c84:	03213023          	sd	s2,32(sp)
    80003c88:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003c8c:	02000513          	li	a0,32
    80003c90:	ffffe097          	auipc	ra,0xffffe
    80003c94:	6d0080e7          	jalr	1744(ra) # 80002360 <_Znwm>
    80003c98:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003c9c:	fffff097          	auipc	ra,0xfffff
    80003ca0:	8b8080e7          	jalr	-1864(ra) # 80002554 <_ZN6ThreadC1Ev>
    80003ca4:	00008797          	auipc	a5,0x8
    80003ca8:	c2478793          	addi	a5,a5,-988 # 8000b8c8 <_ZTV7WorkerA+0x10>
    80003cac:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003cb0:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003cb4:	00006517          	auipc	a0,0x6
    80003cb8:	87450513          	addi	a0,a0,-1932 # 80009528 <CONSOLE_STATUS+0x518>
    80003cbc:	00002097          	auipc	ra,0x2
    80003cc0:	a60080e7          	jalr	-1440(ra) # 8000571c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003cc4:	02000513          	li	a0,32
    80003cc8:	ffffe097          	auipc	ra,0xffffe
    80003ccc:	698080e7          	jalr	1688(ra) # 80002360 <_Znwm>
    80003cd0:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003cd4:	fffff097          	auipc	ra,0xfffff
    80003cd8:	880080e7          	jalr	-1920(ra) # 80002554 <_ZN6ThreadC1Ev>
    80003cdc:	00008797          	auipc	a5,0x8
    80003ce0:	c1478793          	addi	a5,a5,-1004 # 8000b8f0 <_ZTV7WorkerB+0x10>
    80003ce4:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003ce8:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003cec:	00006517          	auipc	a0,0x6
    80003cf0:	85450513          	addi	a0,a0,-1964 # 80009540 <CONSOLE_STATUS+0x530>
    80003cf4:	00002097          	auipc	ra,0x2
    80003cf8:	a28080e7          	jalr	-1496(ra) # 8000571c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003cfc:	02000513          	li	a0,32
    80003d00:	ffffe097          	auipc	ra,0xffffe
    80003d04:	660080e7          	jalr	1632(ra) # 80002360 <_Znwm>
    80003d08:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003d0c:	fffff097          	auipc	ra,0xfffff
    80003d10:	848080e7          	jalr	-1976(ra) # 80002554 <_ZN6ThreadC1Ev>
    80003d14:	00008797          	auipc	a5,0x8
    80003d18:	c0478793          	addi	a5,a5,-1020 # 8000b918 <_ZTV7WorkerC+0x10>
    80003d1c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003d20:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003d24:	00006517          	auipc	a0,0x6
    80003d28:	83450513          	addi	a0,a0,-1996 # 80009558 <CONSOLE_STATUS+0x548>
    80003d2c:	00002097          	auipc	ra,0x2
    80003d30:	9f0080e7          	jalr	-1552(ra) # 8000571c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003d34:	02000513          	li	a0,32
    80003d38:	ffffe097          	auipc	ra,0xffffe
    80003d3c:	628080e7          	jalr	1576(ra) # 80002360 <_Znwm>
    80003d40:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003d44:	fffff097          	auipc	ra,0xfffff
    80003d48:	810080e7          	jalr	-2032(ra) # 80002554 <_ZN6ThreadC1Ev>
    80003d4c:	00008797          	auipc	a5,0x8
    80003d50:	bf478793          	addi	a5,a5,-1036 # 8000b940 <_ZTV7WorkerD+0x10>
    80003d54:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003d58:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003d5c:	00006517          	auipc	a0,0x6
    80003d60:	81450513          	addi	a0,a0,-2028 # 80009570 <CONSOLE_STATUS+0x560>
    80003d64:	00002097          	auipc	ra,0x2
    80003d68:	9b8080e7          	jalr	-1608(ra) # 8000571c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003d6c:	00000493          	li	s1,0
    80003d70:	00300793          	li	a5,3
    80003d74:	0297c663          	blt	a5,s1,80003da0 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003d78:	00349793          	slli	a5,s1,0x3
    80003d7c:	fe040713          	addi	a4,s0,-32
    80003d80:	00f707b3          	add	a5,a4,a5
    80003d84:	fe07b503          	ld	a0,-32(a5)
    80003d88:	ffffe097          	auipc	ra,0xffffe
    80003d8c:	6a8080e7          	jalr	1704(ra) # 80002430 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003d90:	0014849b          	addiw	s1,s1,1
    80003d94:	fddff06f          	j	80003d70 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003d98:	ffffe097          	auipc	ra,0xffffe
    80003d9c:	718080e7          	jalr	1816(ra) # 800024b0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003da0:	00008797          	auipc	a5,0x8
    80003da4:	d987c783          	lbu	a5,-616(a5) # 8000bb38 <_ZL9finishedA>
    80003da8:	fe0788e3          	beqz	a5,80003d98 <_Z20Threads_CPP_API_testv+0x124>
    80003dac:	00008797          	auipc	a5,0x8
    80003db0:	d8d7c783          	lbu	a5,-627(a5) # 8000bb39 <_ZL9finishedB>
    80003db4:	fe0782e3          	beqz	a5,80003d98 <_Z20Threads_CPP_API_testv+0x124>
    80003db8:	00008797          	auipc	a5,0x8
    80003dbc:	d827c783          	lbu	a5,-638(a5) # 8000bb3a <_ZL9finishedC>
    80003dc0:	fc078ce3          	beqz	a5,80003d98 <_Z20Threads_CPP_API_testv+0x124>
    80003dc4:	00008797          	auipc	a5,0x8
    80003dc8:	d777c783          	lbu	a5,-649(a5) # 8000bb3b <_ZL9finishedD>
    80003dcc:	fc0786e3          	beqz	a5,80003d98 <_Z20Threads_CPP_API_testv+0x124>
    80003dd0:	fc040493          	addi	s1,s0,-64
    80003dd4:	0080006f          	j	80003ddc <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003dd8:	00848493          	addi	s1,s1,8
    80003ddc:	fe040793          	addi	a5,s0,-32
    80003de0:	08f48663          	beq	s1,a5,80003e6c <_Z20Threads_CPP_API_testv+0x1f8>
    80003de4:	0004b503          	ld	a0,0(s1)
    80003de8:	fe0508e3          	beqz	a0,80003dd8 <_Z20Threads_CPP_API_testv+0x164>
    80003dec:	00053783          	ld	a5,0(a0)
    80003df0:	0087b783          	ld	a5,8(a5)
    80003df4:	000780e7          	jalr	a5
    80003df8:	fe1ff06f          	j	80003dd8 <_Z20Threads_CPP_API_testv+0x164>
    80003dfc:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003e00:	00048513          	mv	a0,s1
    80003e04:	ffffe097          	auipc	ra,0xffffe
    80003e08:	584080e7          	jalr	1412(ra) # 80002388 <_ZdlPv>
    80003e0c:	00090513          	mv	a0,s2
    80003e10:	00009097          	auipc	ra,0x9
    80003e14:	e38080e7          	jalr	-456(ra) # 8000cc48 <_Unwind_Resume>
    80003e18:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003e1c:	00048513          	mv	a0,s1
    80003e20:	ffffe097          	auipc	ra,0xffffe
    80003e24:	568080e7          	jalr	1384(ra) # 80002388 <_ZdlPv>
    80003e28:	00090513          	mv	a0,s2
    80003e2c:	00009097          	auipc	ra,0x9
    80003e30:	e1c080e7          	jalr	-484(ra) # 8000cc48 <_Unwind_Resume>
    80003e34:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003e38:	00048513          	mv	a0,s1
    80003e3c:	ffffe097          	auipc	ra,0xffffe
    80003e40:	54c080e7          	jalr	1356(ra) # 80002388 <_ZdlPv>
    80003e44:	00090513          	mv	a0,s2
    80003e48:	00009097          	auipc	ra,0x9
    80003e4c:	e00080e7          	jalr	-512(ra) # 8000cc48 <_Unwind_Resume>
    80003e50:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003e54:	00048513          	mv	a0,s1
    80003e58:	ffffe097          	auipc	ra,0xffffe
    80003e5c:	530080e7          	jalr	1328(ra) # 80002388 <_ZdlPv>
    80003e60:	00090513          	mv	a0,s2
    80003e64:	00009097          	auipc	ra,0x9
    80003e68:	de4080e7          	jalr	-540(ra) # 8000cc48 <_Unwind_Resume>
}
    80003e6c:	03813083          	ld	ra,56(sp)
    80003e70:	03013403          	ld	s0,48(sp)
    80003e74:	02813483          	ld	s1,40(sp)
    80003e78:	02013903          	ld	s2,32(sp)
    80003e7c:	04010113          	addi	sp,sp,64
    80003e80:	00008067          	ret

0000000080003e84 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003e84:	ff010113          	addi	sp,sp,-16
    80003e88:	00113423          	sd	ra,8(sp)
    80003e8c:	00813023          	sd	s0,0(sp)
    80003e90:	01010413          	addi	s0,sp,16
    80003e94:	00008797          	auipc	a5,0x8
    80003e98:	a3478793          	addi	a5,a5,-1484 # 8000b8c8 <_ZTV7WorkerA+0x10>
    80003e9c:	00f53023          	sd	a5,0(a0)
    80003ea0:	ffffe097          	auipc	ra,0xffffe
    80003ea4:	418080e7          	jalr	1048(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80003ea8:	00813083          	ld	ra,8(sp)
    80003eac:	00013403          	ld	s0,0(sp)
    80003eb0:	01010113          	addi	sp,sp,16
    80003eb4:	00008067          	ret

0000000080003eb8 <_ZN7WorkerAD0Ev>:
    80003eb8:	fe010113          	addi	sp,sp,-32
    80003ebc:	00113c23          	sd	ra,24(sp)
    80003ec0:	00813823          	sd	s0,16(sp)
    80003ec4:	00913423          	sd	s1,8(sp)
    80003ec8:	02010413          	addi	s0,sp,32
    80003ecc:	00050493          	mv	s1,a0
    80003ed0:	00008797          	auipc	a5,0x8
    80003ed4:	9f878793          	addi	a5,a5,-1544 # 8000b8c8 <_ZTV7WorkerA+0x10>
    80003ed8:	00f53023          	sd	a5,0(a0)
    80003edc:	ffffe097          	auipc	ra,0xffffe
    80003ee0:	3dc080e7          	jalr	988(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80003ee4:	00048513          	mv	a0,s1
    80003ee8:	ffffe097          	auipc	ra,0xffffe
    80003eec:	4a0080e7          	jalr	1184(ra) # 80002388 <_ZdlPv>
    80003ef0:	01813083          	ld	ra,24(sp)
    80003ef4:	01013403          	ld	s0,16(sp)
    80003ef8:	00813483          	ld	s1,8(sp)
    80003efc:	02010113          	addi	sp,sp,32
    80003f00:	00008067          	ret

0000000080003f04 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003f04:	ff010113          	addi	sp,sp,-16
    80003f08:	00113423          	sd	ra,8(sp)
    80003f0c:	00813023          	sd	s0,0(sp)
    80003f10:	01010413          	addi	s0,sp,16
    80003f14:	00008797          	auipc	a5,0x8
    80003f18:	9dc78793          	addi	a5,a5,-1572 # 8000b8f0 <_ZTV7WorkerB+0x10>
    80003f1c:	00f53023          	sd	a5,0(a0)
    80003f20:	ffffe097          	auipc	ra,0xffffe
    80003f24:	398080e7          	jalr	920(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80003f28:	00813083          	ld	ra,8(sp)
    80003f2c:	00013403          	ld	s0,0(sp)
    80003f30:	01010113          	addi	sp,sp,16
    80003f34:	00008067          	ret

0000000080003f38 <_ZN7WorkerBD0Ev>:
    80003f38:	fe010113          	addi	sp,sp,-32
    80003f3c:	00113c23          	sd	ra,24(sp)
    80003f40:	00813823          	sd	s0,16(sp)
    80003f44:	00913423          	sd	s1,8(sp)
    80003f48:	02010413          	addi	s0,sp,32
    80003f4c:	00050493          	mv	s1,a0
    80003f50:	00008797          	auipc	a5,0x8
    80003f54:	9a078793          	addi	a5,a5,-1632 # 8000b8f0 <_ZTV7WorkerB+0x10>
    80003f58:	00f53023          	sd	a5,0(a0)
    80003f5c:	ffffe097          	auipc	ra,0xffffe
    80003f60:	35c080e7          	jalr	860(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80003f64:	00048513          	mv	a0,s1
    80003f68:	ffffe097          	auipc	ra,0xffffe
    80003f6c:	420080e7          	jalr	1056(ra) # 80002388 <_ZdlPv>
    80003f70:	01813083          	ld	ra,24(sp)
    80003f74:	01013403          	ld	s0,16(sp)
    80003f78:	00813483          	ld	s1,8(sp)
    80003f7c:	02010113          	addi	sp,sp,32
    80003f80:	00008067          	ret

0000000080003f84 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003f84:	ff010113          	addi	sp,sp,-16
    80003f88:	00113423          	sd	ra,8(sp)
    80003f8c:	00813023          	sd	s0,0(sp)
    80003f90:	01010413          	addi	s0,sp,16
    80003f94:	00008797          	auipc	a5,0x8
    80003f98:	98478793          	addi	a5,a5,-1660 # 8000b918 <_ZTV7WorkerC+0x10>
    80003f9c:	00f53023          	sd	a5,0(a0)
    80003fa0:	ffffe097          	auipc	ra,0xffffe
    80003fa4:	318080e7          	jalr	792(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80003fa8:	00813083          	ld	ra,8(sp)
    80003fac:	00013403          	ld	s0,0(sp)
    80003fb0:	01010113          	addi	sp,sp,16
    80003fb4:	00008067          	ret

0000000080003fb8 <_ZN7WorkerCD0Ev>:
    80003fb8:	fe010113          	addi	sp,sp,-32
    80003fbc:	00113c23          	sd	ra,24(sp)
    80003fc0:	00813823          	sd	s0,16(sp)
    80003fc4:	00913423          	sd	s1,8(sp)
    80003fc8:	02010413          	addi	s0,sp,32
    80003fcc:	00050493          	mv	s1,a0
    80003fd0:	00008797          	auipc	a5,0x8
    80003fd4:	94878793          	addi	a5,a5,-1720 # 8000b918 <_ZTV7WorkerC+0x10>
    80003fd8:	00f53023          	sd	a5,0(a0)
    80003fdc:	ffffe097          	auipc	ra,0xffffe
    80003fe0:	2dc080e7          	jalr	732(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80003fe4:	00048513          	mv	a0,s1
    80003fe8:	ffffe097          	auipc	ra,0xffffe
    80003fec:	3a0080e7          	jalr	928(ra) # 80002388 <_ZdlPv>
    80003ff0:	01813083          	ld	ra,24(sp)
    80003ff4:	01013403          	ld	s0,16(sp)
    80003ff8:	00813483          	ld	s1,8(sp)
    80003ffc:	02010113          	addi	sp,sp,32
    80004000:	00008067          	ret

0000000080004004 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004004:	ff010113          	addi	sp,sp,-16
    80004008:	00113423          	sd	ra,8(sp)
    8000400c:	00813023          	sd	s0,0(sp)
    80004010:	01010413          	addi	s0,sp,16
    80004014:	00008797          	auipc	a5,0x8
    80004018:	92c78793          	addi	a5,a5,-1748 # 8000b940 <_ZTV7WorkerD+0x10>
    8000401c:	00f53023          	sd	a5,0(a0)
    80004020:	ffffe097          	auipc	ra,0xffffe
    80004024:	298080e7          	jalr	664(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80004028:	00813083          	ld	ra,8(sp)
    8000402c:	00013403          	ld	s0,0(sp)
    80004030:	01010113          	addi	sp,sp,16
    80004034:	00008067          	ret

0000000080004038 <_ZN7WorkerDD0Ev>:
    80004038:	fe010113          	addi	sp,sp,-32
    8000403c:	00113c23          	sd	ra,24(sp)
    80004040:	00813823          	sd	s0,16(sp)
    80004044:	00913423          	sd	s1,8(sp)
    80004048:	02010413          	addi	s0,sp,32
    8000404c:	00050493          	mv	s1,a0
    80004050:	00008797          	auipc	a5,0x8
    80004054:	8f078793          	addi	a5,a5,-1808 # 8000b940 <_ZTV7WorkerD+0x10>
    80004058:	00f53023          	sd	a5,0(a0)
    8000405c:	ffffe097          	auipc	ra,0xffffe
    80004060:	25c080e7          	jalr	604(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80004064:	00048513          	mv	a0,s1
    80004068:	ffffe097          	auipc	ra,0xffffe
    8000406c:	320080e7          	jalr	800(ra) # 80002388 <_ZdlPv>
    80004070:	01813083          	ld	ra,24(sp)
    80004074:	01013403          	ld	s0,16(sp)
    80004078:	00813483          	ld	s1,8(sp)
    8000407c:	02010113          	addi	sp,sp,32
    80004080:	00008067          	ret

0000000080004084 <_ZN7WorkerA3runEv>:
    void run() override {
    80004084:	ff010113          	addi	sp,sp,-16
    80004088:	00113423          	sd	ra,8(sp)
    8000408c:	00813023          	sd	s0,0(sp)
    80004090:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004094:	00000593          	li	a1,0
    80004098:	fffff097          	auipc	ra,0xfffff
    8000409c:	774080e7          	jalr	1908(ra) # 8000380c <_ZN7WorkerA11workerBodyAEPv>
    }
    800040a0:	00813083          	ld	ra,8(sp)
    800040a4:	00013403          	ld	s0,0(sp)
    800040a8:	01010113          	addi	sp,sp,16
    800040ac:	00008067          	ret

00000000800040b0 <_ZN7WorkerB3runEv>:
    void run() override {
    800040b0:	ff010113          	addi	sp,sp,-16
    800040b4:	00113423          	sd	ra,8(sp)
    800040b8:	00813023          	sd	s0,0(sp)
    800040bc:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800040c0:	00000593          	li	a1,0
    800040c4:	00000097          	auipc	ra,0x0
    800040c8:	814080e7          	jalr	-2028(ra) # 800038d8 <_ZN7WorkerB11workerBodyBEPv>
    }
    800040cc:	00813083          	ld	ra,8(sp)
    800040d0:	00013403          	ld	s0,0(sp)
    800040d4:	01010113          	addi	sp,sp,16
    800040d8:	00008067          	ret

00000000800040dc <_ZN7WorkerC3runEv>:
    void run() override {
    800040dc:	ff010113          	addi	sp,sp,-16
    800040e0:	00113423          	sd	ra,8(sp)
    800040e4:	00813023          	sd	s0,0(sp)
    800040e8:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800040ec:	00000593          	li	a1,0
    800040f0:	00000097          	auipc	ra,0x0
    800040f4:	8bc080e7          	jalr	-1860(ra) # 800039ac <_ZN7WorkerC11workerBodyCEPv>
    }
    800040f8:	00813083          	ld	ra,8(sp)
    800040fc:	00013403          	ld	s0,0(sp)
    80004100:	01010113          	addi	sp,sp,16
    80004104:	00008067          	ret

0000000080004108 <_ZN7WorkerD3runEv>:
    void run() override {
    80004108:	ff010113          	addi	sp,sp,-16
    8000410c:	00113423          	sd	ra,8(sp)
    80004110:	00813023          	sd	s0,0(sp)
    80004114:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004118:	00000593          	li	a1,0
    8000411c:	00000097          	auipc	ra,0x0
    80004120:	a10080e7          	jalr	-1520(ra) # 80003b2c <_ZN7WorkerD11workerBodyDEPv>
    }
    80004124:	00813083          	ld	ra,8(sp)
    80004128:	00013403          	ld	s0,0(sp)
    8000412c:	01010113          	addi	sp,sp,16
    80004130:	00008067          	ret

0000000080004134 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004134:	f8010113          	addi	sp,sp,-128
    80004138:	06113c23          	sd	ra,120(sp)
    8000413c:	06813823          	sd	s0,112(sp)
    80004140:	06913423          	sd	s1,104(sp)
    80004144:	07213023          	sd	s2,96(sp)
    80004148:	05313c23          	sd	s3,88(sp)
    8000414c:	05413823          	sd	s4,80(sp)
    80004150:	05513423          	sd	s5,72(sp)
    80004154:	05613023          	sd	s6,64(sp)
    80004158:	03713c23          	sd	s7,56(sp)
    8000415c:	03813823          	sd	s8,48(sp)
    80004160:	03913423          	sd	s9,40(sp)
    80004164:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004168:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    8000416c:	00005517          	auipc	a0,0x5
    80004170:	23c50513          	addi	a0,a0,572 # 800093a8 <CONSOLE_STATUS+0x398>
    80004174:	00001097          	auipc	ra,0x1
    80004178:	5a8080e7          	jalr	1448(ra) # 8000571c <_Z11printStringPKc>
    getString(input, 30);
    8000417c:	01e00593          	li	a1,30
    80004180:	f8040493          	addi	s1,s0,-128
    80004184:	00048513          	mv	a0,s1
    80004188:	00001097          	auipc	ra,0x1
    8000418c:	61c080e7          	jalr	1564(ra) # 800057a4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004190:	00048513          	mv	a0,s1
    80004194:	00001097          	auipc	ra,0x1
    80004198:	6e8080e7          	jalr	1768(ra) # 8000587c <_Z11stringToIntPKc>
    8000419c:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    800041a0:	00005517          	auipc	a0,0x5
    800041a4:	22850513          	addi	a0,a0,552 # 800093c8 <CONSOLE_STATUS+0x3b8>
    800041a8:	00001097          	auipc	ra,0x1
    800041ac:	574080e7          	jalr	1396(ra) # 8000571c <_Z11printStringPKc>
    getString(input, 30);
    800041b0:	01e00593          	li	a1,30
    800041b4:	00048513          	mv	a0,s1
    800041b8:	00001097          	auipc	ra,0x1
    800041bc:	5ec080e7          	jalr	1516(ra) # 800057a4 <_Z9getStringPci>
    n = stringToInt(input);
    800041c0:	00048513          	mv	a0,s1
    800041c4:	00001097          	auipc	ra,0x1
    800041c8:	6b8080e7          	jalr	1720(ra) # 8000587c <_Z11stringToIntPKc>
    800041cc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    800041d0:	00005517          	auipc	a0,0x5
    800041d4:	21850513          	addi	a0,a0,536 # 800093e8 <CONSOLE_STATUS+0x3d8>
    800041d8:	00001097          	auipc	ra,0x1
    800041dc:	544080e7          	jalr	1348(ra) # 8000571c <_Z11printStringPKc>
    printInt(threadNum);
    800041e0:	00000613          	li	a2,0
    800041e4:	00a00593          	li	a1,10
    800041e8:	00098513          	mv	a0,s3
    800041ec:	00001097          	auipc	ra,0x1
    800041f0:	6e0080e7          	jalr	1760(ra) # 800058cc <_Z8printIntiii>
    printString(" i velicina bafera ");
    800041f4:	00005517          	auipc	a0,0x5
    800041f8:	20c50513          	addi	a0,a0,524 # 80009400 <CONSOLE_STATUS+0x3f0>
    800041fc:	00001097          	auipc	ra,0x1
    80004200:	520080e7          	jalr	1312(ra) # 8000571c <_Z11printStringPKc>
    printInt(n);
    80004204:	00000613          	li	a2,0
    80004208:	00a00593          	li	a1,10
    8000420c:	00048513          	mv	a0,s1
    80004210:	00001097          	auipc	ra,0x1
    80004214:	6bc080e7          	jalr	1724(ra) # 800058cc <_Z8printIntiii>
    printString(".\n");
    80004218:	00005517          	auipc	a0,0x5
    8000421c:	20050513          	addi	a0,a0,512 # 80009418 <CONSOLE_STATUS+0x408>
    80004220:	00001097          	auipc	ra,0x1
    80004224:	4fc080e7          	jalr	1276(ra) # 8000571c <_Z11printStringPKc>
    if (threadNum > n) {
    80004228:	0334c463          	blt	s1,s3,80004250 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    8000422c:	03305c63          	blez	s3,80004264 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004230:	03800513          	li	a0,56
    80004234:	ffffe097          	auipc	ra,0xffffe
    80004238:	12c080e7          	jalr	300(ra) # 80002360 <_Znwm>
    8000423c:	00050a93          	mv	s5,a0
    80004240:	00048593          	mv	a1,s1
    80004244:	00001097          	auipc	ra,0x1
    80004248:	7a8080e7          	jalr	1960(ra) # 800059ec <_ZN9BufferCPPC1Ei>
    8000424c:	0300006f          	j	8000427c <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004250:	00005517          	auipc	a0,0x5
    80004254:	1d050513          	addi	a0,a0,464 # 80009420 <CONSOLE_STATUS+0x410>
    80004258:	00001097          	auipc	ra,0x1
    8000425c:	4c4080e7          	jalr	1220(ra) # 8000571c <_Z11printStringPKc>
        return;
    80004260:	0140006f          	j	80004274 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004264:	00005517          	auipc	a0,0x5
    80004268:	1fc50513          	addi	a0,a0,508 # 80009460 <CONSOLE_STATUS+0x450>
    8000426c:	00001097          	auipc	ra,0x1
    80004270:	4b0080e7          	jalr	1200(ra) # 8000571c <_Z11printStringPKc>
        return;
    80004274:	000c0113          	mv	sp,s8
    80004278:	2140006f          	j	8000448c <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    8000427c:	01000513          	li	a0,16
    80004280:	ffffe097          	auipc	ra,0xffffe
    80004284:	0e0080e7          	jalr	224(ra) # 80002360 <_Znwm>
    80004288:	00050913          	mv	s2,a0
    8000428c:	00000593          	li	a1,0
    80004290:	ffffe097          	auipc	ra,0xffffe
    80004294:	2f0080e7          	jalr	752(ra) # 80002580 <_ZN9SemaphoreC1Ej>
    80004298:	00008797          	auipc	a5,0x8
    8000429c:	8b27b823          	sd	s2,-1872(a5) # 8000bb48 <_ZL10waitForAll>
    Thread *producers[threadNum];
    800042a0:	00399793          	slli	a5,s3,0x3
    800042a4:	00f78793          	addi	a5,a5,15
    800042a8:	ff07f793          	andi	a5,a5,-16
    800042ac:	40f10133          	sub	sp,sp,a5
    800042b0:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    800042b4:	0019871b          	addiw	a4,s3,1
    800042b8:	00171793          	slli	a5,a4,0x1
    800042bc:	00e787b3          	add	a5,a5,a4
    800042c0:	00379793          	slli	a5,a5,0x3
    800042c4:	00f78793          	addi	a5,a5,15
    800042c8:	ff07f793          	andi	a5,a5,-16
    800042cc:	40f10133          	sub	sp,sp,a5
    800042d0:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800042d4:	00199493          	slli	s1,s3,0x1
    800042d8:	013484b3          	add	s1,s1,s3
    800042dc:	00349493          	slli	s1,s1,0x3
    800042e0:	009b04b3          	add	s1,s6,s1
    800042e4:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800042e8:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800042ec:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800042f0:	02800513          	li	a0,40
    800042f4:	ffffe097          	auipc	ra,0xffffe
    800042f8:	06c080e7          	jalr	108(ra) # 80002360 <_Znwm>
    800042fc:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004300:	ffffe097          	auipc	ra,0xffffe
    80004304:	254080e7          	jalr	596(ra) # 80002554 <_ZN6ThreadC1Ev>
    80004308:	00007797          	auipc	a5,0x7
    8000430c:	6b078793          	addi	a5,a5,1712 # 8000b9b8 <_ZTV8Consumer+0x10>
    80004310:	00fbb023          	sd	a5,0(s7)
    80004314:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80004318:	000b8513          	mv	a0,s7
    8000431c:	ffffe097          	auipc	ra,0xffffe
    80004320:	114080e7          	jalr	276(ra) # 80002430 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004324:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004328:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    8000432c:	00008797          	auipc	a5,0x8
    80004330:	81c7b783          	ld	a5,-2020(a5) # 8000bb48 <_ZL10waitForAll>
    80004334:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004338:	02800513          	li	a0,40
    8000433c:	ffffe097          	auipc	ra,0xffffe
    80004340:	024080e7          	jalr	36(ra) # 80002360 <_Znwm>
    80004344:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004348:	ffffe097          	auipc	ra,0xffffe
    8000434c:	20c080e7          	jalr	524(ra) # 80002554 <_ZN6ThreadC1Ev>
    80004350:	00007797          	auipc	a5,0x7
    80004354:	61878793          	addi	a5,a5,1560 # 8000b968 <_ZTV16ProducerKeyborad+0x10>
    80004358:	00f4b023          	sd	a5,0(s1)
    8000435c:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004360:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004364:	00048513          	mv	a0,s1
    80004368:	ffffe097          	auipc	ra,0xffffe
    8000436c:	0c8080e7          	jalr	200(ra) # 80002430 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004370:	00100913          	li	s2,1
    80004374:	0300006f          	j	800043a4 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004378:	00007797          	auipc	a5,0x7
    8000437c:	61878793          	addi	a5,a5,1560 # 8000b990 <_ZTV8Producer+0x10>
    80004380:	00fcb023          	sd	a5,0(s9)
    80004384:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004388:	00391793          	slli	a5,s2,0x3
    8000438c:	00fa07b3          	add	a5,s4,a5
    80004390:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004394:	000c8513          	mv	a0,s9
    80004398:	ffffe097          	auipc	ra,0xffffe
    8000439c:	098080e7          	jalr	152(ra) # 80002430 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800043a0:	0019091b          	addiw	s2,s2,1
    800043a4:	05395263          	bge	s2,s3,800043e8 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    800043a8:	00191493          	slli	s1,s2,0x1
    800043ac:	012484b3          	add	s1,s1,s2
    800043b0:	00349493          	slli	s1,s1,0x3
    800043b4:	009b04b3          	add	s1,s6,s1
    800043b8:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800043bc:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800043c0:	00007797          	auipc	a5,0x7
    800043c4:	7887b783          	ld	a5,1928(a5) # 8000bb48 <_ZL10waitForAll>
    800043c8:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800043cc:	02800513          	li	a0,40
    800043d0:	ffffe097          	auipc	ra,0xffffe
    800043d4:	f90080e7          	jalr	-112(ra) # 80002360 <_Znwm>
    800043d8:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800043dc:	ffffe097          	auipc	ra,0xffffe
    800043e0:	178080e7          	jalr	376(ra) # 80002554 <_ZN6ThreadC1Ev>
    800043e4:	f95ff06f          	j	80004378 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800043e8:	ffffe097          	auipc	ra,0xffffe
    800043ec:	0c8080e7          	jalr	200(ra) # 800024b0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800043f0:	00000493          	li	s1,0
    800043f4:	0099ce63          	blt	s3,s1,80004410 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800043f8:	00007517          	auipc	a0,0x7
    800043fc:	75053503          	ld	a0,1872(a0) # 8000bb48 <_ZL10waitForAll>
    80004400:	ffffe097          	auipc	ra,0xffffe
    80004404:	1b8080e7          	jalr	440(ra) # 800025b8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004408:	0014849b          	addiw	s1,s1,1
    8000440c:	fe9ff06f          	j	800043f4 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004410:	00007517          	auipc	a0,0x7
    80004414:	73853503          	ld	a0,1848(a0) # 8000bb48 <_ZL10waitForAll>
    80004418:	00050863          	beqz	a0,80004428 <_Z20testConsumerProducerv+0x2f4>
    8000441c:	00053783          	ld	a5,0(a0)
    80004420:	0087b783          	ld	a5,8(a5)
    80004424:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004428:	00000493          	li	s1,0
    8000442c:	0080006f          	j	80004434 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004430:	0014849b          	addiw	s1,s1,1
    80004434:	0334d263          	bge	s1,s3,80004458 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004438:	00349793          	slli	a5,s1,0x3
    8000443c:	00fa07b3          	add	a5,s4,a5
    80004440:	0007b503          	ld	a0,0(a5)
    80004444:	fe0506e3          	beqz	a0,80004430 <_Z20testConsumerProducerv+0x2fc>
    80004448:	00053783          	ld	a5,0(a0)
    8000444c:	0087b783          	ld	a5,8(a5)
    80004450:	000780e7          	jalr	a5
    80004454:	fddff06f          	j	80004430 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004458:	000b8a63          	beqz	s7,8000446c <_Z20testConsumerProducerv+0x338>
    8000445c:	000bb783          	ld	a5,0(s7)
    80004460:	0087b783          	ld	a5,8(a5)
    80004464:	000b8513          	mv	a0,s7
    80004468:	000780e7          	jalr	a5
    delete buffer;
    8000446c:	000a8e63          	beqz	s5,80004488 <_Z20testConsumerProducerv+0x354>
    80004470:	000a8513          	mv	a0,s5
    80004474:	00002097          	auipc	ra,0x2
    80004478:	870080e7          	jalr	-1936(ra) # 80005ce4 <_ZN9BufferCPPD1Ev>
    8000447c:	000a8513          	mv	a0,s5
    80004480:	ffffe097          	auipc	ra,0xffffe
    80004484:	f08080e7          	jalr	-248(ra) # 80002388 <_ZdlPv>
    80004488:	000c0113          	mv	sp,s8
}
    8000448c:	f8040113          	addi	sp,s0,-128
    80004490:	07813083          	ld	ra,120(sp)
    80004494:	07013403          	ld	s0,112(sp)
    80004498:	06813483          	ld	s1,104(sp)
    8000449c:	06013903          	ld	s2,96(sp)
    800044a0:	05813983          	ld	s3,88(sp)
    800044a4:	05013a03          	ld	s4,80(sp)
    800044a8:	04813a83          	ld	s5,72(sp)
    800044ac:	04013b03          	ld	s6,64(sp)
    800044b0:	03813b83          	ld	s7,56(sp)
    800044b4:	03013c03          	ld	s8,48(sp)
    800044b8:	02813c83          	ld	s9,40(sp)
    800044bc:	08010113          	addi	sp,sp,128
    800044c0:	00008067          	ret
    800044c4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800044c8:	000a8513          	mv	a0,s5
    800044cc:	ffffe097          	auipc	ra,0xffffe
    800044d0:	ebc080e7          	jalr	-324(ra) # 80002388 <_ZdlPv>
    800044d4:	00048513          	mv	a0,s1
    800044d8:	00008097          	auipc	ra,0x8
    800044dc:	770080e7          	jalr	1904(ra) # 8000cc48 <_Unwind_Resume>
    800044e0:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800044e4:	00090513          	mv	a0,s2
    800044e8:	ffffe097          	auipc	ra,0xffffe
    800044ec:	ea0080e7          	jalr	-352(ra) # 80002388 <_ZdlPv>
    800044f0:	00048513          	mv	a0,s1
    800044f4:	00008097          	auipc	ra,0x8
    800044f8:	754080e7          	jalr	1876(ra) # 8000cc48 <_Unwind_Resume>
    800044fc:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004500:	000b8513          	mv	a0,s7
    80004504:	ffffe097          	auipc	ra,0xffffe
    80004508:	e84080e7          	jalr	-380(ra) # 80002388 <_ZdlPv>
    8000450c:	00048513          	mv	a0,s1
    80004510:	00008097          	auipc	ra,0x8
    80004514:	738080e7          	jalr	1848(ra) # 8000cc48 <_Unwind_Resume>
    80004518:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000451c:	00048513          	mv	a0,s1
    80004520:	ffffe097          	auipc	ra,0xffffe
    80004524:	e68080e7          	jalr	-408(ra) # 80002388 <_ZdlPv>
    80004528:	00090513          	mv	a0,s2
    8000452c:	00008097          	auipc	ra,0x8
    80004530:	71c080e7          	jalr	1820(ra) # 8000cc48 <_Unwind_Resume>
    80004534:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004538:	000c8513          	mv	a0,s9
    8000453c:	ffffe097          	auipc	ra,0xffffe
    80004540:	e4c080e7          	jalr	-436(ra) # 80002388 <_ZdlPv>
    80004544:	00048513          	mv	a0,s1
    80004548:	00008097          	auipc	ra,0x8
    8000454c:	700080e7          	jalr	1792(ra) # 8000cc48 <_Unwind_Resume>

0000000080004550 <_ZN8Consumer3runEv>:
    void run() override {
    80004550:	fd010113          	addi	sp,sp,-48
    80004554:	02113423          	sd	ra,40(sp)
    80004558:	02813023          	sd	s0,32(sp)
    8000455c:	00913c23          	sd	s1,24(sp)
    80004560:	01213823          	sd	s2,16(sp)
    80004564:	01313423          	sd	s3,8(sp)
    80004568:	03010413          	addi	s0,sp,48
    8000456c:	00050913          	mv	s2,a0
        int i = 0;
    80004570:	00000993          	li	s3,0
    80004574:	0100006f          	j	80004584 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004578:	00a00513          	li	a0,10
    8000457c:	ffffe097          	auipc	ra,0xffffe
    80004580:	0d8080e7          	jalr	216(ra) # 80002654 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004584:	00007797          	auipc	a5,0x7
    80004588:	5bc7a783          	lw	a5,1468(a5) # 8000bb40 <_ZL9threadEnd>
    8000458c:	04079a63          	bnez	a5,800045e0 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004590:	02093783          	ld	a5,32(s2)
    80004594:	0087b503          	ld	a0,8(a5)
    80004598:	00001097          	auipc	ra,0x1
    8000459c:	638080e7          	jalr	1592(ra) # 80005bd0 <_ZN9BufferCPP3getEv>
            i++;
    800045a0:	0019849b          	addiw	s1,s3,1
    800045a4:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800045a8:	0ff57513          	andi	a0,a0,255
    800045ac:	ffffe097          	auipc	ra,0xffffe
    800045b0:	0a8080e7          	jalr	168(ra) # 80002654 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800045b4:	05000793          	li	a5,80
    800045b8:	02f4e4bb          	remw	s1,s1,a5
    800045bc:	fc0494e3          	bnez	s1,80004584 <_ZN8Consumer3runEv+0x34>
    800045c0:	fb9ff06f          	j	80004578 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    800045c4:	02093783          	ld	a5,32(s2)
    800045c8:	0087b503          	ld	a0,8(a5)
    800045cc:	00001097          	auipc	ra,0x1
    800045d0:	604080e7          	jalr	1540(ra) # 80005bd0 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    800045d4:	0ff57513          	andi	a0,a0,255
    800045d8:	ffffe097          	auipc	ra,0xffffe
    800045dc:	07c080e7          	jalr	124(ra) # 80002654 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    800045e0:	02093783          	ld	a5,32(s2)
    800045e4:	0087b503          	ld	a0,8(a5)
    800045e8:	00001097          	auipc	ra,0x1
    800045ec:	674080e7          	jalr	1652(ra) # 80005c5c <_ZN9BufferCPP6getCntEv>
    800045f0:	fca04ae3          	bgtz	a0,800045c4 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800045f4:	02093783          	ld	a5,32(s2)
    800045f8:	0107b503          	ld	a0,16(a5)
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	fe8080e7          	jalr	-24(ra) # 800025e4 <_ZN9Semaphore6signalEv>
    }
    80004604:	02813083          	ld	ra,40(sp)
    80004608:	02013403          	ld	s0,32(sp)
    8000460c:	01813483          	ld	s1,24(sp)
    80004610:	01013903          	ld	s2,16(sp)
    80004614:	00813983          	ld	s3,8(sp)
    80004618:	03010113          	addi	sp,sp,48
    8000461c:	00008067          	ret

0000000080004620 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004620:	ff010113          	addi	sp,sp,-16
    80004624:	00113423          	sd	ra,8(sp)
    80004628:	00813023          	sd	s0,0(sp)
    8000462c:	01010413          	addi	s0,sp,16
    80004630:	00007797          	auipc	a5,0x7
    80004634:	38878793          	addi	a5,a5,904 # 8000b9b8 <_ZTV8Consumer+0x10>
    80004638:	00f53023          	sd	a5,0(a0)
    8000463c:	ffffe097          	auipc	ra,0xffffe
    80004640:	c7c080e7          	jalr	-900(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80004644:	00813083          	ld	ra,8(sp)
    80004648:	00013403          	ld	s0,0(sp)
    8000464c:	01010113          	addi	sp,sp,16
    80004650:	00008067          	ret

0000000080004654 <_ZN8ConsumerD0Ev>:
    80004654:	fe010113          	addi	sp,sp,-32
    80004658:	00113c23          	sd	ra,24(sp)
    8000465c:	00813823          	sd	s0,16(sp)
    80004660:	00913423          	sd	s1,8(sp)
    80004664:	02010413          	addi	s0,sp,32
    80004668:	00050493          	mv	s1,a0
    8000466c:	00007797          	auipc	a5,0x7
    80004670:	34c78793          	addi	a5,a5,844 # 8000b9b8 <_ZTV8Consumer+0x10>
    80004674:	00f53023          	sd	a5,0(a0)
    80004678:	ffffe097          	auipc	ra,0xffffe
    8000467c:	c40080e7          	jalr	-960(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80004680:	00048513          	mv	a0,s1
    80004684:	ffffe097          	auipc	ra,0xffffe
    80004688:	d04080e7          	jalr	-764(ra) # 80002388 <_ZdlPv>
    8000468c:	01813083          	ld	ra,24(sp)
    80004690:	01013403          	ld	s0,16(sp)
    80004694:	00813483          	ld	s1,8(sp)
    80004698:	02010113          	addi	sp,sp,32
    8000469c:	00008067          	ret

00000000800046a0 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800046a0:	ff010113          	addi	sp,sp,-16
    800046a4:	00113423          	sd	ra,8(sp)
    800046a8:	00813023          	sd	s0,0(sp)
    800046ac:	01010413          	addi	s0,sp,16
    800046b0:	00007797          	auipc	a5,0x7
    800046b4:	2b878793          	addi	a5,a5,696 # 8000b968 <_ZTV16ProducerKeyborad+0x10>
    800046b8:	00f53023          	sd	a5,0(a0)
    800046bc:	ffffe097          	auipc	ra,0xffffe
    800046c0:	bfc080e7          	jalr	-1028(ra) # 800022b8 <_ZN6ThreadD1Ev>
    800046c4:	00813083          	ld	ra,8(sp)
    800046c8:	00013403          	ld	s0,0(sp)
    800046cc:	01010113          	addi	sp,sp,16
    800046d0:	00008067          	ret

00000000800046d4 <_ZN16ProducerKeyboradD0Ev>:
    800046d4:	fe010113          	addi	sp,sp,-32
    800046d8:	00113c23          	sd	ra,24(sp)
    800046dc:	00813823          	sd	s0,16(sp)
    800046e0:	00913423          	sd	s1,8(sp)
    800046e4:	02010413          	addi	s0,sp,32
    800046e8:	00050493          	mv	s1,a0
    800046ec:	00007797          	auipc	a5,0x7
    800046f0:	27c78793          	addi	a5,a5,636 # 8000b968 <_ZTV16ProducerKeyborad+0x10>
    800046f4:	00f53023          	sd	a5,0(a0)
    800046f8:	ffffe097          	auipc	ra,0xffffe
    800046fc:	bc0080e7          	jalr	-1088(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80004700:	00048513          	mv	a0,s1
    80004704:	ffffe097          	auipc	ra,0xffffe
    80004708:	c84080e7          	jalr	-892(ra) # 80002388 <_ZdlPv>
    8000470c:	01813083          	ld	ra,24(sp)
    80004710:	01013403          	ld	s0,16(sp)
    80004714:	00813483          	ld	s1,8(sp)
    80004718:	02010113          	addi	sp,sp,32
    8000471c:	00008067          	ret

0000000080004720 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004720:	ff010113          	addi	sp,sp,-16
    80004724:	00113423          	sd	ra,8(sp)
    80004728:	00813023          	sd	s0,0(sp)
    8000472c:	01010413          	addi	s0,sp,16
    80004730:	00007797          	auipc	a5,0x7
    80004734:	26078793          	addi	a5,a5,608 # 8000b990 <_ZTV8Producer+0x10>
    80004738:	00f53023          	sd	a5,0(a0)
    8000473c:	ffffe097          	auipc	ra,0xffffe
    80004740:	b7c080e7          	jalr	-1156(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80004744:	00813083          	ld	ra,8(sp)
    80004748:	00013403          	ld	s0,0(sp)
    8000474c:	01010113          	addi	sp,sp,16
    80004750:	00008067          	ret

0000000080004754 <_ZN8ProducerD0Ev>:
    80004754:	fe010113          	addi	sp,sp,-32
    80004758:	00113c23          	sd	ra,24(sp)
    8000475c:	00813823          	sd	s0,16(sp)
    80004760:	00913423          	sd	s1,8(sp)
    80004764:	02010413          	addi	s0,sp,32
    80004768:	00050493          	mv	s1,a0
    8000476c:	00007797          	auipc	a5,0x7
    80004770:	22478793          	addi	a5,a5,548 # 8000b990 <_ZTV8Producer+0x10>
    80004774:	00f53023          	sd	a5,0(a0)
    80004778:	ffffe097          	auipc	ra,0xffffe
    8000477c:	b40080e7          	jalr	-1216(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80004780:	00048513          	mv	a0,s1
    80004784:	ffffe097          	auipc	ra,0xffffe
    80004788:	c04080e7          	jalr	-1020(ra) # 80002388 <_ZdlPv>
    8000478c:	01813083          	ld	ra,24(sp)
    80004790:	01013403          	ld	s0,16(sp)
    80004794:	00813483          	ld	s1,8(sp)
    80004798:	02010113          	addi	sp,sp,32
    8000479c:	00008067          	ret

00000000800047a0 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800047a0:	fe010113          	addi	sp,sp,-32
    800047a4:	00113c23          	sd	ra,24(sp)
    800047a8:	00813823          	sd	s0,16(sp)
    800047ac:	00913423          	sd	s1,8(sp)
    800047b0:	02010413          	addi	s0,sp,32
    800047b4:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    800047b8:	ffffd097          	auipc	ra,0xffffd
    800047bc:	db8080e7          	jalr	-584(ra) # 80001570 <_Z4getcv>
    800047c0:	0005059b          	sext.w	a1,a0
    800047c4:	01b00793          	li	a5,27
    800047c8:	00f58c63          	beq	a1,a5,800047e0 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    800047cc:	0204b783          	ld	a5,32(s1)
    800047d0:	0087b503          	ld	a0,8(a5)
    800047d4:	00001097          	auipc	ra,0x1
    800047d8:	36c080e7          	jalr	876(ra) # 80005b40 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    800047dc:	fddff06f          	j	800047b8 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    800047e0:	00100793          	li	a5,1
    800047e4:	00007717          	auipc	a4,0x7
    800047e8:	34f72e23          	sw	a5,860(a4) # 8000bb40 <_ZL9threadEnd>
        td->buffer->put('!');
    800047ec:	0204b783          	ld	a5,32(s1)
    800047f0:	02100593          	li	a1,33
    800047f4:	0087b503          	ld	a0,8(a5)
    800047f8:	00001097          	auipc	ra,0x1
    800047fc:	348080e7          	jalr	840(ra) # 80005b40 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004800:	0204b783          	ld	a5,32(s1)
    80004804:	0107b503          	ld	a0,16(a5)
    80004808:	ffffe097          	auipc	ra,0xffffe
    8000480c:	ddc080e7          	jalr	-548(ra) # 800025e4 <_ZN9Semaphore6signalEv>
    }
    80004810:	01813083          	ld	ra,24(sp)
    80004814:	01013403          	ld	s0,16(sp)
    80004818:	00813483          	ld	s1,8(sp)
    8000481c:	02010113          	addi	sp,sp,32
    80004820:	00008067          	ret

0000000080004824 <_ZN8Producer3runEv>:
    void run() override {
    80004824:	fe010113          	addi	sp,sp,-32
    80004828:	00113c23          	sd	ra,24(sp)
    8000482c:	00813823          	sd	s0,16(sp)
    80004830:	00913423          	sd	s1,8(sp)
    80004834:	01213023          	sd	s2,0(sp)
    80004838:	02010413          	addi	s0,sp,32
    8000483c:	00050493          	mv	s1,a0
        int i = 0;
    80004840:	00000913          	li	s2,0
        while (!threadEnd) {
    80004844:	00007797          	auipc	a5,0x7
    80004848:	2fc7a783          	lw	a5,764(a5) # 8000bb40 <_ZL9threadEnd>
    8000484c:	04079263          	bnez	a5,80004890 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004850:	0204b783          	ld	a5,32(s1)
    80004854:	0007a583          	lw	a1,0(a5)
    80004858:	0305859b          	addiw	a1,a1,48
    8000485c:	0087b503          	ld	a0,8(a5)
    80004860:	00001097          	auipc	ra,0x1
    80004864:	2e0080e7          	jalr	736(ra) # 80005b40 <_ZN9BufferCPP3putEi>
            i++;
    80004868:	0019071b          	addiw	a4,s2,1
    8000486c:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004870:	0204b783          	ld	a5,32(s1)
    80004874:	0007a783          	lw	a5,0(a5)
    80004878:	00e787bb          	addw	a5,a5,a4
    8000487c:	00500513          	li	a0,5
    80004880:	02a7e53b          	remw	a0,a5,a0
    80004884:	ffffe097          	auipc	ra,0xffffe
    80004888:	c54080e7          	jalr	-940(ra) # 800024d8 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    8000488c:	fb9ff06f          	j	80004844 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004890:	0204b783          	ld	a5,32(s1)
    80004894:	0107b503          	ld	a0,16(a5)
    80004898:	ffffe097          	auipc	ra,0xffffe
    8000489c:	d4c080e7          	jalr	-692(ra) # 800025e4 <_ZN9Semaphore6signalEv>
    }
    800048a0:	01813083          	ld	ra,24(sp)
    800048a4:	01013403          	ld	s0,16(sp)
    800048a8:	00813483          	ld	s1,8(sp)
    800048ac:	00013903          	ld	s2,0(sp)
    800048b0:	02010113          	addi	sp,sp,32
    800048b4:	00008067          	ret

00000000800048b8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800048b8:	fe010113          	addi	sp,sp,-32
    800048bc:	00113c23          	sd	ra,24(sp)
    800048c0:	00813823          	sd	s0,16(sp)
    800048c4:	00913423          	sd	s1,8(sp)
    800048c8:	01213023          	sd	s2,0(sp)
    800048cc:	02010413          	addi	s0,sp,32
    800048d0:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800048d4:	00100793          	li	a5,1
    800048d8:	02a7f863          	bgeu	a5,a0,80004908 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800048dc:	00a00793          	li	a5,10
    800048e0:	02f577b3          	remu	a5,a0,a5
    800048e4:	02078e63          	beqz	a5,80004920 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800048e8:	fff48513          	addi	a0,s1,-1
    800048ec:	00000097          	auipc	ra,0x0
    800048f0:	fcc080e7          	jalr	-52(ra) # 800048b8 <_ZL9fibonaccim>
    800048f4:	00050913          	mv	s2,a0
    800048f8:	ffe48513          	addi	a0,s1,-2
    800048fc:	00000097          	auipc	ra,0x0
    80004900:	fbc080e7          	jalr	-68(ra) # 800048b8 <_ZL9fibonaccim>
    80004904:	00a90533          	add	a0,s2,a0
}
    80004908:	01813083          	ld	ra,24(sp)
    8000490c:	01013403          	ld	s0,16(sp)
    80004910:	00813483          	ld	s1,8(sp)
    80004914:	00013903          	ld	s2,0(sp)
    80004918:	02010113          	addi	sp,sp,32
    8000491c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004920:	ffffd097          	auipc	ra,0xffffd
    80004924:	b2c080e7          	jalr	-1236(ra) # 8000144c <_Z15thread_dispatchv>
    80004928:	fc1ff06f          	j	800048e8 <_ZL9fibonaccim+0x30>

000000008000492c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000492c:	fe010113          	addi	sp,sp,-32
    80004930:	00113c23          	sd	ra,24(sp)
    80004934:	00813823          	sd	s0,16(sp)
    80004938:	00913423          	sd	s1,8(sp)
    8000493c:	01213023          	sd	s2,0(sp)
    80004940:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004944:	00a00493          	li	s1,10
    80004948:	0400006f          	j	80004988 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000494c:	00005517          	auipc	a0,0x5
    80004950:	ba450513          	addi	a0,a0,-1116 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80004954:	00001097          	auipc	ra,0x1
    80004958:	dc8080e7          	jalr	-568(ra) # 8000571c <_Z11printStringPKc>
    8000495c:	00000613          	li	a2,0
    80004960:	00a00593          	li	a1,10
    80004964:	00048513          	mv	a0,s1
    80004968:	00001097          	auipc	ra,0x1
    8000496c:	f64080e7          	jalr	-156(ra) # 800058cc <_Z8printIntiii>
    80004970:	00004517          	auipc	a0,0x4
    80004974:	7f050513          	addi	a0,a0,2032 # 80009160 <CONSOLE_STATUS+0x150>
    80004978:	00001097          	auipc	ra,0x1
    8000497c:	da4080e7          	jalr	-604(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004980:	0014849b          	addiw	s1,s1,1
    80004984:	0ff4f493          	andi	s1,s1,255
    80004988:	00c00793          	li	a5,12
    8000498c:	fc97f0e3          	bgeu	a5,s1,8000494c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004990:	00005517          	auipc	a0,0x5
    80004994:	b6850513          	addi	a0,a0,-1176 # 800094f8 <CONSOLE_STATUS+0x4e8>
    80004998:	00001097          	auipc	ra,0x1
    8000499c:	d84080e7          	jalr	-636(ra) # 8000571c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800049a0:	00500313          	li	t1,5
    thread_dispatch();
    800049a4:	ffffd097          	auipc	ra,0xffffd
    800049a8:	aa8080e7          	jalr	-1368(ra) # 8000144c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800049ac:	01000513          	li	a0,16
    800049b0:	00000097          	auipc	ra,0x0
    800049b4:	f08080e7          	jalr	-248(ra) # 800048b8 <_ZL9fibonaccim>
    800049b8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800049bc:	00005517          	auipc	a0,0x5
    800049c0:	b4c50513          	addi	a0,a0,-1204 # 80009508 <CONSOLE_STATUS+0x4f8>
    800049c4:	00001097          	auipc	ra,0x1
    800049c8:	d58080e7          	jalr	-680(ra) # 8000571c <_Z11printStringPKc>
    800049cc:	00000613          	li	a2,0
    800049d0:	00a00593          	li	a1,10
    800049d4:	0009051b          	sext.w	a0,s2
    800049d8:	00001097          	auipc	ra,0x1
    800049dc:	ef4080e7          	jalr	-268(ra) # 800058cc <_Z8printIntiii>
    800049e0:	00004517          	auipc	a0,0x4
    800049e4:	78050513          	addi	a0,a0,1920 # 80009160 <CONSOLE_STATUS+0x150>
    800049e8:	00001097          	auipc	ra,0x1
    800049ec:	d34080e7          	jalr	-716(ra) # 8000571c <_Z11printStringPKc>
    800049f0:	0400006f          	j	80004a30 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800049f4:	00005517          	auipc	a0,0x5
    800049f8:	afc50513          	addi	a0,a0,-1284 # 800094f0 <CONSOLE_STATUS+0x4e0>
    800049fc:	00001097          	auipc	ra,0x1
    80004a00:	d20080e7          	jalr	-736(ra) # 8000571c <_Z11printStringPKc>
    80004a04:	00000613          	li	a2,0
    80004a08:	00a00593          	li	a1,10
    80004a0c:	00048513          	mv	a0,s1
    80004a10:	00001097          	auipc	ra,0x1
    80004a14:	ebc080e7          	jalr	-324(ra) # 800058cc <_Z8printIntiii>
    80004a18:	00004517          	auipc	a0,0x4
    80004a1c:	74850513          	addi	a0,a0,1864 # 80009160 <CONSOLE_STATUS+0x150>
    80004a20:	00001097          	auipc	ra,0x1
    80004a24:	cfc080e7          	jalr	-772(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004a28:	0014849b          	addiw	s1,s1,1
    80004a2c:	0ff4f493          	andi	s1,s1,255
    80004a30:	00f00793          	li	a5,15
    80004a34:	fc97f0e3          	bgeu	a5,s1,800049f4 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004a38:	00005517          	auipc	a0,0x5
    80004a3c:	ae050513          	addi	a0,a0,-1312 # 80009518 <CONSOLE_STATUS+0x508>
    80004a40:	00001097          	auipc	ra,0x1
    80004a44:	cdc080e7          	jalr	-804(ra) # 8000571c <_Z11printStringPKc>
    finishedD = true;
    80004a48:	00100793          	li	a5,1
    80004a4c:	00007717          	auipc	a4,0x7
    80004a50:	10f70223          	sb	a5,260(a4) # 8000bb50 <_ZL9finishedD>
    thread_dispatch();
    80004a54:	ffffd097          	auipc	ra,0xffffd
    80004a58:	9f8080e7          	jalr	-1544(ra) # 8000144c <_Z15thread_dispatchv>
}
    80004a5c:	01813083          	ld	ra,24(sp)
    80004a60:	01013403          	ld	s0,16(sp)
    80004a64:	00813483          	ld	s1,8(sp)
    80004a68:	00013903          	ld	s2,0(sp)
    80004a6c:	02010113          	addi	sp,sp,32
    80004a70:	00008067          	ret

0000000080004a74 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004a74:	fe010113          	addi	sp,sp,-32
    80004a78:	00113c23          	sd	ra,24(sp)
    80004a7c:	00813823          	sd	s0,16(sp)
    80004a80:	00913423          	sd	s1,8(sp)
    80004a84:	01213023          	sd	s2,0(sp)
    80004a88:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004a8c:	00000493          	li	s1,0
    80004a90:	0400006f          	j	80004ad0 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004a94:	00005517          	auipc	a0,0x5
    80004a98:	a2c50513          	addi	a0,a0,-1492 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80004a9c:	00001097          	auipc	ra,0x1
    80004aa0:	c80080e7          	jalr	-896(ra) # 8000571c <_Z11printStringPKc>
    80004aa4:	00000613          	li	a2,0
    80004aa8:	00a00593          	li	a1,10
    80004aac:	00048513          	mv	a0,s1
    80004ab0:	00001097          	auipc	ra,0x1
    80004ab4:	e1c080e7          	jalr	-484(ra) # 800058cc <_Z8printIntiii>
    80004ab8:	00004517          	auipc	a0,0x4
    80004abc:	6a850513          	addi	a0,a0,1704 # 80009160 <CONSOLE_STATUS+0x150>
    80004ac0:	00001097          	auipc	ra,0x1
    80004ac4:	c5c080e7          	jalr	-932(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004ac8:	0014849b          	addiw	s1,s1,1
    80004acc:	0ff4f493          	andi	s1,s1,255
    80004ad0:	00200793          	li	a5,2
    80004ad4:	fc97f0e3          	bgeu	a5,s1,80004a94 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004ad8:	00005517          	auipc	a0,0x5
    80004adc:	9f050513          	addi	a0,a0,-1552 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80004ae0:	00001097          	auipc	ra,0x1
    80004ae4:	c3c080e7          	jalr	-964(ra) # 8000571c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004ae8:	00700313          	li	t1,7
    thread_dispatch();
    80004aec:	ffffd097          	auipc	ra,0xffffd
    80004af0:	960080e7          	jalr	-1696(ra) # 8000144c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004af4:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004af8:	00005517          	auipc	a0,0x5
    80004afc:	9e050513          	addi	a0,a0,-1568 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80004b00:	00001097          	auipc	ra,0x1
    80004b04:	c1c080e7          	jalr	-996(ra) # 8000571c <_Z11printStringPKc>
    80004b08:	00000613          	li	a2,0
    80004b0c:	00a00593          	li	a1,10
    80004b10:	0009051b          	sext.w	a0,s2
    80004b14:	00001097          	auipc	ra,0x1
    80004b18:	db8080e7          	jalr	-584(ra) # 800058cc <_Z8printIntiii>
    80004b1c:	00004517          	auipc	a0,0x4
    80004b20:	64450513          	addi	a0,a0,1604 # 80009160 <CONSOLE_STATUS+0x150>
    80004b24:	00001097          	auipc	ra,0x1
    80004b28:	bf8080e7          	jalr	-1032(ra) # 8000571c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004b2c:	00c00513          	li	a0,12
    80004b30:	00000097          	auipc	ra,0x0
    80004b34:	d88080e7          	jalr	-632(ra) # 800048b8 <_ZL9fibonaccim>
    80004b38:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004b3c:	00005517          	auipc	a0,0x5
    80004b40:	9a450513          	addi	a0,a0,-1628 # 800094e0 <CONSOLE_STATUS+0x4d0>
    80004b44:	00001097          	auipc	ra,0x1
    80004b48:	bd8080e7          	jalr	-1064(ra) # 8000571c <_Z11printStringPKc>
    80004b4c:	00000613          	li	a2,0
    80004b50:	00a00593          	li	a1,10
    80004b54:	0009051b          	sext.w	a0,s2
    80004b58:	00001097          	auipc	ra,0x1
    80004b5c:	d74080e7          	jalr	-652(ra) # 800058cc <_Z8printIntiii>
    80004b60:	00004517          	auipc	a0,0x4
    80004b64:	60050513          	addi	a0,a0,1536 # 80009160 <CONSOLE_STATUS+0x150>
    80004b68:	00001097          	auipc	ra,0x1
    80004b6c:	bb4080e7          	jalr	-1100(ra) # 8000571c <_Z11printStringPKc>
    80004b70:	0400006f          	j	80004bb0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004b74:	00005517          	auipc	a0,0x5
    80004b78:	94c50513          	addi	a0,a0,-1716 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80004b7c:	00001097          	auipc	ra,0x1
    80004b80:	ba0080e7          	jalr	-1120(ra) # 8000571c <_Z11printStringPKc>
    80004b84:	00000613          	li	a2,0
    80004b88:	00a00593          	li	a1,10
    80004b8c:	00048513          	mv	a0,s1
    80004b90:	00001097          	auipc	ra,0x1
    80004b94:	d3c080e7          	jalr	-708(ra) # 800058cc <_Z8printIntiii>
    80004b98:	00004517          	auipc	a0,0x4
    80004b9c:	5c850513          	addi	a0,a0,1480 # 80009160 <CONSOLE_STATUS+0x150>
    80004ba0:	00001097          	auipc	ra,0x1
    80004ba4:	b7c080e7          	jalr	-1156(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004ba8:	0014849b          	addiw	s1,s1,1
    80004bac:	0ff4f493          	andi	s1,s1,255
    80004bb0:	00500793          	li	a5,5
    80004bb4:	fc97f0e3          	bgeu	a5,s1,80004b74 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004bb8:	00005517          	auipc	a0,0x5
    80004bbc:	8e050513          	addi	a0,a0,-1824 # 80009498 <CONSOLE_STATUS+0x488>
    80004bc0:	00001097          	auipc	ra,0x1
    80004bc4:	b5c080e7          	jalr	-1188(ra) # 8000571c <_Z11printStringPKc>
    finishedC = true;
    80004bc8:	00100793          	li	a5,1
    80004bcc:	00007717          	auipc	a4,0x7
    80004bd0:	f8f702a3          	sb	a5,-123(a4) # 8000bb51 <_ZL9finishedC>
    thread_dispatch();
    80004bd4:	ffffd097          	auipc	ra,0xffffd
    80004bd8:	878080e7          	jalr	-1928(ra) # 8000144c <_Z15thread_dispatchv>
}
    80004bdc:	01813083          	ld	ra,24(sp)
    80004be0:	01013403          	ld	s0,16(sp)
    80004be4:	00813483          	ld	s1,8(sp)
    80004be8:	00013903          	ld	s2,0(sp)
    80004bec:	02010113          	addi	sp,sp,32
    80004bf0:	00008067          	ret

0000000080004bf4 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004bf4:	fe010113          	addi	sp,sp,-32
    80004bf8:	00113c23          	sd	ra,24(sp)
    80004bfc:	00813823          	sd	s0,16(sp)
    80004c00:	00913423          	sd	s1,8(sp)
    80004c04:	01213023          	sd	s2,0(sp)
    80004c08:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004c0c:	00000913          	li	s2,0
    80004c10:	0380006f          	j	80004c48 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004c14:	ffffd097          	auipc	ra,0xffffd
    80004c18:	838080e7          	jalr	-1992(ra) # 8000144c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004c1c:	00148493          	addi	s1,s1,1
    80004c20:	000027b7          	lui	a5,0x2
    80004c24:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004c28:	0097ee63          	bltu	a5,s1,80004c44 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004c2c:	00000713          	li	a4,0
    80004c30:	000077b7          	lui	a5,0x7
    80004c34:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004c38:	fce7eee3          	bltu	a5,a4,80004c14 <_ZL11workerBodyBPv+0x20>
    80004c3c:	00170713          	addi	a4,a4,1
    80004c40:	ff1ff06f          	j	80004c30 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004c44:	00190913          	addi	s2,s2,1
    80004c48:	00f00793          	li	a5,15
    80004c4c:	0527e063          	bltu	a5,s2,80004c8c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004c50:	00005517          	auipc	a0,0x5
    80004c54:	85850513          	addi	a0,a0,-1960 # 800094a8 <CONSOLE_STATUS+0x498>
    80004c58:	00001097          	auipc	ra,0x1
    80004c5c:	ac4080e7          	jalr	-1340(ra) # 8000571c <_Z11printStringPKc>
    80004c60:	00000613          	li	a2,0
    80004c64:	00a00593          	li	a1,10
    80004c68:	0009051b          	sext.w	a0,s2
    80004c6c:	00001097          	auipc	ra,0x1
    80004c70:	c60080e7          	jalr	-928(ra) # 800058cc <_Z8printIntiii>
    80004c74:	00004517          	auipc	a0,0x4
    80004c78:	4ec50513          	addi	a0,a0,1260 # 80009160 <CONSOLE_STATUS+0x150>
    80004c7c:	00001097          	auipc	ra,0x1
    80004c80:	aa0080e7          	jalr	-1376(ra) # 8000571c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004c84:	00000493          	li	s1,0
    80004c88:	f99ff06f          	j	80004c20 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004c8c:	00005517          	auipc	a0,0x5
    80004c90:	82450513          	addi	a0,a0,-2012 # 800094b0 <CONSOLE_STATUS+0x4a0>
    80004c94:	00001097          	auipc	ra,0x1
    80004c98:	a88080e7          	jalr	-1400(ra) # 8000571c <_Z11printStringPKc>
    finishedB = true;
    80004c9c:	00100793          	li	a5,1
    80004ca0:	00007717          	auipc	a4,0x7
    80004ca4:	eaf70923          	sb	a5,-334(a4) # 8000bb52 <_ZL9finishedB>
    thread_dispatch();
    80004ca8:	ffffc097          	auipc	ra,0xffffc
    80004cac:	7a4080e7          	jalr	1956(ra) # 8000144c <_Z15thread_dispatchv>
}
    80004cb0:	01813083          	ld	ra,24(sp)
    80004cb4:	01013403          	ld	s0,16(sp)
    80004cb8:	00813483          	ld	s1,8(sp)
    80004cbc:	00013903          	ld	s2,0(sp)
    80004cc0:	02010113          	addi	sp,sp,32
    80004cc4:	00008067          	ret

0000000080004cc8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004cc8:	fe010113          	addi	sp,sp,-32
    80004ccc:	00113c23          	sd	ra,24(sp)
    80004cd0:	00813823          	sd	s0,16(sp)
    80004cd4:	00913423          	sd	s1,8(sp)
    80004cd8:	01213023          	sd	s2,0(sp)
    80004cdc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004ce0:	00000913          	li	s2,0
    80004ce4:	0380006f          	j	80004d1c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004ce8:	ffffc097          	auipc	ra,0xffffc
    80004cec:	764080e7          	jalr	1892(ra) # 8000144c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004cf0:	00148493          	addi	s1,s1,1
    80004cf4:	000027b7          	lui	a5,0x2
    80004cf8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004cfc:	0097ee63          	bltu	a5,s1,80004d18 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004d00:	00000713          	li	a4,0
    80004d04:	000077b7          	lui	a5,0x7
    80004d08:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004d0c:	fce7eee3          	bltu	a5,a4,80004ce8 <_ZL11workerBodyAPv+0x20>
    80004d10:	00170713          	addi	a4,a4,1
    80004d14:	ff1ff06f          	j	80004d04 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004d18:	00190913          	addi	s2,s2,1
    80004d1c:	00900793          	li	a5,9
    80004d20:	0527e063          	bltu	a5,s2,80004d60 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004d24:	00004517          	auipc	a0,0x4
    80004d28:	76c50513          	addi	a0,a0,1900 # 80009490 <CONSOLE_STATUS+0x480>
    80004d2c:	00001097          	auipc	ra,0x1
    80004d30:	9f0080e7          	jalr	-1552(ra) # 8000571c <_Z11printStringPKc>
    80004d34:	00000613          	li	a2,0
    80004d38:	00a00593          	li	a1,10
    80004d3c:	0009051b          	sext.w	a0,s2
    80004d40:	00001097          	auipc	ra,0x1
    80004d44:	b8c080e7          	jalr	-1140(ra) # 800058cc <_Z8printIntiii>
    80004d48:	00004517          	auipc	a0,0x4
    80004d4c:	41850513          	addi	a0,a0,1048 # 80009160 <CONSOLE_STATUS+0x150>
    80004d50:	00001097          	auipc	ra,0x1
    80004d54:	9cc080e7          	jalr	-1588(ra) # 8000571c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004d58:	00000493          	li	s1,0
    80004d5c:	f99ff06f          	j	80004cf4 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004d60:	00004517          	auipc	a0,0x4
    80004d64:	73850513          	addi	a0,a0,1848 # 80009498 <CONSOLE_STATUS+0x488>
    80004d68:	00001097          	auipc	ra,0x1
    80004d6c:	9b4080e7          	jalr	-1612(ra) # 8000571c <_Z11printStringPKc>
    finishedA = true;
    80004d70:	00100793          	li	a5,1
    80004d74:	00007717          	auipc	a4,0x7
    80004d78:	dcf70fa3          	sb	a5,-545(a4) # 8000bb53 <_ZL9finishedA>
}
    80004d7c:	01813083          	ld	ra,24(sp)
    80004d80:	01013403          	ld	s0,16(sp)
    80004d84:	00813483          	ld	s1,8(sp)
    80004d88:	00013903          	ld	s2,0(sp)
    80004d8c:	02010113          	addi	sp,sp,32
    80004d90:	00008067          	ret

0000000080004d94 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004d94:	fd010113          	addi	sp,sp,-48
    80004d98:	02113423          	sd	ra,40(sp)
    80004d9c:	02813023          	sd	s0,32(sp)
    80004da0:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004da4:	00000613          	li	a2,0
    80004da8:	00000597          	auipc	a1,0x0
    80004dac:	f2058593          	addi	a1,a1,-224 # 80004cc8 <_ZL11workerBodyAPv>
    80004db0:	fd040513          	addi	a0,s0,-48
    80004db4:	ffffc097          	auipc	ra,0xffffc
    80004db8:	5e8080e7          	jalr	1512(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004dbc:	00004517          	auipc	a0,0x4
    80004dc0:	76c50513          	addi	a0,a0,1900 # 80009528 <CONSOLE_STATUS+0x518>
    80004dc4:	00001097          	auipc	ra,0x1
    80004dc8:	958080e7          	jalr	-1704(ra) # 8000571c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004dcc:	00000613          	li	a2,0
    80004dd0:	00000597          	auipc	a1,0x0
    80004dd4:	e2458593          	addi	a1,a1,-476 # 80004bf4 <_ZL11workerBodyBPv>
    80004dd8:	fd840513          	addi	a0,s0,-40
    80004ddc:	ffffc097          	auipc	ra,0xffffc
    80004de0:	5c0080e7          	jalr	1472(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004de4:	00004517          	auipc	a0,0x4
    80004de8:	75c50513          	addi	a0,a0,1884 # 80009540 <CONSOLE_STATUS+0x530>
    80004dec:	00001097          	auipc	ra,0x1
    80004df0:	930080e7          	jalr	-1744(ra) # 8000571c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004df4:	00000613          	li	a2,0
    80004df8:	00000597          	auipc	a1,0x0
    80004dfc:	c7c58593          	addi	a1,a1,-900 # 80004a74 <_ZL11workerBodyCPv>
    80004e00:	fe040513          	addi	a0,s0,-32
    80004e04:	ffffc097          	auipc	ra,0xffffc
    80004e08:	598080e7          	jalr	1432(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004e0c:	00004517          	auipc	a0,0x4
    80004e10:	74c50513          	addi	a0,a0,1868 # 80009558 <CONSOLE_STATUS+0x548>
    80004e14:	00001097          	auipc	ra,0x1
    80004e18:	908080e7          	jalr	-1784(ra) # 8000571c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004e1c:	00000613          	li	a2,0
    80004e20:	00000597          	auipc	a1,0x0
    80004e24:	b0c58593          	addi	a1,a1,-1268 # 8000492c <_ZL11workerBodyDPv>
    80004e28:	fe840513          	addi	a0,s0,-24
    80004e2c:	ffffc097          	auipc	ra,0xffffc
    80004e30:	570080e7          	jalr	1392(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004e34:	00004517          	auipc	a0,0x4
    80004e38:	73c50513          	addi	a0,a0,1852 # 80009570 <CONSOLE_STATUS+0x560>
    80004e3c:	00001097          	auipc	ra,0x1
    80004e40:	8e0080e7          	jalr	-1824(ra) # 8000571c <_Z11printStringPKc>
    80004e44:	00c0006f          	j	80004e50 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004e48:	ffffc097          	auipc	ra,0xffffc
    80004e4c:	604080e7          	jalr	1540(ra) # 8000144c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004e50:	00007797          	auipc	a5,0x7
    80004e54:	d037c783          	lbu	a5,-765(a5) # 8000bb53 <_ZL9finishedA>
    80004e58:	fe0788e3          	beqz	a5,80004e48 <_Z18Threads_C_API_testv+0xb4>
    80004e5c:	00007797          	auipc	a5,0x7
    80004e60:	cf67c783          	lbu	a5,-778(a5) # 8000bb52 <_ZL9finishedB>
    80004e64:	fe0782e3          	beqz	a5,80004e48 <_Z18Threads_C_API_testv+0xb4>
    80004e68:	00007797          	auipc	a5,0x7
    80004e6c:	ce97c783          	lbu	a5,-791(a5) # 8000bb51 <_ZL9finishedC>
    80004e70:	fc078ce3          	beqz	a5,80004e48 <_Z18Threads_C_API_testv+0xb4>
    80004e74:	00007797          	auipc	a5,0x7
    80004e78:	cdc7c783          	lbu	a5,-804(a5) # 8000bb50 <_ZL9finishedD>
    80004e7c:	fc0786e3          	beqz	a5,80004e48 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004e80:	02813083          	ld	ra,40(sp)
    80004e84:	02013403          	ld	s0,32(sp)
    80004e88:	03010113          	addi	sp,sp,48
    80004e8c:	00008067          	ret

0000000080004e90 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004e90:	fd010113          	addi	sp,sp,-48
    80004e94:	02113423          	sd	ra,40(sp)
    80004e98:	02813023          	sd	s0,32(sp)
    80004e9c:	00913c23          	sd	s1,24(sp)
    80004ea0:	01213823          	sd	s2,16(sp)
    80004ea4:	01313423          	sd	s3,8(sp)
    80004ea8:	03010413          	addi	s0,sp,48
    80004eac:	00050993          	mv	s3,a0
    80004eb0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004eb4:	00000913          	li	s2,0
    80004eb8:	00c0006f          	j	80004ec4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004ebc:	ffffd097          	auipc	ra,0xffffd
    80004ec0:	5f4080e7          	jalr	1524(ra) # 800024b0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004ec4:	ffffc097          	auipc	ra,0xffffc
    80004ec8:	6ac080e7          	jalr	1708(ra) # 80001570 <_Z4getcv>
    80004ecc:	0005059b          	sext.w	a1,a0
    80004ed0:	01b00793          	li	a5,27
    80004ed4:	02f58a63          	beq	a1,a5,80004f08 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004ed8:	0084b503          	ld	a0,8(s1)
    80004edc:	00001097          	auipc	ra,0x1
    80004ee0:	c64080e7          	jalr	-924(ra) # 80005b40 <_ZN9BufferCPP3putEi>
        i++;
    80004ee4:	0019071b          	addiw	a4,s2,1
    80004ee8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004eec:	0004a683          	lw	a3,0(s1)
    80004ef0:	0026979b          	slliw	a5,a3,0x2
    80004ef4:	00d787bb          	addw	a5,a5,a3
    80004ef8:	0017979b          	slliw	a5,a5,0x1
    80004efc:	02f767bb          	remw	a5,a4,a5
    80004f00:	fc0792e3          	bnez	a5,80004ec4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004f04:	fb9ff06f          	j	80004ebc <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004f08:	00100793          	li	a5,1
    80004f0c:	00007717          	auipc	a4,0x7
    80004f10:	c4f72623          	sw	a5,-948(a4) # 8000bb58 <_ZL9threadEnd>
    td->buffer->put('!');
    80004f14:	0209b783          	ld	a5,32(s3)
    80004f18:	02100593          	li	a1,33
    80004f1c:	0087b503          	ld	a0,8(a5)
    80004f20:	00001097          	auipc	ra,0x1
    80004f24:	c20080e7          	jalr	-992(ra) # 80005b40 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004f28:	0104b503          	ld	a0,16(s1)
    80004f2c:	ffffd097          	auipc	ra,0xffffd
    80004f30:	6b8080e7          	jalr	1720(ra) # 800025e4 <_ZN9Semaphore6signalEv>
}
    80004f34:	02813083          	ld	ra,40(sp)
    80004f38:	02013403          	ld	s0,32(sp)
    80004f3c:	01813483          	ld	s1,24(sp)
    80004f40:	01013903          	ld	s2,16(sp)
    80004f44:	00813983          	ld	s3,8(sp)
    80004f48:	03010113          	addi	sp,sp,48
    80004f4c:	00008067          	ret

0000000080004f50 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80004f50:	fe010113          	addi	sp,sp,-32
    80004f54:	00113c23          	sd	ra,24(sp)
    80004f58:	00813823          	sd	s0,16(sp)
    80004f5c:	00913423          	sd	s1,8(sp)
    80004f60:	01213023          	sd	s2,0(sp)
    80004f64:	02010413          	addi	s0,sp,32
    80004f68:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004f6c:	00000913          	li	s2,0
    80004f70:	00c0006f          	j	80004f7c <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004f74:	ffffd097          	auipc	ra,0xffffd
    80004f78:	53c080e7          	jalr	1340(ra) # 800024b0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80004f7c:	00007797          	auipc	a5,0x7
    80004f80:	bdc7a783          	lw	a5,-1060(a5) # 8000bb58 <_ZL9threadEnd>
    80004f84:	02079e63          	bnez	a5,80004fc0 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004f88:	0004a583          	lw	a1,0(s1)
    80004f8c:	0305859b          	addiw	a1,a1,48
    80004f90:	0084b503          	ld	a0,8(s1)
    80004f94:	00001097          	auipc	ra,0x1
    80004f98:	bac080e7          	jalr	-1108(ra) # 80005b40 <_ZN9BufferCPP3putEi>
        i++;
    80004f9c:	0019071b          	addiw	a4,s2,1
    80004fa0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004fa4:	0004a683          	lw	a3,0(s1)
    80004fa8:	0026979b          	slliw	a5,a3,0x2
    80004fac:	00d787bb          	addw	a5,a5,a3
    80004fb0:	0017979b          	slliw	a5,a5,0x1
    80004fb4:	02f767bb          	remw	a5,a4,a5
    80004fb8:	fc0792e3          	bnez	a5,80004f7c <_ZN12ProducerSync8producerEPv+0x2c>
    80004fbc:	fb9ff06f          	j	80004f74 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004fc0:	0104b503          	ld	a0,16(s1)
    80004fc4:	ffffd097          	auipc	ra,0xffffd
    80004fc8:	620080e7          	jalr	1568(ra) # 800025e4 <_ZN9Semaphore6signalEv>
}
    80004fcc:	01813083          	ld	ra,24(sp)
    80004fd0:	01013403          	ld	s0,16(sp)
    80004fd4:	00813483          	ld	s1,8(sp)
    80004fd8:	00013903          	ld	s2,0(sp)
    80004fdc:	02010113          	addi	sp,sp,32
    80004fe0:	00008067          	ret

0000000080004fe4 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004fe4:	fd010113          	addi	sp,sp,-48
    80004fe8:	02113423          	sd	ra,40(sp)
    80004fec:	02813023          	sd	s0,32(sp)
    80004ff0:	00913c23          	sd	s1,24(sp)
    80004ff4:	01213823          	sd	s2,16(sp)
    80004ff8:	01313423          	sd	s3,8(sp)
    80004ffc:	01413023          	sd	s4,0(sp)
    80005000:	03010413          	addi	s0,sp,48
    80005004:	00050993          	mv	s3,a0
    80005008:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000500c:	00000a13          	li	s4,0
    80005010:	01c0006f          	j	8000502c <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005014:	ffffd097          	auipc	ra,0xffffd
    80005018:	49c080e7          	jalr	1180(ra) # 800024b0 <_ZN6Thread8dispatchEv>
    8000501c:	0500006f          	j	8000506c <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005020:	00a00513          	li	a0,10
    80005024:	ffffc097          	auipc	ra,0xffffc
    80005028:	574080e7          	jalr	1396(ra) # 80001598 <_Z4putcc>
    while (!threadEnd) {
    8000502c:	00007797          	auipc	a5,0x7
    80005030:	b2c7a783          	lw	a5,-1236(a5) # 8000bb58 <_ZL9threadEnd>
    80005034:	06079263          	bnez	a5,80005098 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005038:	00893503          	ld	a0,8(s2)
    8000503c:	00001097          	auipc	ra,0x1
    80005040:	b94080e7          	jalr	-1132(ra) # 80005bd0 <_ZN9BufferCPP3getEv>
        i++;
    80005044:	001a049b          	addiw	s1,s4,1
    80005048:	00048a1b          	sext.w	s4,s1
        putc(key);
    8000504c:	0ff57513          	andi	a0,a0,255
    80005050:	ffffc097          	auipc	ra,0xffffc
    80005054:	548080e7          	jalr	1352(ra) # 80001598 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005058:	00092703          	lw	a4,0(s2)
    8000505c:	0027179b          	slliw	a5,a4,0x2
    80005060:	00e787bb          	addw	a5,a5,a4
    80005064:	02f4e7bb          	remw	a5,s1,a5
    80005068:	fa0786e3          	beqz	a5,80005014 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    8000506c:	05000793          	li	a5,80
    80005070:	02f4e4bb          	remw	s1,s1,a5
    80005074:	fa049ce3          	bnez	s1,8000502c <_ZN12ConsumerSync8consumerEPv+0x48>
    80005078:	fa9ff06f          	j	80005020 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    8000507c:	0209b783          	ld	a5,32(s3)
    80005080:	0087b503          	ld	a0,8(a5)
    80005084:	00001097          	auipc	ra,0x1
    80005088:	b4c080e7          	jalr	-1204(ra) # 80005bd0 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    8000508c:	0ff57513          	andi	a0,a0,255
    80005090:	ffffd097          	auipc	ra,0xffffd
    80005094:	5c4080e7          	jalr	1476(ra) # 80002654 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005098:	0209b783          	ld	a5,32(s3)
    8000509c:	0087b503          	ld	a0,8(a5)
    800050a0:	00001097          	auipc	ra,0x1
    800050a4:	bbc080e7          	jalr	-1092(ra) # 80005c5c <_ZN9BufferCPP6getCntEv>
    800050a8:	fca04ae3          	bgtz	a0,8000507c <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    800050ac:	01093503          	ld	a0,16(s2)
    800050b0:	ffffd097          	auipc	ra,0xffffd
    800050b4:	534080e7          	jalr	1332(ra) # 800025e4 <_ZN9Semaphore6signalEv>
}
    800050b8:	02813083          	ld	ra,40(sp)
    800050bc:	02013403          	ld	s0,32(sp)
    800050c0:	01813483          	ld	s1,24(sp)
    800050c4:	01013903          	ld	s2,16(sp)
    800050c8:	00813983          	ld	s3,8(sp)
    800050cc:	00013a03          	ld	s4,0(sp)
    800050d0:	03010113          	addi	sp,sp,48
    800050d4:	00008067          	ret

00000000800050d8 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800050d8:	f8010113          	addi	sp,sp,-128
    800050dc:	06113c23          	sd	ra,120(sp)
    800050e0:	06813823          	sd	s0,112(sp)
    800050e4:	06913423          	sd	s1,104(sp)
    800050e8:	07213023          	sd	s2,96(sp)
    800050ec:	05313c23          	sd	s3,88(sp)
    800050f0:	05413823          	sd	s4,80(sp)
    800050f4:	05513423          	sd	s5,72(sp)
    800050f8:	05613023          	sd	s6,64(sp)
    800050fc:	03713c23          	sd	s7,56(sp)
    80005100:	03813823          	sd	s8,48(sp)
    80005104:	03913423          	sd	s9,40(sp)
    80005108:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    8000510c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005110:	00004517          	auipc	a0,0x4
    80005114:	29850513          	addi	a0,a0,664 # 800093a8 <CONSOLE_STATUS+0x398>
    80005118:	00000097          	auipc	ra,0x0
    8000511c:	604080e7          	jalr	1540(ra) # 8000571c <_Z11printStringPKc>
    getString(input, 30);
    80005120:	01e00593          	li	a1,30
    80005124:	f8040493          	addi	s1,s0,-128
    80005128:	00048513          	mv	a0,s1
    8000512c:	00000097          	auipc	ra,0x0
    80005130:	678080e7          	jalr	1656(ra) # 800057a4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005134:	00048513          	mv	a0,s1
    80005138:	00000097          	auipc	ra,0x0
    8000513c:	744080e7          	jalr	1860(ra) # 8000587c <_Z11stringToIntPKc>
    80005140:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005144:	00004517          	auipc	a0,0x4
    80005148:	28450513          	addi	a0,a0,644 # 800093c8 <CONSOLE_STATUS+0x3b8>
    8000514c:	00000097          	auipc	ra,0x0
    80005150:	5d0080e7          	jalr	1488(ra) # 8000571c <_Z11printStringPKc>
    getString(input, 30);
    80005154:	01e00593          	li	a1,30
    80005158:	00048513          	mv	a0,s1
    8000515c:	00000097          	auipc	ra,0x0
    80005160:	648080e7          	jalr	1608(ra) # 800057a4 <_Z9getStringPci>
    n = stringToInt(input);
    80005164:	00048513          	mv	a0,s1
    80005168:	00000097          	auipc	ra,0x0
    8000516c:	714080e7          	jalr	1812(ra) # 8000587c <_Z11stringToIntPKc>
    80005170:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005174:	00004517          	auipc	a0,0x4
    80005178:	27450513          	addi	a0,a0,628 # 800093e8 <CONSOLE_STATUS+0x3d8>
    8000517c:	00000097          	auipc	ra,0x0
    80005180:	5a0080e7          	jalr	1440(ra) # 8000571c <_Z11printStringPKc>
    80005184:	00000613          	li	a2,0
    80005188:	00a00593          	li	a1,10
    8000518c:	00090513          	mv	a0,s2
    80005190:	00000097          	auipc	ra,0x0
    80005194:	73c080e7          	jalr	1852(ra) # 800058cc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005198:	00004517          	auipc	a0,0x4
    8000519c:	26850513          	addi	a0,a0,616 # 80009400 <CONSOLE_STATUS+0x3f0>
    800051a0:	00000097          	auipc	ra,0x0
    800051a4:	57c080e7          	jalr	1404(ra) # 8000571c <_Z11printStringPKc>
    800051a8:	00000613          	li	a2,0
    800051ac:	00a00593          	li	a1,10
    800051b0:	00048513          	mv	a0,s1
    800051b4:	00000097          	auipc	ra,0x0
    800051b8:	718080e7          	jalr	1816(ra) # 800058cc <_Z8printIntiii>
    printString(".\n");
    800051bc:	00004517          	auipc	a0,0x4
    800051c0:	25c50513          	addi	a0,a0,604 # 80009418 <CONSOLE_STATUS+0x408>
    800051c4:	00000097          	auipc	ra,0x0
    800051c8:	558080e7          	jalr	1368(ra) # 8000571c <_Z11printStringPKc>
    if(threadNum > n) {
    800051cc:	0324c463          	blt	s1,s2,800051f4 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    800051d0:	03205c63          	blez	s2,80005208 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800051d4:	03800513          	li	a0,56
    800051d8:	ffffd097          	auipc	ra,0xffffd
    800051dc:	188080e7          	jalr	392(ra) # 80002360 <_Znwm>
    800051e0:	00050a93          	mv	s5,a0
    800051e4:	00048593          	mv	a1,s1
    800051e8:	00001097          	auipc	ra,0x1
    800051ec:	804080e7          	jalr	-2044(ra) # 800059ec <_ZN9BufferCPPC1Ei>
    800051f0:	0300006f          	j	80005220 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800051f4:	00004517          	auipc	a0,0x4
    800051f8:	22c50513          	addi	a0,a0,556 # 80009420 <CONSOLE_STATUS+0x410>
    800051fc:	00000097          	auipc	ra,0x0
    80005200:	520080e7          	jalr	1312(ra) # 8000571c <_Z11printStringPKc>
        return;
    80005204:	0140006f          	j	80005218 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005208:	00004517          	auipc	a0,0x4
    8000520c:	25850513          	addi	a0,a0,600 # 80009460 <CONSOLE_STATUS+0x450>
    80005210:	00000097          	auipc	ra,0x0
    80005214:	50c080e7          	jalr	1292(ra) # 8000571c <_Z11printStringPKc>
        return;
    80005218:	000b8113          	mv	sp,s7
    8000521c:	2380006f          	j	80005454 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005220:	01000513          	li	a0,16
    80005224:	ffffd097          	auipc	ra,0xffffd
    80005228:	13c080e7          	jalr	316(ra) # 80002360 <_Znwm>
    8000522c:	00050493          	mv	s1,a0
    80005230:	00000593          	li	a1,0
    80005234:	ffffd097          	auipc	ra,0xffffd
    80005238:	34c080e7          	jalr	844(ra) # 80002580 <_ZN9SemaphoreC1Ej>
    8000523c:	00007797          	auipc	a5,0x7
    80005240:	9297b223          	sd	s1,-1756(a5) # 8000bb60 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005244:	00391793          	slli	a5,s2,0x3
    80005248:	00f78793          	addi	a5,a5,15
    8000524c:	ff07f793          	andi	a5,a5,-16
    80005250:	40f10133          	sub	sp,sp,a5
    80005254:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005258:	0019071b          	addiw	a4,s2,1
    8000525c:	00171793          	slli	a5,a4,0x1
    80005260:	00e787b3          	add	a5,a5,a4
    80005264:	00379793          	slli	a5,a5,0x3
    80005268:	00f78793          	addi	a5,a5,15
    8000526c:	ff07f793          	andi	a5,a5,-16
    80005270:	40f10133          	sub	sp,sp,a5
    80005274:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005278:	00191c13          	slli	s8,s2,0x1
    8000527c:	012c07b3          	add	a5,s8,s2
    80005280:	00379793          	slli	a5,a5,0x3
    80005284:	00fa07b3          	add	a5,s4,a5
    80005288:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000528c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005290:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005294:	02800513          	li	a0,40
    80005298:	ffffd097          	auipc	ra,0xffffd
    8000529c:	0c8080e7          	jalr	200(ra) # 80002360 <_Znwm>
    800052a0:	00050b13          	mv	s6,a0
    800052a4:	012c0c33          	add	s8,s8,s2
    800052a8:	003c1c13          	slli	s8,s8,0x3
    800052ac:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    800052b0:	ffffd097          	auipc	ra,0xffffd
    800052b4:	2a4080e7          	jalr	676(ra) # 80002554 <_ZN6ThreadC1Ev>
    800052b8:	00006797          	auipc	a5,0x6
    800052bc:	77878793          	addi	a5,a5,1912 # 8000ba30 <_ZTV12ConsumerSync+0x10>
    800052c0:	00fb3023          	sd	a5,0(s6)
    800052c4:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    800052c8:	000b0513          	mv	a0,s6
    800052cc:	ffffd097          	auipc	ra,0xffffd
    800052d0:	164080e7          	jalr	356(ra) # 80002430 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800052d4:	00000493          	li	s1,0
    800052d8:	0380006f          	j	80005310 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800052dc:	00006797          	auipc	a5,0x6
    800052e0:	72c78793          	addi	a5,a5,1836 # 8000ba08 <_ZTV12ProducerSync+0x10>
    800052e4:	00fcb023          	sd	a5,0(s9)
    800052e8:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800052ec:	00349793          	slli	a5,s1,0x3
    800052f0:	00f987b3          	add	a5,s3,a5
    800052f4:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800052f8:	00349793          	slli	a5,s1,0x3
    800052fc:	00f987b3          	add	a5,s3,a5
    80005300:	0007b503          	ld	a0,0(a5)
    80005304:	ffffd097          	auipc	ra,0xffffd
    80005308:	12c080e7          	jalr	300(ra) # 80002430 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000530c:	0014849b          	addiw	s1,s1,1
    80005310:	0b24d063          	bge	s1,s2,800053b0 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005314:	00149793          	slli	a5,s1,0x1
    80005318:	009787b3          	add	a5,a5,s1
    8000531c:	00379793          	slli	a5,a5,0x3
    80005320:	00fa07b3          	add	a5,s4,a5
    80005324:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005328:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    8000532c:	00007717          	auipc	a4,0x7
    80005330:	83473703          	ld	a4,-1996(a4) # 8000bb60 <_ZL10waitForAll>
    80005334:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005338:	02905863          	blez	s1,80005368 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    8000533c:	02800513          	li	a0,40
    80005340:	ffffd097          	auipc	ra,0xffffd
    80005344:	020080e7          	jalr	32(ra) # 80002360 <_Znwm>
    80005348:	00050c93          	mv	s9,a0
    8000534c:	00149c13          	slli	s8,s1,0x1
    80005350:	009c0c33          	add	s8,s8,s1
    80005354:	003c1c13          	slli	s8,s8,0x3
    80005358:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    8000535c:	ffffd097          	auipc	ra,0xffffd
    80005360:	1f8080e7          	jalr	504(ra) # 80002554 <_ZN6ThreadC1Ev>
    80005364:	f79ff06f          	j	800052dc <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005368:	02800513          	li	a0,40
    8000536c:	ffffd097          	auipc	ra,0xffffd
    80005370:	ff4080e7          	jalr	-12(ra) # 80002360 <_Znwm>
    80005374:	00050c93          	mv	s9,a0
    80005378:	00149c13          	slli	s8,s1,0x1
    8000537c:	009c0c33          	add	s8,s8,s1
    80005380:	003c1c13          	slli	s8,s8,0x3
    80005384:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005388:	ffffd097          	auipc	ra,0xffffd
    8000538c:	1cc080e7          	jalr	460(ra) # 80002554 <_ZN6ThreadC1Ev>
    80005390:	00006797          	auipc	a5,0x6
    80005394:	65078793          	addi	a5,a5,1616 # 8000b9e0 <_ZTV16ProducerKeyboard+0x10>
    80005398:	00fcb023          	sd	a5,0(s9)
    8000539c:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800053a0:	00349793          	slli	a5,s1,0x3
    800053a4:	00f987b3          	add	a5,s3,a5
    800053a8:	0197b023          	sd	s9,0(a5)
    800053ac:	f4dff06f          	j	800052f8 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    800053b0:	ffffd097          	auipc	ra,0xffffd
    800053b4:	100080e7          	jalr	256(ra) # 800024b0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800053b8:	00000493          	li	s1,0
    800053bc:	00994e63          	blt	s2,s1,800053d8 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    800053c0:	00006517          	auipc	a0,0x6
    800053c4:	7a053503          	ld	a0,1952(a0) # 8000bb60 <_ZL10waitForAll>
    800053c8:	ffffd097          	auipc	ra,0xffffd
    800053cc:	1f0080e7          	jalr	496(ra) # 800025b8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800053d0:	0014849b          	addiw	s1,s1,1
    800053d4:	fe9ff06f          	j	800053bc <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800053d8:	00000493          	li	s1,0
    800053dc:	0080006f          	j	800053e4 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800053e0:	0014849b          	addiw	s1,s1,1
    800053e4:	0324d263          	bge	s1,s2,80005408 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800053e8:	00349793          	slli	a5,s1,0x3
    800053ec:	00f987b3          	add	a5,s3,a5
    800053f0:	0007b503          	ld	a0,0(a5)
    800053f4:	fe0506e3          	beqz	a0,800053e0 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800053f8:	00053783          	ld	a5,0(a0)
    800053fc:	0087b783          	ld	a5,8(a5)
    80005400:	000780e7          	jalr	a5
    80005404:	fddff06f          	j	800053e0 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005408:	000b0a63          	beqz	s6,8000541c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    8000540c:	000b3783          	ld	a5,0(s6)
    80005410:	0087b783          	ld	a5,8(a5)
    80005414:	000b0513          	mv	a0,s6
    80005418:	000780e7          	jalr	a5
    delete waitForAll;
    8000541c:	00006517          	auipc	a0,0x6
    80005420:	74453503          	ld	a0,1860(a0) # 8000bb60 <_ZL10waitForAll>
    80005424:	00050863          	beqz	a0,80005434 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005428:	00053783          	ld	a5,0(a0)
    8000542c:	0087b783          	ld	a5,8(a5)
    80005430:	000780e7          	jalr	a5
    delete buffer;
    80005434:	000a8e63          	beqz	s5,80005450 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005438:	000a8513          	mv	a0,s5
    8000543c:	00001097          	auipc	ra,0x1
    80005440:	8a8080e7          	jalr	-1880(ra) # 80005ce4 <_ZN9BufferCPPD1Ev>
    80005444:	000a8513          	mv	a0,s5
    80005448:	ffffd097          	auipc	ra,0xffffd
    8000544c:	f40080e7          	jalr	-192(ra) # 80002388 <_ZdlPv>
    80005450:	000b8113          	mv	sp,s7

}
    80005454:	f8040113          	addi	sp,s0,-128
    80005458:	07813083          	ld	ra,120(sp)
    8000545c:	07013403          	ld	s0,112(sp)
    80005460:	06813483          	ld	s1,104(sp)
    80005464:	06013903          	ld	s2,96(sp)
    80005468:	05813983          	ld	s3,88(sp)
    8000546c:	05013a03          	ld	s4,80(sp)
    80005470:	04813a83          	ld	s5,72(sp)
    80005474:	04013b03          	ld	s6,64(sp)
    80005478:	03813b83          	ld	s7,56(sp)
    8000547c:	03013c03          	ld	s8,48(sp)
    80005480:	02813c83          	ld	s9,40(sp)
    80005484:	08010113          	addi	sp,sp,128
    80005488:	00008067          	ret
    8000548c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005490:	000a8513          	mv	a0,s5
    80005494:	ffffd097          	auipc	ra,0xffffd
    80005498:	ef4080e7          	jalr	-268(ra) # 80002388 <_ZdlPv>
    8000549c:	00048513          	mv	a0,s1
    800054a0:	00007097          	auipc	ra,0x7
    800054a4:	7a8080e7          	jalr	1960(ra) # 8000cc48 <_Unwind_Resume>
    800054a8:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    800054ac:	00048513          	mv	a0,s1
    800054b0:	ffffd097          	auipc	ra,0xffffd
    800054b4:	ed8080e7          	jalr	-296(ra) # 80002388 <_ZdlPv>
    800054b8:	00090513          	mv	a0,s2
    800054bc:	00007097          	auipc	ra,0x7
    800054c0:	78c080e7          	jalr	1932(ra) # 8000cc48 <_Unwind_Resume>
    800054c4:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    800054c8:	000b0513          	mv	a0,s6
    800054cc:	ffffd097          	auipc	ra,0xffffd
    800054d0:	ebc080e7          	jalr	-324(ra) # 80002388 <_ZdlPv>
    800054d4:	00048513          	mv	a0,s1
    800054d8:	00007097          	auipc	ra,0x7
    800054dc:	770080e7          	jalr	1904(ra) # 8000cc48 <_Unwind_Resume>
    800054e0:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800054e4:	000c8513          	mv	a0,s9
    800054e8:	ffffd097          	auipc	ra,0xffffd
    800054ec:	ea0080e7          	jalr	-352(ra) # 80002388 <_ZdlPv>
    800054f0:	00048513          	mv	a0,s1
    800054f4:	00007097          	auipc	ra,0x7
    800054f8:	754080e7          	jalr	1876(ra) # 8000cc48 <_Unwind_Resume>
    800054fc:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005500:	000c8513          	mv	a0,s9
    80005504:	ffffd097          	auipc	ra,0xffffd
    80005508:	e84080e7          	jalr	-380(ra) # 80002388 <_ZdlPv>
    8000550c:	00048513          	mv	a0,s1
    80005510:	00007097          	auipc	ra,0x7
    80005514:	738080e7          	jalr	1848(ra) # 8000cc48 <_Unwind_Resume>

0000000080005518 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005518:	ff010113          	addi	sp,sp,-16
    8000551c:	00113423          	sd	ra,8(sp)
    80005520:	00813023          	sd	s0,0(sp)
    80005524:	01010413          	addi	s0,sp,16
    80005528:	00006797          	auipc	a5,0x6
    8000552c:	50878793          	addi	a5,a5,1288 # 8000ba30 <_ZTV12ConsumerSync+0x10>
    80005530:	00f53023          	sd	a5,0(a0)
    80005534:	ffffd097          	auipc	ra,0xffffd
    80005538:	d84080e7          	jalr	-636(ra) # 800022b8 <_ZN6ThreadD1Ev>
    8000553c:	00813083          	ld	ra,8(sp)
    80005540:	00013403          	ld	s0,0(sp)
    80005544:	01010113          	addi	sp,sp,16
    80005548:	00008067          	ret

000000008000554c <_ZN12ConsumerSyncD0Ev>:
    8000554c:	fe010113          	addi	sp,sp,-32
    80005550:	00113c23          	sd	ra,24(sp)
    80005554:	00813823          	sd	s0,16(sp)
    80005558:	00913423          	sd	s1,8(sp)
    8000555c:	02010413          	addi	s0,sp,32
    80005560:	00050493          	mv	s1,a0
    80005564:	00006797          	auipc	a5,0x6
    80005568:	4cc78793          	addi	a5,a5,1228 # 8000ba30 <_ZTV12ConsumerSync+0x10>
    8000556c:	00f53023          	sd	a5,0(a0)
    80005570:	ffffd097          	auipc	ra,0xffffd
    80005574:	d48080e7          	jalr	-696(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80005578:	00048513          	mv	a0,s1
    8000557c:	ffffd097          	auipc	ra,0xffffd
    80005580:	e0c080e7          	jalr	-500(ra) # 80002388 <_ZdlPv>
    80005584:	01813083          	ld	ra,24(sp)
    80005588:	01013403          	ld	s0,16(sp)
    8000558c:	00813483          	ld	s1,8(sp)
    80005590:	02010113          	addi	sp,sp,32
    80005594:	00008067          	ret

0000000080005598 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005598:	ff010113          	addi	sp,sp,-16
    8000559c:	00113423          	sd	ra,8(sp)
    800055a0:	00813023          	sd	s0,0(sp)
    800055a4:	01010413          	addi	s0,sp,16
    800055a8:	00006797          	auipc	a5,0x6
    800055ac:	46078793          	addi	a5,a5,1120 # 8000ba08 <_ZTV12ProducerSync+0x10>
    800055b0:	00f53023          	sd	a5,0(a0)
    800055b4:	ffffd097          	auipc	ra,0xffffd
    800055b8:	d04080e7          	jalr	-764(ra) # 800022b8 <_ZN6ThreadD1Ev>
    800055bc:	00813083          	ld	ra,8(sp)
    800055c0:	00013403          	ld	s0,0(sp)
    800055c4:	01010113          	addi	sp,sp,16
    800055c8:	00008067          	ret

00000000800055cc <_ZN12ProducerSyncD0Ev>:
    800055cc:	fe010113          	addi	sp,sp,-32
    800055d0:	00113c23          	sd	ra,24(sp)
    800055d4:	00813823          	sd	s0,16(sp)
    800055d8:	00913423          	sd	s1,8(sp)
    800055dc:	02010413          	addi	s0,sp,32
    800055e0:	00050493          	mv	s1,a0
    800055e4:	00006797          	auipc	a5,0x6
    800055e8:	42478793          	addi	a5,a5,1060 # 8000ba08 <_ZTV12ProducerSync+0x10>
    800055ec:	00f53023          	sd	a5,0(a0)
    800055f0:	ffffd097          	auipc	ra,0xffffd
    800055f4:	cc8080e7          	jalr	-824(ra) # 800022b8 <_ZN6ThreadD1Ev>
    800055f8:	00048513          	mv	a0,s1
    800055fc:	ffffd097          	auipc	ra,0xffffd
    80005600:	d8c080e7          	jalr	-628(ra) # 80002388 <_ZdlPv>
    80005604:	01813083          	ld	ra,24(sp)
    80005608:	01013403          	ld	s0,16(sp)
    8000560c:	00813483          	ld	s1,8(sp)
    80005610:	02010113          	addi	sp,sp,32
    80005614:	00008067          	ret

0000000080005618 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005618:	ff010113          	addi	sp,sp,-16
    8000561c:	00113423          	sd	ra,8(sp)
    80005620:	00813023          	sd	s0,0(sp)
    80005624:	01010413          	addi	s0,sp,16
    80005628:	00006797          	auipc	a5,0x6
    8000562c:	3b878793          	addi	a5,a5,952 # 8000b9e0 <_ZTV16ProducerKeyboard+0x10>
    80005630:	00f53023          	sd	a5,0(a0)
    80005634:	ffffd097          	auipc	ra,0xffffd
    80005638:	c84080e7          	jalr	-892(ra) # 800022b8 <_ZN6ThreadD1Ev>
    8000563c:	00813083          	ld	ra,8(sp)
    80005640:	00013403          	ld	s0,0(sp)
    80005644:	01010113          	addi	sp,sp,16
    80005648:	00008067          	ret

000000008000564c <_ZN16ProducerKeyboardD0Ev>:
    8000564c:	fe010113          	addi	sp,sp,-32
    80005650:	00113c23          	sd	ra,24(sp)
    80005654:	00813823          	sd	s0,16(sp)
    80005658:	00913423          	sd	s1,8(sp)
    8000565c:	02010413          	addi	s0,sp,32
    80005660:	00050493          	mv	s1,a0
    80005664:	00006797          	auipc	a5,0x6
    80005668:	37c78793          	addi	a5,a5,892 # 8000b9e0 <_ZTV16ProducerKeyboard+0x10>
    8000566c:	00f53023          	sd	a5,0(a0)
    80005670:	ffffd097          	auipc	ra,0xffffd
    80005674:	c48080e7          	jalr	-952(ra) # 800022b8 <_ZN6ThreadD1Ev>
    80005678:	00048513          	mv	a0,s1
    8000567c:	ffffd097          	auipc	ra,0xffffd
    80005680:	d0c080e7          	jalr	-756(ra) # 80002388 <_ZdlPv>
    80005684:	01813083          	ld	ra,24(sp)
    80005688:	01013403          	ld	s0,16(sp)
    8000568c:	00813483          	ld	s1,8(sp)
    80005690:	02010113          	addi	sp,sp,32
    80005694:	00008067          	ret

0000000080005698 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005698:	ff010113          	addi	sp,sp,-16
    8000569c:	00113423          	sd	ra,8(sp)
    800056a0:	00813023          	sd	s0,0(sp)
    800056a4:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    800056a8:	02053583          	ld	a1,32(a0)
    800056ac:	fffff097          	auipc	ra,0xfffff
    800056b0:	7e4080e7          	jalr	2020(ra) # 80004e90 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800056b4:	00813083          	ld	ra,8(sp)
    800056b8:	00013403          	ld	s0,0(sp)
    800056bc:	01010113          	addi	sp,sp,16
    800056c0:	00008067          	ret

00000000800056c4 <_ZN12ProducerSync3runEv>:
    void run() override {
    800056c4:	ff010113          	addi	sp,sp,-16
    800056c8:	00113423          	sd	ra,8(sp)
    800056cc:	00813023          	sd	s0,0(sp)
    800056d0:	01010413          	addi	s0,sp,16
        producer(td);
    800056d4:	02053583          	ld	a1,32(a0)
    800056d8:	00000097          	auipc	ra,0x0
    800056dc:	878080e7          	jalr	-1928(ra) # 80004f50 <_ZN12ProducerSync8producerEPv>
    }
    800056e0:	00813083          	ld	ra,8(sp)
    800056e4:	00013403          	ld	s0,0(sp)
    800056e8:	01010113          	addi	sp,sp,16
    800056ec:	00008067          	ret

00000000800056f0 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800056f0:	ff010113          	addi	sp,sp,-16
    800056f4:	00113423          	sd	ra,8(sp)
    800056f8:	00813023          	sd	s0,0(sp)
    800056fc:	01010413          	addi	s0,sp,16
        consumer(td);
    80005700:	02053583          	ld	a1,32(a0)
    80005704:	00000097          	auipc	ra,0x0
    80005708:	8e0080e7          	jalr	-1824(ra) # 80004fe4 <_ZN12ConsumerSync8consumerEPv>
    }
    8000570c:	00813083          	ld	ra,8(sp)
    80005710:	00013403          	ld	s0,0(sp)
    80005714:	01010113          	addi	sp,sp,16
    80005718:	00008067          	ret

000000008000571c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000571c:	fe010113          	addi	sp,sp,-32
    80005720:	00113c23          	sd	ra,24(sp)
    80005724:	00813823          	sd	s0,16(sp)
    80005728:	00913423          	sd	s1,8(sp)
    8000572c:	02010413          	addi	s0,sp,32
    80005730:	00050493          	mv	s1,a0
    LOCK();
    80005734:	00100613          	li	a2,1
    80005738:	00000593          	li	a1,0
    8000573c:	00006517          	auipc	a0,0x6
    80005740:	42c50513          	addi	a0,a0,1068 # 8000bb68 <lockPrint>
    80005744:	ffffc097          	auipc	ra,0xffffc
    80005748:	be4080e7          	jalr	-1052(ra) # 80001328 <copy_and_swap>
    8000574c:	00050863          	beqz	a0,8000575c <_Z11printStringPKc+0x40>
    80005750:	ffffc097          	auipc	ra,0xffffc
    80005754:	cfc080e7          	jalr	-772(ra) # 8000144c <_Z15thread_dispatchv>
    80005758:	fddff06f          	j	80005734 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000575c:	0004c503          	lbu	a0,0(s1)
    80005760:	00050a63          	beqz	a0,80005774 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005764:	ffffc097          	auipc	ra,0xffffc
    80005768:	e34080e7          	jalr	-460(ra) # 80001598 <_Z4putcc>
        string++;
    8000576c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005770:	fedff06f          	j	8000575c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005774:	00000613          	li	a2,0
    80005778:	00100593          	li	a1,1
    8000577c:	00006517          	auipc	a0,0x6
    80005780:	3ec50513          	addi	a0,a0,1004 # 8000bb68 <lockPrint>
    80005784:	ffffc097          	auipc	ra,0xffffc
    80005788:	ba4080e7          	jalr	-1116(ra) # 80001328 <copy_and_swap>
    8000578c:	fe0514e3          	bnez	a0,80005774 <_Z11printStringPKc+0x58>
}
    80005790:	01813083          	ld	ra,24(sp)
    80005794:	01013403          	ld	s0,16(sp)
    80005798:	00813483          	ld	s1,8(sp)
    8000579c:	02010113          	addi	sp,sp,32
    800057a0:	00008067          	ret

00000000800057a4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800057a4:	fd010113          	addi	sp,sp,-48
    800057a8:	02113423          	sd	ra,40(sp)
    800057ac:	02813023          	sd	s0,32(sp)
    800057b0:	00913c23          	sd	s1,24(sp)
    800057b4:	01213823          	sd	s2,16(sp)
    800057b8:	01313423          	sd	s3,8(sp)
    800057bc:	01413023          	sd	s4,0(sp)
    800057c0:	03010413          	addi	s0,sp,48
    800057c4:	00050993          	mv	s3,a0
    800057c8:	00058a13          	mv	s4,a1
    LOCK();
    800057cc:	00100613          	li	a2,1
    800057d0:	00000593          	li	a1,0
    800057d4:	00006517          	auipc	a0,0x6
    800057d8:	39450513          	addi	a0,a0,916 # 8000bb68 <lockPrint>
    800057dc:	ffffc097          	auipc	ra,0xffffc
    800057e0:	b4c080e7          	jalr	-1204(ra) # 80001328 <copy_and_swap>
    800057e4:	00050863          	beqz	a0,800057f4 <_Z9getStringPci+0x50>
    800057e8:	ffffc097          	auipc	ra,0xffffc
    800057ec:	c64080e7          	jalr	-924(ra) # 8000144c <_Z15thread_dispatchv>
    800057f0:	fddff06f          	j	800057cc <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800057f4:	00000913          	li	s2,0
    800057f8:	00090493          	mv	s1,s2
    800057fc:	0019091b          	addiw	s2,s2,1
    80005800:	03495a63          	bge	s2,s4,80005834 <_Z9getStringPci+0x90>
        cc = getc();
    80005804:	ffffc097          	auipc	ra,0xffffc
    80005808:	d6c080e7          	jalr	-660(ra) # 80001570 <_Z4getcv>
        if(cc < 1)
    8000580c:	02050463          	beqz	a0,80005834 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005810:	009984b3          	add	s1,s3,s1
    80005814:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005818:	00a00793          	li	a5,10
    8000581c:	00f50a63          	beq	a0,a5,80005830 <_Z9getStringPci+0x8c>
    80005820:	00d00793          	li	a5,13
    80005824:	fcf51ae3          	bne	a0,a5,800057f8 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005828:	00090493          	mv	s1,s2
    8000582c:	0080006f          	j	80005834 <_Z9getStringPci+0x90>
    80005830:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005834:	009984b3          	add	s1,s3,s1
    80005838:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000583c:	00000613          	li	a2,0
    80005840:	00100593          	li	a1,1
    80005844:	00006517          	auipc	a0,0x6
    80005848:	32450513          	addi	a0,a0,804 # 8000bb68 <lockPrint>
    8000584c:	ffffc097          	auipc	ra,0xffffc
    80005850:	adc080e7          	jalr	-1316(ra) # 80001328 <copy_and_swap>
    80005854:	fe0514e3          	bnez	a0,8000583c <_Z9getStringPci+0x98>
    return buf;
}
    80005858:	00098513          	mv	a0,s3
    8000585c:	02813083          	ld	ra,40(sp)
    80005860:	02013403          	ld	s0,32(sp)
    80005864:	01813483          	ld	s1,24(sp)
    80005868:	01013903          	ld	s2,16(sp)
    8000586c:	00813983          	ld	s3,8(sp)
    80005870:	00013a03          	ld	s4,0(sp)
    80005874:	03010113          	addi	sp,sp,48
    80005878:	00008067          	ret

000000008000587c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    8000587c:	ff010113          	addi	sp,sp,-16
    80005880:	00813423          	sd	s0,8(sp)
    80005884:	01010413          	addi	s0,sp,16
    80005888:	00050693          	mv	a3,a0
    int n;

    n = 0;
    8000588c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005890:	0006c603          	lbu	a2,0(a3)
    80005894:	fd06071b          	addiw	a4,a2,-48
    80005898:	0ff77713          	andi	a4,a4,255
    8000589c:	00900793          	li	a5,9
    800058a0:	02e7e063          	bltu	a5,a4,800058c0 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800058a4:	0025179b          	slliw	a5,a0,0x2
    800058a8:	00a787bb          	addw	a5,a5,a0
    800058ac:	0017979b          	slliw	a5,a5,0x1
    800058b0:	00168693          	addi	a3,a3,1
    800058b4:	00c787bb          	addw	a5,a5,a2
    800058b8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800058bc:	fd5ff06f          	j	80005890 <_Z11stringToIntPKc+0x14>
    return n;
}
    800058c0:	00813403          	ld	s0,8(sp)
    800058c4:	01010113          	addi	sp,sp,16
    800058c8:	00008067          	ret

00000000800058cc <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800058cc:	fc010113          	addi	sp,sp,-64
    800058d0:	02113c23          	sd	ra,56(sp)
    800058d4:	02813823          	sd	s0,48(sp)
    800058d8:	02913423          	sd	s1,40(sp)
    800058dc:	03213023          	sd	s2,32(sp)
    800058e0:	01313c23          	sd	s3,24(sp)
    800058e4:	04010413          	addi	s0,sp,64
    800058e8:	00050493          	mv	s1,a0
    800058ec:	00058913          	mv	s2,a1
    800058f0:	00060993          	mv	s3,a2
    LOCK();
    800058f4:	00100613          	li	a2,1
    800058f8:	00000593          	li	a1,0
    800058fc:	00006517          	auipc	a0,0x6
    80005900:	26c50513          	addi	a0,a0,620 # 8000bb68 <lockPrint>
    80005904:	ffffc097          	auipc	ra,0xffffc
    80005908:	a24080e7          	jalr	-1500(ra) # 80001328 <copy_and_swap>
    8000590c:	00050863          	beqz	a0,8000591c <_Z8printIntiii+0x50>
    80005910:	ffffc097          	auipc	ra,0xffffc
    80005914:	b3c080e7          	jalr	-1220(ra) # 8000144c <_Z15thread_dispatchv>
    80005918:	fddff06f          	j	800058f4 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000591c:	00098463          	beqz	s3,80005924 <_Z8printIntiii+0x58>
    80005920:	0804c463          	bltz	s1,800059a8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005924:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005928:	00000593          	li	a1,0
    }

    i = 0;
    8000592c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005930:	0009079b          	sext.w	a5,s2
    80005934:	0325773b          	remuw	a4,a0,s2
    80005938:	00048613          	mv	a2,s1
    8000593c:	0014849b          	addiw	s1,s1,1
    80005940:	02071693          	slli	a3,a4,0x20
    80005944:	0206d693          	srli	a3,a3,0x20
    80005948:	00006717          	auipc	a4,0x6
    8000594c:	10070713          	addi	a4,a4,256 # 8000ba48 <digits>
    80005950:	00d70733          	add	a4,a4,a3
    80005954:	00074683          	lbu	a3,0(a4)
    80005958:	fd040713          	addi	a4,s0,-48
    8000595c:	00c70733          	add	a4,a4,a2
    80005960:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005964:	0005071b          	sext.w	a4,a0
    80005968:	0325553b          	divuw	a0,a0,s2
    8000596c:	fcf772e3          	bgeu	a4,a5,80005930 <_Z8printIntiii+0x64>
    if(neg)
    80005970:	00058c63          	beqz	a1,80005988 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005974:	fd040793          	addi	a5,s0,-48
    80005978:	009784b3          	add	s1,a5,s1
    8000597c:	02d00793          	li	a5,45
    80005980:	fef48823          	sb	a5,-16(s1)
    80005984:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005988:	fff4849b          	addiw	s1,s1,-1
    8000598c:	0204c463          	bltz	s1,800059b4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005990:	fd040793          	addi	a5,s0,-48
    80005994:	009787b3          	add	a5,a5,s1
    80005998:	ff07c503          	lbu	a0,-16(a5)
    8000599c:	ffffc097          	auipc	ra,0xffffc
    800059a0:	bfc080e7          	jalr	-1028(ra) # 80001598 <_Z4putcc>
    800059a4:	fe5ff06f          	j	80005988 <_Z8printIntiii+0xbc>
        x = -xx;
    800059a8:	4090053b          	negw	a0,s1
        neg = 1;
    800059ac:	00100593          	li	a1,1
        x = -xx;
    800059b0:	f7dff06f          	j	8000592c <_Z8printIntiii+0x60>

    UNLOCK();
    800059b4:	00000613          	li	a2,0
    800059b8:	00100593          	li	a1,1
    800059bc:	00006517          	auipc	a0,0x6
    800059c0:	1ac50513          	addi	a0,a0,428 # 8000bb68 <lockPrint>
    800059c4:	ffffc097          	auipc	ra,0xffffc
    800059c8:	964080e7          	jalr	-1692(ra) # 80001328 <copy_and_swap>
    800059cc:	fe0514e3          	bnez	a0,800059b4 <_Z8printIntiii+0xe8>
    800059d0:	03813083          	ld	ra,56(sp)
    800059d4:	03013403          	ld	s0,48(sp)
    800059d8:	02813483          	ld	s1,40(sp)
    800059dc:	02013903          	ld	s2,32(sp)
    800059e0:	01813983          	ld	s3,24(sp)
    800059e4:	04010113          	addi	sp,sp,64
    800059e8:	00008067          	ret

00000000800059ec <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800059ec:	fd010113          	addi	sp,sp,-48
    800059f0:	02113423          	sd	ra,40(sp)
    800059f4:	02813023          	sd	s0,32(sp)
    800059f8:	00913c23          	sd	s1,24(sp)
    800059fc:	01213823          	sd	s2,16(sp)
    80005a00:	01313423          	sd	s3,8(sp)
    80005a04:	03010413          	addi	s0,sp,48
    80005a08:	00050493          	mv	s1,a0
    80005a0c:	00058913          	mv	s2,a1
    80005a10:	0015879b          	addiw	a5,a1,1
    80005a14:	0007851b          	sext.w	a0,a5
    80005a18:	00f4a023          	sw	a5,0(s1)
    80005a1c:	0004a823          	sw	zero,16(s1)
    80005a20:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005a24:	00251513          	slli	a0,a0,0x2
    80005a28:	ffffc097          	auipc	ra,0xffffc
    80005a2c:	920080e7          	jalr	-1760(ra) # 80001348 <_Z9mem_allocm>
    80005a30:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005a34:	01000513          	li	a0,16
    80005a38:	ffffd097          	auipc	ra,0xffffd
    80005a3c:	928080e7          	jalr	-1752(ra) # 80002360 <_Znwm>
    80005a40:	00050993          	mv	s3,a0
    80005a44:	00000593          	li	a1,0
    80005a48:	ffffd097          	auipc	ra,0xffffd
    80005a4c:	b38080e7          	jalr	-1224(ra) # 80002580 <_ZN9SemaphoreC1Ej>
    80005a50:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005a54:	01000513          	li	a0,16
    80005a58:	ffffd097          	auipc	ra,0xffffd
    80005a5c:	908080e7          	jalr	-1784(ra) # 80002360 <_Znwm>
    80005a60:	00050993          	mv	s3,a0
    80005a64:	00090593          	mv	a1,s2
    80005a68:	ffffd097          	auipc	ra,0xffffd
    80005a6c:	b18080e7          	jalr	-1256(ra) # 80002580 <_ZN9SemaphoreC1Ej>
    80005a70:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005a74:	01000513          	li	a0,16
    80005a78:	ffffd097          	auipc	ra,0xffffd
    80005a7c:	8e8080e7          	jalr	-1816(ra) # 80002360 <_Znwm>
    80005a80:	00050913          	mv	s2,a0
    80005a84:	00100593          	li	a1,1
    80005a88:	ffffd097          	auipc	ra,0xffffd
    80005a8c:	af8080e7          	jalr	-1288(ra) # 80002580 <_ZN9SemaphoreC1Ej>
    80005a90:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005a94:	01000513          	li	a0,16
    80005a98:	ffffd097          	auipc	ra,0xffffd
    80005a9c:	8c8080e7          	jalr	-1848(ra) # 80002360 <_Znwm>
    80005aa0:	00050913          	mv	s2,a0
    80005aa4:	00100593          	li	a1,1
    80005aa8:	ffffd097          	auipc	ra,0xffffd
    80005aac:	ad8080e7          	jalr	-1320(ra) # 80002580 <_ZN9SemaphoreC1Ej>
    80005ab0:	0324b823          	sd	s2,48(s1)
}
    80005ab4:	02813083          	ld	ra,40(sp)
    80005ab8:	02013403          	ld	s0,32(sp)
    80005abc:	01813483          	ld	s1,24(sp)
    80005ac0:	01013903          	ld	s2,16(sp)
    80005ac4:	00813983          	ld	s3,8(sp)
    80005ac8:	03010113          	addi	sp,sp,48
    80005acc:	00008067          	ret
    80005ad0:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005ad4:	00098513          	mv	a0,s3
    80005ad8:	ffffd097          	auipc	ra,0xffffd
    80005adc:	8b0080e7          	jalr	-1872(ra) # 80002388 <_ZdlPv>
    80005ae0:	00048513          	mv	a0,s1
    80005ae4:	00007097          	auipc	ra,0x7
    80005ae8:	164080e7          	jalr	356(ra) # 8000cc48 <_Unwind_Resume>
    80005aec:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005af0:	00098513          	mv	a0,s3
    80005af4:	ffffd097          	auipc	ra,0xffffd
    80005af8:	894080e7          	jalr	-1900(ra) # 80002388 <_ZdlPv>
    80005afc:	00048513          	mv	a0,s1
    80005b00:	00007097          	auipc	ra,0x7
    80005b04:	148080e7          	jalr	328(ra) # 8000cc48 <_Unwind_Resume>
    80005b08:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005b0c:	00090513          	mv	a0,s2
    80005b10:	ffffd097          	auipc	ra,0xffffd
    80005b14:	878080e7          	jalr	-1928(ra) # 80002388 <_ZdlPv>
    80005b18:	00048513          	mv	a0,s1
    80005b1c:	00007097          	auipc	ra,0x7
    80005b20:	12c080e7          	jalr	300(ra) # 8000cc48 <_Unwind_Resume>
    80005b24:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005b28:	00090513          	mv	a0,s2
    80005b2c:	ffffd097          	auipc	ra,0xffffd
    80005b30:	85c080e7          	jalr	-1956(ra) # 80002388 <_ZdlPv>
    80005b34:	00048513          	mv	a0,s1
    80005b38:	00007097          	auipc	ra,0x7
    80005b3c:	110080e7          	jalr	272(ra) # 8000cc48 <_Unwind_Resume>

0000000080005b40 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005b40:	fe010113          	addi	sp,sp,-32
    80005b44:	00113c23          	sd	ra,24(sp)
    80005b48:	00813823          	sd	s0,16(sp)
    80005b4c:	00913423          	sd	s1,8(sp)
    80005b50:	01213023          	sd	s2,0(sp)
    80005b54:	02010413          	addi	s0,sp,32
    80005b58:	00050493          	mv	s1,a0
    80005b5c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005b60:	01853503          	ld	a0,24(a0)
    80005b64:	ffffd097          	auipc	ra,0xffffd
    80005b68:	a54080e7          	jalr	-1452(ra) # 800025b8 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005b6c:	0304b503          	ld	a0,48(s1)
    80005b70:	ffffd097          	auipc	ra,0xffffd
    80005b74:	a48080e7          	jalr	-1464(ra) # 800025b8 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005b78:	0084b783          	ld	a5,8(s1)
    80005b7c:	0144a703          	lw	a4,20(s1)
    80005b80:	00271713          	slli	a4,a4,0x2
    80005b84:	00e787b3          	add	a5,a5,a4
    80005b88:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005b8c:	0144a783          	lw	a5,20(s1)
    80005b90:	0017879b          	addiw	a5,a5,1
    80005b94:	0004a703          	lw	a4,0(s1)
    80005b98:	02e7e7bb          	remw	a5,a5,a4
    80005b9c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005ba0:	0304b503          	ld	a0,48(s1)
    80005ba4:	ffffd097          	auipc	ra,0xffffd
    80005ba8:	a40080e7          	jalr	-1472(ra) # 800025e4 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005bac:	0204b503          	ld	a0,32(s1)
    80005bb0:	ffffd097          	auipc	ra,0xffffd
    80005bb4:	a34080e7          	jalr	-1484(ra) # 800025e4 <_ZN9Semaphore6signalEv>

}
    80005bb8:	01813083          	ld	ra,24(sp)
    80005bbc:	01013403          	ld	s0,16(sp)
    80005bc0:	00813483          	ld	s1,8(sp)
    80005bc4:	00013903          	ld	s2,0(sp)
    80005bc8:	02010113          	addi	sp,sp,32
    80005bcc:	00008067          	ret

0000000080005bd0 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005bd0:	fe010113          	addi	sp,sp,-32
    80005bd4:	00113c23          	sd	ra,24(sp)
    80005bd8:	00813823          	sd	s0,16(sp)
    80005bdc:	00913423          	sd	s1,8(sp)
    80005be0:	01213023          	sd	s2,0(sp)
    80005be4:	02010413          	addi	s0,sp,32
    80005be8:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005bec:	02053503          	ld	a0,32(a0)
    80005bf0:	ffffd097          	auipc	ra,0xffffd
    80005bf4:	9c8080e7          	jalr	-1592(ra) # 800025b8 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005bf8:	0284b503          	ld	a0,40(s1)
    80005bfc:	ffffd097          	auipc	ra,0xffffd
    80005c00:	9bc080e7          	jalr	-1604(ra) # 800025b8 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005c04:	0084b703          	ld	a4,8(s1)
    80005c08:	0104a783          	lw	a5,16(s1)
    80005c0c:	00279693          	slli	a3,a5,0x2
    80005c10:	00d70733          	add	a4,a4,a3
    80005c14:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005c18:	0017879b          	addiw	a5,a5,1
    80005c1c:	0004a703          	lw	a4,0(s1)
    80005c20:	02e7e7bb          	remw	a5,a5,a4
    80005c24:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005c28:	0284b503          	ld	a0,40(s1)
    80005c2c:	ffffd097          	auipc	ra,0xffffd
    80005c30:	9b8080e7          	jalr	-1608(ra) # 800025e4 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005c34:	0184b503          	ld	a0,24(s1)
    80005c38:	ffffd097          	auipc	ra,0xffffd
    80005c3c:	9ac080e7          	jalr	-1620(ra) # 800025e4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005c40:	00090513          	mv	a0,s2
    80005c44:	01813083          	ld	ra,24(sp)
    80005c48:	01013403          	ld	s0,16(sp)
    80005c4c:	00813483          	ld	s1,8(sp)
    80005c50:	00013903          	ld	s2,0(sp)
    80005c54:	02010113          	addi	sp,sp,32
    80005c58:	00008067          	ret

0000000080005c5c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005c5c:	fe010113          	addi	sp,sp,-32
    80005c60:	00113c23          	sd	ra,24(sp)
    80005c64:	00813823          	sd	s0,16(sp)
    80005c68:	00913423          	sd	s1,8(sp)
    80005c6c:	01213023          	sd	s2,0(sp)
    80005c70:	02010413          	addi	s0,sp,32
    80005c74:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005c78:	02853503          	ld	a0,40(a0)
    80005c7c:	ffffd097          	auipc	ra,0xffffd
    80005c80:	93c080e7          	jalr	-1732(ra) # 800025b8 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005c84:	0304b503          	ld	a0,48(s1)
    80005c88:	ffffd097          	auipc	ra,0xffffd
    80005c8c:	930080e7          	jalr	-1744(ra) # 800025b8 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005c90:	0144a783          	lw	a5,20(s1)
    80005c94:	0104a903          	lw	s2,16(s1)
    80005c98:	0327ce63          	blt	a5,s2,80005cd4 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005c9c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005ca0:	0304b503          	ld	a0,48(s1)
    80005ca4:	ffffd097          	auipc	ra,0xffffd
    80005ca8:	940080e7          	jalr	-1728(ra) # 800025e4 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005cac:	0284b503          	ld	a0,40(s1)
    80005cb0:	ffffd097          	auipc	ra,0xffffd
    80005cb4:	934080e7          	jalr	-1740(ra) # 800025e4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005cb8:	00090513          	mv	a0,s2
    80005cbc:	01813083          	ld	ra,24(sp)
    80005cc0:	01013403          	ld	s0,16(sp)
    80005cc4:	00813483          	ld	s1,8(sp)
    80005cc8:	00013903          	ld	s2,0(sp)
    80005ccc:	02010113          	addi	sp,sp,32
    80005cd0:	00008067          	ret
        ret = cap - head + tail;
    80005cd4:	0004a703          	lw	a4,0(s1)
    80005cd8:	4127093b          	subw	s2,a4,s2
    80005cdc:	00f9093b          	addw	s2,s2,a5
    80005ce0:	fc1ff06f          	j	80005ca0 <_ZN9BufferCPP6getCntEv+0x44>

0000000080005ce4 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005ce4:	fe010113          	addi	sp,sp,-32
    80005ce8:	00113c23          	sd	ra,24(sp)
    80005cec:	00813823          	sd	s0,16(sp)
    80005cf0:	00913423          	sd	s1,8(sp)
    80005cf4:	02010413          	addi	s0,sp,32
    80005cf8:	00050493          	mv	s1,a0
    Console::putc('\n');
    80005cfc:	00a00513          	li	a0,10
    80005d00:	ffffd097          	auipc	ra,0xffffd
    80005d04:	954080e7          	jalr	-1708(ra) # 80002654 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005d08:	00004517          	auipc	a0,0x4
    80005d0c:	88050513          	addi	a0,a0,-1920 # 80009588 <CONSOLE_STATUS+0x578>
    80005d10:	00000097          	auipc	ra,0x0
    80005d14:	a0c080e7          	jalr	-1524(ra) # 8000571c <_Z11printStringPKc>
    while (getCnt()) {
    80005d18:	00048513          	mv	a0,s1
    80005d1c:	00000097          	auipc	ra,0x0
    80005d20:	f40080e7          	jalr	-192(ra) # 80005c5c <_ZN9BufferCPP6getCntEv>
    80005d24:	02050c63          	beqz	a0,80005d5c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005d28:	0084b783          	ld	a5,8(s1)
    80005d2c:	0104a703          	lw	a4,16(s1)
    80005d30:	00271713          	slli	a4,a4,0x2
    80005d34:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005d38:	0007c503          	lbu	a0,0(a5)
    80005d3c:	ffffd097          	auipc	ra,0xffffd
    80005d40:	918080e7          	jalr	-1768(ra) # 80002654 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005d44:	0104a783          	lw	a5,16(s1)
    80005d48:	0017879b          	addiw	a5,a5,1
    80005d4c:	0004a703          	lw	a4,0(s1)
    80005d50:	02e7e7bb          	remw	a5,a5,a4
    80005d54:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005d58:	fc1ff06f          	j	80005d18 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005d5c:	02100513          	li	a0,33
    80005d60:	ffffd097          	auipc	ra,0xffffd
    80005d64:	8f4080e7          	jalr	-1804(ra) # 80002654 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005d68:	00a00513          	li	a0,10
    80005d6c:	ffffd097          	auipc	ra,0xffffd
    80005d70:	8e8080e7          	jalr	-1816(ra) # 80002654 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005d74:	0084b503          	ld	a0,8(s1)
    80005d78:	ffffb097          	auipc	ra,0xffffb
    80005d7c:	5f8080e7          	jalr	1528(ra) # 80001370 <_Z8mem_freePv>
    delete itemAvailable;
    80005d80:	0204b503          	ld	a0,32(s1)
    80005d84:	00050863          	beqz	a0,80005d94 <_ZN9BufferCPPD1Ev+0xb0>
    80005d88:	00053783          	ld	a5,0(a0)
    80005d8c:	0087b783          	ld	a5,8(a5)
    80005d90:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005d94:	0184b503          	ld	a0,24(s1)
    80005d98:	00050863          	beqz	a0,80005da8 <_ZN9BufferCPPD1Ev+0xc4>
    80005d9c:	00053783          	ld	a5,0(a0)
    80005da0:	0087b783          	ld	a5,8(a5)
    80005da4:	000780e7          	jalr	a5
    delete mutexTail;
    80005da8:	0304b503          	ld	a0,48(s1)
    80005dac:	00050863          	beqz	a0,80005dbc <_ZN9BufferCPPD1Ev+0xd8>
    80005db0:	00053783          	ld	a5,0(a0)
    80005db4:	0087b783          	ld	a5,8(a5)
    80005db8:	000780e7          	jalr	a5
    delete mutexHead;
    80005dbc:	0284b503          	ld	a0,40(s1)
    80005dc0:	00050863          	beqz	a0,80005dd0 <_ZN9BufferCPPD1Ev+0xec>
    80005dc4:	00053783          	ld	a5,0(a0)
    80005dc8:	0087b783          	ld	a5,8(a5)
    80005dcc:	000780e7          	jalr	a5
}
    80005dd0:	01813083          	ld	ra,24(sp)
    80005dd4:	01013403          	ld	s0,16(sp)
    80005dd8:	00813483          	ld	s1,8(sp)
    80005ddc:	02010113          	addi	sp,sp,32
    80005de0:	00008067          	ret

0000000080005de4 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80005de4:	fe010113          	addi	sp,sp,-32
    80005de8:	00113c23          	sd	ra,24(sp)
    80005dec:	00813823          	sd	s0,16(sp)
    80005df0:	00913423          	sd	s1,8(sp)
    80005df4:	01213023          	sd	s2,0(sp)
    80005df8:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80005dfc:	00053903          	ld	s2,0(a0)
    int i = 6;
    80005e00:	00600493          	li	s1,6
    while (--i > 0) {
    80005e04:	fff4849b          	addiw	s1,s1,-1
    80005e08:	04905463          	blez	s1,80005e50 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80005e0c:	00003517          	auipc	a0,0x3
    80005e10:	79450513          	addi	a0,a0,1940 # 800095a0 <CONSOLE_STATUS+0x590>
    80005e14:	00000097          	auipc	ra,0x0
    80005e18:	908080e7          	jalr	-1784(ra) # 8000571c <_Z11printStringPKc>
        printInt(sleep_time);
    80005e1c:	00000613          	li	a2,0
    80005e20:	00a00593          	li	a1,10
    80005e24:	0009051b          	sext.w	a0,s2
    80005e28:	00000097          	auipc	ra,0x0
    80005e2c:	aa4080e7          	jalr	-1372(ra) # 800058cc <_Z8printIntiii>
        printString(" !\n");
    80005e30:	00003517          	auipc	a0,0x3
    80005e34:	77850513          	addi	a0,a0,1912 # 800095a8 <CONSOLE_STATUS+0x598>
    80005e38:	00000097          	auipc	ra,0x0
    80005e3c:	8e4080e7          	jalr	-1820(ra) # 8000571c <_Z11printStringPKc>
        time_sleep(sleep_time);
    80005e40:	00090513          	mv	a0,s2
    80005e44:	ffffb097          	auipc	ra,0xffffb
    80005e48:	700080e7          	jalr	1792(ra) # 80001544 <_Z10time_sleepm>
    while (--i > 0) {
    80005e4c:	fb9ff06f          	j	80005e04 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80005e50:	00a00793          	li	a5,10
    80005e54:	02f95933          	divu	s2,s2,a5
    80005e58:	fff90913          	addi	s2,s2,-1
    80005e5c:	00006797          	auipc	a5,0x6
    80005e60:	d1478793          	addi	a5,a5,-748 # 8000bb70 <_ZL8finished>
    80005e64:	01278933          	add	s2,a5,s2
    80005e68:	00100793          	li	a5,1
    80005e6c:	00f90023          	sb	a5,0(s2)
}
    80005e70:	01813083          	ld	ra,24(sp)
    80005e74:	01013403          	ld	s0,16(sp)
    80005e78:	00813483          	ld	s1,8(sp)
    80005e7c:	00013903          	ld	s2,0(sp)
    80005e80:	02010113          	addi	sp,sp,32
    80005e84:	00008067          	ret

0000000080005e88 <_Z12testSleepingv>:

void testSleeping() {
    80005e88:	fc010113          	addi	sp,sp,-64
    80005e8c:	02113c23          	sd	ra,56(sp)
    80005e90:	02813823          	sd	s0,48(sp)
    80005e94:	02913423          	sd	s1,40(sp)
    80005e98:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80005e9c:	00a00793          	li	a5,10
    80005ea0:	fcf43823          	sd	a5,-48(s0)
    80005ea4:	01400793          	li	a5,20
    80005ea8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80005eac:	00000493          	li	s1,0
    80005eb0:	02c0006f          	j	80005edc <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005eb4:	00349793          	slli	a5,s1,0x3
    80005eb8:	fd040613          	addi	a2,s0,-48
    80005ebc:	00f60633          	add	a2,a2,a5
    80005ec0:	00000597          	auipc	a1,0x0
    80005ec4:	f2458593          	addi	a1,a1,-220 # 80005de4 <_ZL9sleepyRunPv>
    80005ec8:	fc040513          	addi	a0,s0,-64
    80005ecc:	00f50533          	add	a0,a0,a5
    80005ed0:	ffffb097          	auipc	ra,0xffffb
    80005ed4:	4cc080e7          	jalr	1228(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80005ed8:	0014849b          	addiw	s1,s1,1
    80005edc:	00100793          	li	a5,1
    80005ee0:	fc97dae3          	bge	a5,s1,80005eb4 <_Z12testSleepingv+0x2c>
    }
    while (!(finished[0] && finished[1])) {}
    80005ee4:	00006797          	auipc	a5,0x6
    80005ee8:	c8c7c783          	lbu	a5,-884(a5) # 8000bb70 <_ZL8finished>
    80005eec:	fe078ce3          	beqz	a5,80005ee4 <_Z12testSleepingv+0x5c>
    80005ef0:	00006797          	auipc	a5,0x6
    80005ef4:	c817c783          	lbu	a5,-895(a5) # 8000bb71 <_ZL8finished+0x1>
    80005ef8:	fe0786e3          	beqz	a5,80005ee4 <_Z12testSleepingv+0x5c>
}
    80005efc:	03813083          	ld	ra,56(sp)
    80005f00:	03013403          	ld	s0,48(sp)
    80005f04:	02813483          	ld	s1,40(sp)
    80005f08:	04010113          	addi	sp,sp,64
    80005f0c:	00008067          	ret

0000000080005f10 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005f10:	fe010113          	addi	sp,sp,-32
    80005f14:	00113c23          	sd	ra,24(sp)
    80005f18:	00813823          	sd	s0,16(sp)
    80005f1c:	00913423          	sd	s1,8(sp)
    80005f20:	01213023          	sd	s2,0(sp)
    80005f24:	02010413          	addi	s0,sp,32
    80005f28:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005f2c:	00100793          	li	a5,1
    80005f30:	02a7f863          	bgeu	a5,a0,80005f60 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005f34:	00a00793          	li	a5,10
    80005f38:	02f577b3          	remu	a5,a0,a5
    80005f3c:	02078e63          	beqz	a5,80005f78 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005f40:	fff48513          	addi	a0,s1,-1
    80005f44:	00000097          	auipc	ra,0x0
    80005f48:	fcc080e7          	jalr	-52(ra) # 80005f10 <_ZL9fibonaccim>
    80005f4c:	00050913          	mv	s2,a0
    80005f50:	ffe48513          	addi	a0,s1,-2
    80005f54:	00000097          	auipc	ra,0x0
    80005f58:	fbc080e7          	jalr	-68(ra) # 80005f10 <_ZL9fibonaccim>
    80005f5c:	00a90533          	add	a0,s2,a0
}
    80005f60:	01813083          	ld	ra,24(sp)
    80005f64:	01013403          	ld	s0,16(sp)
    80005f68:	00813483          	ld	s1,8(sp)
    80005f6c:	00013903          	ld	s2,0(sp)
    80005f70:	02010113          	addi	sp,sp,32
    80005f74:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005f78:	ffffb097          	auipc	ra,0xffffb
    80005f7c:	4d4080e7          	jalr	1236(ra) # 8000144c <_Z15thread_dispatchv>
    80005f80:	fc1ff06f          	j	80005f40 <_ZL9fibonaccim+0x30>

0000000080005f84 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005f84:	fe010113          	addi	sp,sp,-32
    80005f88:	00113c23          	sd	ra,24(sp)
    80005f8c:	00813823          	sd	s0,16(sp)
    80005f90:	00913423          	sd	s1,8(sp)
    80005f94:	01213023          	sd	s2,0(sp)
    80005f98:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005f9c:	00a00493          	li	s1,10
    80005fa0:	0400006f          	j	80005fe0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005fa4:	00003517          	auipc	a0,0x3
    80005fa8:	54c50513          	addi	a0,a0,1356 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80005fac:	fffff097          	auipc	ra,0xfffff
    80005fb0:	770080e7          	jalr	1904(ra) # 8000571c <_Z11printStringPKc>
    80005fb4:	00000613          	li	a2,0
    80005fb8:	00a00593          	li	a1,10
    80005fbc:	00048513          	mv	a0,s1
    80005fc0:	00000097          	auipc	ra,0x0
    80005fc4:	90c080e7          	jalr	-1780(ra) # 800058cc <_Z8printIntiii>
    80005fc8:	00003517          	auipc	a0,0x3
    80005fcc:	19850513          	addi	a0,a0,408 # 80009160 <CONSOLE_STATUS+0x150>
    80005fd0:	fffff097          	auipc	ra,0xfffff
    80005fd4:	74c080e7          	jalr	1868(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005fd8:	0014849b          	addiw	s1,s1,1
    80005fdc:	0ff4f493          	andi	s1,s1,255
    80005fe0:	00c00793          	li	a5,12
    80005fe4:	fc97f0e3          	bgeu	a5,s1,80005fa4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005fe8:	00003517          	auipc	a0,0x3
    80005fec:	51050513          	addi	a0,a0,1296 # 800094f8 <CONSOLE_STATUS+0x4e8>
    80005ff0:	fffff097          	auipc	ra,0xfffff
    80005ff4:	72c080e7          	jalr	1836(ra) # 8000571c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005ff8:	00500313          	li	t1,5
    thread_dispatch();
    80005ffc:	ffffb097          	auipc	ra,0xffffb
    80006000:	450080e7          	jalr	1104(ra) # 8000144c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006004:	01000513          	li	a0,16
    80006008:	00000097          	auipc	ra,0x0
    8000600c:	f08080e7          	jalr	-248(ra) # 80005f10 <_ZL9fibonaccim>
    80006010:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006014:	00003517          	auipc	a0,0x3
    80006018:	4f450513          	addi	a0,a0,1268 # 80009508 <CONSOLE_STATUS+0x4f8>
    8000601c:	fffff097          	auipc	ra,0xfffff
    80006020:	700080e7          	jalr	1792(ra) # 8000571c <_Z11printStringPKc>
    80006024:	00000613          	li	a2,0
    80006028:	00a00593          	li	a1,10
    8000602c:	0009051b          	sext.w	a0,s2
    80006030:	00000097          	auipc	ra,0x0
    80006034:	89c080e7          	jalr	-1892(ra) # 800058cc <_Z8printIntiii>
    80006038:	00003517          	auipc	a0,0x3
    8000603c:	12850513          	addi	a0,a0,296 # 80009160 <CONSOLE_STATUS+0x150>
    80006040:	fffff097          	auipc	ra,0xfffff
    80006044:	6dc080e7          	jalr	1756(ra) # 8000571c <_Z11printStringPKc>
    80006048:	0400006f          	j	80006088 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000604c:	00003517          	auipc	a0,0x3
    80006050:	4a450513          	addi	a0,a0,1188 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80006054:	fffff097          	auipc	ra,0xfffff
    80006058:	6c8080e7          	jalr	1736(ra) # 8000571c <_Z11printStringPKc>
    8000605c:	00000613          	li	a2,0
    80006060:	00a00593          	li	a1,10
    80006064:	00048513          	mv	a0,s1
    80006068:	00000097          	auipc	ra,0x0
    8000606c:	864080e7          	jalr	-1948(ra) # 800058cc <_Z8printIntiii>
    80006070:	00003517          	auipc	a0,0x3
    80006074:	0f050513          	addi	a0,a0,240 # 80009160 <CONSOLE_STATUS+0x150>
    80006078:	fffff097          	auipc	ra,0xfffff
    8000607c:	6a4080e7          	jalr	1700(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006080:	0014849b          	addiw	s1,s1,1
    80006084:	0ff4f493          	andi	s1,s1,255
    80006088:	00f00793          	li	a5,15
    8000608c:	fc97f0e3          	bgeu	a5,s1,8000604c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006090:	00003517          	auipc	a0,0x3
    80006094:	48850513          	addi	a0,a0,1160 # 80009518 <CONSOLE_STATUS+0x508>
    80006098:	fffff097          	auipc	ra,0xfffff
    8000609c:	684080e7          	jalr	1668(ra) # 8000571c <_Z11printStringPKc>
    finishedD = true;
    800060a0:	00100793          	li	a5,1
    800060a4:	00006717          	auipc	a4,0x6
    800060a8:	acf70723          	sb	a5,-1330(a4) # 8000bb72 <_ZL9finishedD>
    thread_dispatch();
    800060ac:	ffffb097          	auipc	ra,0xffffb
    800060b0:	3a0080e7          	jalr	928(ra) # 8000144c <_Z15thread_dispatchv>
}
    800060b4:	01813083          	ld	ra,24(sp)
    800060b8:	01013403          	ld	s0,16(sp)
    800060bc:	00813483          	ld	s1,8(sp)
    800060c0:	00013903          	ld	s2,0(sp)
    800060c4:	02010113          	addi	sp,sp,32
    800060c8:	00008067          	ret

00000000800060cc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800060cc:	fe010113          	addi	sp,sp,-32
    800060d0:	00113c23          	sd	ra,24(sp)
    800060d4:	00813823          	sd	s0,16(sp)
    800060d8:	00913423          	sd	s1,8(sp)
    800060dc:	01213023          	sd	s2,0(sp)
    800060e0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800060e4:	00000493          	li	s1,0
    800060e8:	0400006f          	j	80006128 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800060ec:	00003517          	auipc	a0,0x3
    800060f0:	3d450513          	addi	a0,a0,980 # 800094c0 <CONSOLE_STATUS+0x4b0>
    800060f4:	fffff097          	auipc	ra,0xfffff
    800060f8:	628080e7          	jalr	1576(ra) # 8000571c <_Z11printStringPKc>
    800060fc:	00000613          	li	a2,0
    80006100:	00a00593          	li	a1,10
    80006104:	00048513          	mv	a0,s1
    80006108:	fffff097          	auipc	ra,0xfffff
    8000610c:	7c4080e7          	jalr	1988(ra) # 800058cc <_Z8printIntiii>
    80006110:	00003517          	auipc	a0,0x3
    80006114:	05050513          	addi	a0,a0,80 # 80009160 <CONSOLE_STATUS+0x150>
    80006118:	fffff097          	auipc	ra,0xfffff
    8000611c:	604080e7          	jalr	1540(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006120:	0014849b          	addiw	s1,s1,1
    80006124:	0ff4f493          	andi	s1,s1,255
    80006128:	00200793          	li	a5,2
    8000612c:	fc97f0e3          	bgeu	a5,s1,800060ec <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006130:	00003517          	auipc	a0,0x3
    80006134:	39850513          	addi	a0,a0,920 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80006138:	fffff097          	auipc	ra,0xfffff
    8000613c:	5e4080e7          	jalr	1508(ra) # 8000571c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006140:	00700313          	li	t1,7
    thread_dispatch();
    80006144:	ffffb097          	auipc	ra,0xffffb
    80006148:	308080e7          	jalr	776(ra) # 8000144c <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000614c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006150:	00003517          	auipc	a0,0x3
    80006154:	38850513          	addi	a0,a0,904 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80006158:	fffff097          	auipc	ra,0xfffff
    8000615c:	5c4080e7          	jalr	1476(ra) # 8000571c <_Z11printStringPKc>
    80006160:	00000613          	li	a2,0
    80006164:	00a00593          	li	a1,10
    80006168:	0009051b          	sext.w	a0,s2
    8000616c:	fffff097          	auipc	ra,0xfffff
    80006170:	760080e7          	jalr	1888(ra) # 800058cc <_Z8printIntiii>
    80006174:	00003517          	auipc	a0,0x3
    80006178:	fec50513          	addi	a0,a0,-20 # 80009160 <CONSOLE_STATUS+0x150>
    8000617c:	fffff097          	auipc	ra,0xfffff
    80006180:	5a0080e7          	jalr	1440(ra) # 8000571c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006184:	00c00513          	li	a0,12
    80006188:	00000097          	auipc	ra,0x0
    8000618c:	d88080e7          	jalr	-632(ra) # 80005f10 <_ZL9fibonaccim>
    80006190:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006194:	00003517          	auipc	a0,0x3
    80006198:	34c50513          	addi	a0,a0,844 # 800094e0 <CONSOLE_STATUS+0x4d0>
    8000619c:	fffff097          	auipc	ra,0xfffff
    800061a0:	580080e7          	jalr	1408(ra) # 8000571c <_Z11printStringPKc>
    800061a4:	00000613          	li	a2,0
    800061a8:	00a00593          	li	a1,10
    800061ac:	0009051b          	sext.w	a0,s2
    800061b0:	fffff097          	auipc	ra,0xfffff
    800061b4:	71c080e7          	jalr	1820(ra) # 800058cc <_Z8printIntiii>
    800061b8:	00003517          	auipc	a0,0x3
    800061bc:	fa850513          	addi	a0,a0,-88 # 80009160 <CONSOLE_STATUS+0x150>
    800061c0:	fffff097          	auipc	ra,0xfffff
    800061c4:	55c080e7          	jalr	1372(ra) # 8000571c <_Z11printStringPKc>
    800061c8:	0400006f          	j	80006208 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800061cc:	00003517          	auipc	a0,0x3
    800061d0:	2f450513          	addi	a0,a0,756 # 800094c0 <CONSOLE_STATUS+0x4b0>
    800061d4:	fffff097          	auipc	ra,0xfffff
    800061d8:	548080e7          	jalr	1352(ra) # 8000571c <_Z11printStringPKc>
    800061dc:	00000613          	li	a2,0
    800061e0:	00a00593          	li	a1,10
    800061e4:	00048513          	mv	a0,s1
    800061e8:	fffff097          	auipc	ra,0xfffff
    800061ec:	6e4080e7          	jalr	1764(ra) # 800058cc <_Z8printIntiii>
    800061f0:	00003517          	auipc	a0,0x3
    800061f4:	f7050513          	addi	a0,a0,-144 # 80009160 <CONSOLE_STATUS+0x150>
    800061f8:	fffff097          	auipc	ra,0xfffff
    800061fc:	524080e7          	jalr	1316(ra) # 8000571c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006200:	0014849b          	addiw	s1,s1,1
    80006204:	0ff4f493          	andi	s1,s1,255
    80006208:	00500793          	li	a5,5
    8000620c:	fc97f0e3          	bgeu	a5,s1,800061cc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006210:	00003517          	auipc	a0,0x3
    80006214:	28850513          	addi	a0,a0,648 # 80009498 <CONSOLE_STATUS+0x488>
    80006218:	fffff097          	auipc	ra,0xfffff
    8000621c:	504080e7          	jalr	1284(ra) # 8000571c <_Z11printStringPKc>
    finishedC = true;
    80006220:	00100793          	li	a5,1
    80006224:	00006717          	auipc	a4,0x6
    80006228:	94f707a3          	sb	a5,-1713(a4) # 8000bb73 <_ZL9finishedC>
    thread_dispatch();
    8000622c:	ffffb097          	auipc	ra,0xffffb
    80006230:	220080e7          	jalr	544(ra) # 8000144c <_Z15thread_dispatchv>
}
    80006234:	01813083          	ld	ra,24(sp)
    80006238:	01013403          	ld	s0,16(sp)
    8000623c:	00813483          	ld	s1,8(sp)
    80006240:	00013903          	ld	s2,0(sp)
    80006244:	02010113          	addi	sp,sp,32
    80006248:	00008067          	ret

000000008000624c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000624c:	fe010113          	addi	sp,sp,-32
    80006250:	00113c23          	sd	ra,24(sp)
    80006254:	00813823          	sd	s0,16(sp)
    80006258:	00913423          	sd	s1,8(sp)
    8000625c:	01213023          	sd	s2,0(sp)
    80006260:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006264:	00000913          	li	s2,0
    80006268:	0400006f          	j	800062a8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000626c:	ffffb097          	auipc	ra,0xffffb
    80006270:	1e0080e7          	jalr	480(ra) # 8000144c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006274:	00148493          	addi	s1,s1,1
    80006278:	000027b7          	lui	a5,0x2
    8000627c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006280:	0097ee63          	bltu	a5,s1,8000629c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006284:	00000713          	li	a4,0
    80006288:	000077b7          	lui	a5,0x7
    8000628c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006290:	fce7eee3          	bltu	a5,a4,8000626c <_ZL11workerBodyBPv+0x20>
    80006294:	00170713          	addi	a4,a4,1
    80006298:	ff1ff06f          	j	80006288 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    8000629c:	00a00793          	li	a5,10
    800062a0:	04f90663          	beq	s2,a5,800062ec <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800062a4:	00190913          	addi	s2,s2,1
    800062a8:	00f00793          	li	a5,15
    800062ac:	0527e463          	bltu	a5,s2,800062f4 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800062b0:	00003517          	auipc	a0,0x3
    800062b4:	1f850513          	addi	a0,a0,504 # 800094a8 <CONSOLE_STATUS+0x498>
    800062b8:	fffff097          	auipc	ra,0xfffff
    800062bc:	464080e7          	jalr	1124(ra) # 8000571c <_Z11printStringPKc>
    800062c0:	00000613          	li	a2,0
    800062c4:	00a00593          	li	a1,10
    800062c8:	0009051b          	sext.w	a0,s2
    800062cc:	fffff097          	auipc	ra,0xfffff
    800062d0:	600080e7          	jalr	1536(ra) # 800058cc <_Z8printIntiii>
    800062d4:	00003517          	auipc	a0,0x3
    800062d8:	e8c50513          	addi	a0,a0,-372 # 80009160 <CONSOLE_STATUS+0x150>
    800062dc:	fffff097          	auipc	ra,0xfffff
    800062e0:	440080e7          	jalr	1088(ra) # 8000571c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800062e4:	00000493          	li	s1,0
    800062e8:	f91ff06f          	j	80006278 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800062ec:	14102ff3          	csrr	t6,sepc
    800062f0:	fb5ff06f          	j	800062a4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800062f4:	00003517          	auipc	a0,0x3
    800062f8:	1bc50513          	addi	a0,a0,444 # 800094b0 <CONSOLE_STATUS+0x4a0>
    800062fc:	fffff097          	auipc	ra,0xfffff
    80006300:	420080e7          	jalr	1056(ra) # 8000571c <_Z11printStringPKc>
    finishedB = true;
    80006304:	00100793          	li	a5,1
    80006308:	00006717          	auipc	a4,0x6
    8000630c:	86f70623          	sb	a5,-1940(a4) # 8000bb74 <_ZL9finishedB>
    thread_dispatch();
    80006310:	ffffb097          	auipc	ra,0xffffb
    80006314:	13c080e7          	jalr	316(ra) # 8000144c <_Z15thread_dispatchv>
}
    80006318:	01813083          	ld	ra,24(sp)
    8000631c:	01013403          	ld	s0,16(sp)
    80006320:	00813483          	ld	s1,8(sp)
    80006324:	00013903          	ld	s2,0(sp)
    80006328:	02010113          	addi	sp,sp,32
    8000632c:	00008067          	ret

0000000080006330 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006330:	fe010113          	addi	sp,sp,-32
    80006334:	00113c23          	sd	ra,24(sp)
    80006338:	00813823          	sd	s0,16(sp)
    8000633c:	00913423          	sd	s1,8(sp)
    80006340:	01213023          	sd	s2,0(sp)
    80006344:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006348:	00000913          	li	s2,0
    8000634c:	0380006f          	j	80006384 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006350:	ffffb097          	auipc	ra,0xffffb
    80006354:	0fc080e7          	jalr	252(ra) # 8000144c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006358:	00148493          	addi	s1,s1,1
    8000635c:	000027b7          	lui	a5,0x2
    80006360:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006364:	0097ee63          	bltu	a5,s1,80006380 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006368:	00000713          	li	a4,0
    8000636c:	000077b7          	lui	a5,0x7
    80006370:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006374:	fce7eee3          	bltu	a5,a4,80006350 <_ZL11workerBodyAPv+0x20>
    80006378:	00170713          	addi	a4,a4,1
    8000637c:	ff1ff06f          	j	8000636c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006380:	00190913          	addi	s2,s2,1
    80006384:	00900793          	li	a5,9
    80006388:	0527e063          	bltu	a5,s2,800063c8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000638c:	00003517          	auipc	a0,0x3
    80006390:	10450513          	addi	a0,a0,260 # 80009490 <CONSOLE_STATUS+0x480>
    80006394:	fffff097          	auipc	ra,0xfffff
    80006398:	388080e7          	jalr	904(ra) # 8000571c <_Z11printStringPKc>
    8000639c:	00000613          	li	a2,0
    800063a0:	00a00593          	li	a1,10
    800063a4:	0009051b          	sext.w	a0,s2
    800063a8:	fffff097          	auipc	ra,0xfffff
    800063ac:	524080e7          	jalr	1316(ra) # 800058cc <_Z8printIntiii>
    800063b0:	00003517          	auipc	a0,0x3
    800063b4:	db050513          	addi	a0,a0,-592 # 80009160 <CONSOLE_STATUS+0x150>
    800063b8:	fffff097          	auipc	ra,0xfffff
    800063bc:	364080e7          	jalr	868(ra) # 8000571c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800063c0:	00000493          	li	s1,0
    800063c4:	f99ff06f          	j	8000635c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800063c8:	00003517          	auipc	a0,0x3
    800063cc:	0d050513          	addi	a0,a0,208 # 80009498 <CONSOLE_STATUS+0x488>
    800063d0:	fffff097          	auipc	ra,0xfffff
    800063d4:	34c080e7          	jalr	844(ra) # 8000571c <_Z11printStringPKc>
    finishedA = true;
    800063d8:	00100793          	li	a5,1
    800063dc:	00005717          	auipc	a4,0x5
    800063e0:	78f70ca3          	sb	a5,1945(a4) # 8000bb75 <_ZL9finishedA>
}
    800063e4:	01813083          	ld	ra,24(sp)
    800063e8:	01013403          	ld	s0,16(sp)
    800063ec:	00813483          	ld	s1,8(sp)
    800063f0:	00013903          	ld	s2,0(sp)
    800063f4:	02010113          	addi	sp,sp,32
    800063f8:	00008067          	ret

00000000800063fc <_Z16System_Mode_testv>:


void System_Mode_test() {
    800063fc:	fd010113          	addi	sp,sp,-48
    80006400:	02113423          	sd	ra,40(sp)
    80006404:	02813023          	sd	s0,32(sp)
    80006408:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000640c:	00000613          	li	a2,0
    80006410:	00000597          	auipc	a1,0x0
    80006414:	f2058593          	addi	a1,a1,-224 # 80006330 <_ZL11workerBodyAPv>
    80006418:	fd040513          	addi	a0,s0,-48
    8000641c:	ffffb097          	auipc	ra,0xffffb
    80006420:	f80080e7          	jalr	-128(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006424:	00003517          	auipc	a0,0x3
    80006428:	10450513          	addi	a0,a0,260 # 80009528 <CONSOLE_STATUS+0x518>
    8000642c:	fffff097          	auipc	ra,0xfffff
    80006430:	2f0080e7          	jalr	752(ra) # 8000571c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006434:	00000613          	li	a2,0
    80006438:	00000597          	auipc	a1,0x0
    8000643c:	e1458593          	addi	a1,a1,-492 # 8000624c <_ZL11workerBodyBPv>
    80006440:	fd840513          	addi	a0,s0,-40
    80006444:	ffffb097          	auipc	ra,0xffffb
    80006448:	f58080e7          	jalr	-168(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000644c:	00003517          	auipc	a0,0x3
    80006450:	0f450513          	addi	a0,a0,244 # 80009540 <CONSOLE_STATUS+0x530>
    80006454:	fffff097          	auipc	ra,0xfffff
    80006458:	2c8080e7          	jalr	712(ra) # 8000571c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000645c:	00000613          	li	a2,0
    80006460:	00000597          	auipc	a1,0x0
    80006464:	c6c58593          	addi	a1,a1,-916 # 800060cc <_ZL11workerBodyCPv>
    80006468:	fe040513          	addi	a0,s0,-32
    8000646c:	ffffb097          	auipc	ra,0xffffb
    80006470:	f30080e7          	jalr	-208(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006474:	00003517          	auipc	a0,0x3
    80006478:	0e450513          	addi	a0,a0,228 # 80009558 <CONSOLE_STATUS+0x548>
    8000647c:	fffff097          	auipc	ra,0xfffff
    80006480:	2a0080e7          	jalr	672(ra) # 8000571c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006484:	00000613          	li	a2,0
    80006488:	00000597          	auipc	a1,0x0
    8000648c:	afc58593          	addi	a1,a1,-1284 # 80005f84 <_ZL11workerBodyDPv>
    80006490:	fe840513          	addi	a0,s0,-24
    80006494:	ffffb097          	auipc	ra,0xffffb
    80006498:	f08080e7          	jalr	-248(ra) # 8000139c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    8000649c:	00003517          	auipc	a0,0x3
    800064a0:	0d450513          	addi	a0,a0,212 # 80009570 <CONSOLE_STATUS+0x560>
    800064a4:	fffff097          	auipc	ra,0xfffff
    800064a8:	278080e7          	jalr	632(ra) # 8000571c <_Z11printStringPKc>
    800064ac:	00c0006f          	j	800064b8 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800064b0:	ffffb097          	auipc	ra,0xffffb
    800064b4:	f9c080e7          	jalr	-100(ra) # 8000144c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800064b8:	00005797          	auipc	a5,0x5
    800064bc:	6bd7c783          	lbu	a5,1725(a5) # 8000bb75 <_ZL9finishedA>
    800064c0:	fe0788e3          	beqz	a5,800064b0 <_Z16System_Mode_testv+0xb4>
    800064c4:	00005797          	auipc	a5,0x5
    800064c8:	6b07c783          	lbu	a5,1712(a5) # 8000bb74 <_ZL9finishedB>
    800064cc:	fe0782e3          	beqz	a5,800064b0 <_Z16System_Mode_testv+0xb4>
    800064d0:	00005797          	auipc	a5,0x5
    800064d4:	6a37c783          	lbu	a5,1699(a5) # 8000bb73 <_ZL9finishedC>
    800064d8:	fc078ce3          	beqz	a5,800064b0 <_Z16System_Mode_testv+0xb4>
    800064dc:	00005797          	auipc	a5,0x5
    800064e0:	6967c783          	lbu	a5,1686(a5) # 8000bb72 <_ZL9finishedD>
    800064e4:	fc0786e3          	beqz	a5,800064b0 <_Z16System_Mode_testv+0xb4>
    }

}
    800064e8:	02813083          	ld	ra,40(sp)
    800064ec:	02013403          	ld	s0,32(sp)
    800064f0:	03010113          	addi	sp,sp,48
    800064f4:	00008067          	ret

00000000800064f8 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800064f8:	fe010113          	addi	sp,sp,-32
    800064fc:	00113c23          	sd	ra,24(sp)
    80006500:	00813823          	sd	s0,16(sp)
    80006504:	00913423          	sd	s1,8(sp)
    80006508:	01213023          	sd	s2,0(sp)
    8000650c:	02010413          	addi	s0,sp,32
    80006510:	00050493          	mv	s1,a0
    80006514:	00058913          	mv	s2,a1
    80006518:	0015879b          	addiw	a5,a1,1
    8000651c:	0007851b          	sext.w	a0,a5
    80006520:	00f4a023          	sw	a5,0(s1)
    80006524:	0004a823          	sw	zero,16(s1)
    80006528:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000652c:	00251513          	slli	a0,a0,0x2
    80006530:	ffffb097          	auipc	ra,0xffffb
    80006534:	e18080e7          	jalr	-488(ra) # 80001348 <_Z9mem_allocm>
    80006538:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    8000653c:	00000593          	li	a1,0
    80006540:	02048513          	addi	a0,s1,32
    80006544:	ffffb097          	auipc	ra,0xffffb
    80006548:	f4c080e7          	jalr	-180(ra) # 80001490 <_Z8sem_openPP3Semj>
    sem_open(&spaceAvailable, _cap);
    8000654c:	00090593          	mv	a1,s2
    80006550:	01848513          	addi	a0,s1,24
    80006554:	ffffb097          	auipc	ra,0xffffb
    80006558:	f3c080e7          	jalr	-196(ra) # 80001490 <_Z8sem_openPP3Semj>
    sem_open(&mutexHead, 1);
    8000655c:	00100593          	li	a1,1
    80006560:	02848513          	addi	a0,s1,40
    80006564:	ffffb097          	auipc	ra,0xffffb
    80006568:	f2c080e7          	jalr	-212(ra) # 80001490 <_Z8sem_openPP3Semj>
    sem_open(&mutexTail, 1);
    8000656c:	00100593          	li	a1,1
    80006570:	03048513          	addi	a0,s1,48
    80006574:	ffffb097          	auipc	ra,0xffffb
    80006578:	f1c080e7          	jalr	-228(ra) # 80001490 <_Z8sem_openPP3Semj>
}
    8000657c:	01813083          	ld	ra,24(sp)
    80006580:	01013403          	ld	s0,16(sp)
    80006584:	00813483          	ld	s1,8(sp)
    80006588:	00013903          	ld	s2,0(sp)
    8000658c:	02010113          	addi	sp,sp,32
    80006590:	00008067          	ret

0000000080006594 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006594:	fe010113          	addi	sp,sp,-32
    80006598:	00113c23          	sd	ra,24(sp)
    8000659c:	00813823          	sd	s0,16(sp)
    800065a0:	00913423          	sd	s1,8(sp)
    800065a4:	01213023          	sd	s2,0(sp)
    800065a8:	02010413          	addi	s0,sp,32
    800065ac:	00050493          	mv	s1,a0
    800065b0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800065b4:	01853503          	ld	a0,24(a0)
    800065b8:	ffffb097          	auipc	ra,0xffffb
    800065bc:	f34080e7          	jalr	-204(ra) # 800014ec <_Z8sem_waitP3Sem>

    sem_wait(mutexTail);
    800065c0:	0304b503          	ld	a0,48(s1)
    800065c4:	ffffb097          	auipc	ra,0xffffb
    800065c8:	f28080e7          	jalr	-216(ra) # 800014ec <_Z8sem_waitP3Sem>
    buffer[tail] = val;
    800065cc:	0084b783          	ld	a5,8(s1)
    800065d0:	0144a703          	lw	a4,20(s1)
    800065d4:	00271713          	slli	a4,a4,0x2
    800065d8:	00e787b3          	add	a5,a5,a4
    800065dc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800065e0:	0144a783          	lw	a5,20(s1)
    800065e4:	0017879b          	addiw	a5,a5,1
    800065e8:	0004a703          	lw	a4,0(s1)
    800065ec:	02e7e7bb          	remw	a5,a5,a4
    800065f0:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800065f4:	0304b503          	ld	a0,48(s1)
    800065f8:	ffffb097          	auipc	ra,0xffffb
    800065fc:	f20080e7          	jalr	-224(ra) # 80001518 <_Z10sem_signalP3Sem>

    sem_signal(itemAvailable);
    80006600:	0204b503          	ld	a0,32(s1)
    80006604:	ffffb097          	auipc	ra,0xffffb
    80006608:	f14080e7          	jalr	-236(ra) # 80001518 <_Z10sem_signalP3Sem>

}
    8000660c:	01813083          	ld	ra,24(sp)
    80006610:	01013403          	ld	s0,16(sp)
    80006614:	00813483          	ld	s1,8(sp)
    80006618:	00013903          	ld	s2,0(sp)
    8000661c:	02010113          	addi	sp,sp,32
    80006620:	00008067          	ret

0000000080006624 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006624:	fe010113          	addi	sp,sp,-32
    80006628:	00113c23          	sd	ra,24(sp)
    8000662c:	00813823          	sd	s0,16(sp)
    80006630:	00913423          	sd	s1,8(sp)
    80006634:	01213023          	sd	s2,0(sp)
    80006638:	02010413          	addi	s0,sp,32
    8000663c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006640:	02053503          	ld	a0,32(a0)
    80006644:	ffffb097          	auipc	ra,0xffffb
    80006648:	ea8080e7          	jalr	-344(ra) # 800014ec <_Z8sem_waitP3Sem>

    sem_wait(mutexHead);
    8000664c:	0284b503          	ld	a0,40(s1)
    80006650:	ffffb097          	auipc	ra,0xffffb
    80006654:	e9c080e7          	jalr	-356(ra) # 800014ec <_Z8sem_waitP3Sem>

    int ret = buffer[head];
    80006658:	0084b703          	ld	a4,8(s1)
    8000665c:	0104a783          	lw	a5,16(s1)
    80006660:	00279693          	slli	a3,a5,0x2
    80006664:	00d70733          	add	a4,a4,a3
    80006668:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000666c:	0017879b          	addiw	a5,a5,1
    80006670:	0004a703          	lw	a4,0(s1)
    80006674:	02e7e7bb          	remw	a5,a5,a4
    80006678:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    8000667c:	0284b503          	ld	a0,40(s1)
    80006680:	ffffb097          	auipc	ra,0xffffb
    80006684:	e98080e7          	jalr	-360(ra) # 80001518 <_Z10sem_signalP3Sem>

    sem_signal(spaceAvailable);
    80006688:	0184b503          	ld	a0,24(s1)
    8000668c:	ffffb097          	auipc	ra,0xffffb
    80006690:	e8c080e7          	jalr	-372(ra) # 80001518 <_Z10sem_signalP3Sem>

    return ret;
}
    80006694:	00090513          	mv	a0,s2
    80006698:	01813083          	ld	ra,24(sp)
    8000669c:	01013403          	ld	s0,16(sp)
    800066a0:	00813483          	ld	s1,8(sp)
    800066a4:	00013903          	ld	s2,0(sp)
    800066a8:	02010113          	addi	sp,sp,32
    800066ac:	00008067          	ret

00000000800066b0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800066b0:	fe010113          	addi	sp,sp,-32
    800066b4:	00113c23          	sd	ra,24(sp)
    800066b8:	00813823          	sd	s0,16(sp)
    800066bc:	00913423          	sd	s1,8(sp)
    800066c0:	01213023          	sd	s2,0(sp)
    800066c4:	02010413          	addi	s0,sp,32
    800066c8:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800066cc:	02853503          	ld	a0,40(a0)
    800066d0:	ffffb097          	auipc	ra,0xffffb
    800066d4:	e1c080e7          	jalr	-484(ra) # 800014ec <_Z8sem_waitP3Sem>
    sem_wait(mutexTail);
    800066d8:	0304b503          	ld	a0,48(s1)
    800066dc:	ffffb097          	auipc	ra,0xffffb
    800066e0:	e10080e7          	jalr	-496(ra) # 800014ec <_Z8sem_waitP3Sem>

    if (tail >= head) {
    800066e4:	0144a783          	lw	a5,20(s1)
    800066e8:	0104a903          	lw	s2,16(s1)
    800066ec:	0327ce63          	blt	a5,s2,80006728 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800066f0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800066f4:	0304b503          	ld	a0,48(s1)
    800066f8:	ffffb097          	auipc	ra,0xffffb
    800066fc:	e20080e7          	jalr	-480(ra) # 80001518 <_Z10sem_signalP3Sem>
    sem_signal(mutexHead);
    80006700:	0284b503          	ld	a0,40(s1)
    80006704:	ffffb097          	auipc	ra,0xffffb
    80006708:	e14080e7          	jalr	-492(ra) # 80001518 <_Z10sem_signalP3Sem>

    return ret;
}
    8000670c:	00090513          	mv	a0,s2
    80006710:	01813083          	ld	ra,24(sp)
    80006714:	01013403          	ld	s0,16(sp)
    80006718:	00813483          	ld	s1,8(sp)
    8000671c:	00013903          	ld	s2,0(sp)
    80006720:	02010113          	addi	sp,sp,32
    80006724:	00008067          	ret
        ret = cap - head + tail;
    80006728:	0004a703          	lw	a4,0(s1)
    8000672c:	4127093b          	subw	s2,a4,s2
    80006730:	00f9093b          	addw	s2,s2,a5
    80006734:	fc1ff06f          	j	800066f4 <_ZN6Buffer6getCntEv+0x44>

0000000080006738 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006738:	fe010113          	addi	sp,sp,-32
    8000673c:	00113c23          	sd	ra,24(sp)
    80006740:	00813823          	sd	s0,16(sp)
    80006744:	00913423          	sd	s1,8(sp)
    80006748:	02010413          	addi	s0,sp,32
    8000674c:	00050493          	mv	s1,a0
    putc('\n');
    80006750:	00a00513          	li	a0,10
    80006754:	ffffb097          	auipc	ra,0xffffb
    80006758:	e44080e7          	jalr	-444(ra) # 80001598 <_Z4putcc>
    printString("Buffer deleted!\n");
    8000675c:	00003517          	auipc	a0,0x3
    80006760:	e2c50513          	addi	a0,a0,-468 # 80009588 <CONSOLE_STATUS+0x578>
    80006764:	fffff097          	auipc	ra,0xfffff
    80006768:	fb8080e7          	jalr	-72(ra) # 8000571c <_Z11printStringPKc>
    while (getCnt() > 0) {
    8000676c:	00048513          	mv	a0,s1
    80006770:	00000097          	auipc	ra,0x0
    80006774:	f40080e7          	jalr	-192(ra) # 800066b0 <_ZN6Buffer6getCntEv>
    80006778:	02a05c63          	blez	a0,800067b0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    8000677c:	0084b783          	ld	a5,8(s1)
    80006780:	0104a703          	lw	a4,16(s1)
    80006784:	00271713          	slli	a4,a4,0x2
    80006788:	00e787b3          	add	a5,a5,a4
        putc(ch);
    8000678c:	0007c503          	lbu	a0,0(a5)
    80006790:	ffffb097          	auipc	ra,0xffffb
    80006794:	e08080e7          	jalr	-504(ra) # 80001598 <_Z4putcc>
        head = (head + 1) % cap;
    80006798:	0104a783          	lw	a5,16(s1)
    8000679c:	0017879b          	addiw	a5,a5,1
    800067a0:	0004a703          	lw	a4,0(s1)
    800067a4:	02e7e7bb          	remw	a5,a5,a4
    800067a8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800067ac:	fc1ff06f          	j	8000676c <_ZN6BufferD1Ev+0x34>
    putc('!');
    800067b0:	02100513          	li	a0,33
    800067b4:	ffffb097          	auipc	ra,0xffffb
    800067b8:	de4080e7          	jalr	-540(ra) # 80001598 <_Z4putcc>
    putc('\n');
    800067bc:	00a00513          	li	a0,10
    800067c0:	ffffb097          	auipc	ra,0xffffb
    800067c4:	dd8080e7          	jalr	-552(ra) # 80001598 <_Z4putcc>
    mem_free(buffer);
    800067c8:	0084b503          	ld	a0,8(s1)
    800067cc:	ffffb097          	auipc	ra,0xffffb
    800067d0:	ba4080e7          	jalr	-1116(ra) # 80001370 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800067d4:	0204b503          	ld	a0,32(s1)
    800067d8:	ffffb097          	auipc	ra,0xffffb
    800067dc:	ce8080e7          	jalr	-792(ra) # 800014c0 <_Z9sem_closeP3Sem>
    sem_close(spaceAvailable);
    800067e0:	0184b503          	ld	a0,24(s1)
    800067e4:	ffffb097          	auipc	ra,0xffffb
    800067e8:	cdc080e7          	jalr	-804(ra) # 800014c0 <_Z9sem_closeP3Sem>
    sem_close(mutexTail);
    800067ec:	0304b503          	ld	a0,48(s1)
    800067f0:	ffffb097          	auipc	ra,0xffffb
    800067f4:	cd0080e7          	jalr	-816(ra) # 800014c0 <_Z9sem_closeP3Sem>
    sem_close(mutexHead);
    800067f8:	0284b503          	ld	a0,40(s1)
    800067fc:	ffffb097          	auipc	ra,0xffffb
    80006800:	cc4080e7          	jalr	-828(ra) # 800014c0 <_Z9sem_closeP3Sem>
}
    80006804:	01813083          	ld	ra,24(sp)
    80006808:	01013403          	ld	s0,16(sp)
    8000680c:	00813483          	ld	s1,8(sp)
    80006810:	02010113          	addi	sp,sp,32
    80006814:	00008067          	ret

0000000080006818 <start>:
    80006818:	ff010113          	addi	sp,sp,-16
    8000681c:	00813423          	sd	s0,8(sp)
    80006820:	01010413          	addi	s0,sp,16
    80006824:	300027f3          	csrr	a5,mstatus
    80006828:	ffffe737          	lui	a4,0xffffe
    8000682c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1a1f>
    80006830:	00e7f7b3          	and	a5,a5,a4
    80006834:	00001737          	lui	a4,0x1
    80006838:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000683c:	00e7e7b3          	or	a5,a5,a4
    80006840:	30079073          	csrw	mstatus,a5
    80006844:	00000797          	auipc	a5,0x0
    80006848:	16078793          	addi	a5,a5,352 # 800069a4 <system_main>
    8000684c:	34179073          	csrw	mepc,a5
    80006850:	00000793          	li	a5,0
    80006854:	18079073          	csrw	satp,a5
    80006858:	000107b7          	lui	a5,0x10
    8000685c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006860:	30279073          	csrw	medeleg,a5
    80006864:	30379073          	csrw	mideleg,a5
    80006868:	104027f3          	csrr	a5,sie
    8000686c:	2227e793          	ori	a5,a5,546
    80006870:	10479073          	csrw	sie,a5
    80006874:	fff00793          	li	a5,-1
    80006878:	00a7d793          	srli	a5,a5,0xa
    8000687c:	3b079073          	csrw	pmpaddr0,a5
    80006880:	00f00793          	li	a5,15
    80006884:	3a079073          	csrw	pmpcfg0,a5
    80006888:	f14027f3          	csrr	a5,mhartid
    8000688c:	0200c737          	lui	a4,0x200c
    80006890:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006894:	0007869b          	sext.w	a3,a5
    80006898:	00269713          	slli	a4,a3,0x2
    8000689c:	000f4637          	lui	a2,0xf4
    800068a0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800068a4:	00d70733          	add	a4,a4,a3
    800068a8:	0037979b          	slliw	a5,a5,0x3
    800068ac:	020046b7          	lui	a3,0x2004
    800068b0:	00d787b3          	add	a5,a5,a3
    800068b4:	00c585b3          	add	a1,a1,a2
    800068b8:	00371693          	slli	a3,a4,0x3
    800068bc:	00005717          	auipc	a4,0x5
    800068c0:	2c470713          	addi	a4,a4,708 # 8000bb80 <timer_scratch>
    800068c4:	00b7b023          	sd	a1,0(a5)
    800068c8:	00d70733          	add	a4,a4,a3
    800068cc:	00f73c23          	sd	a5,24(a4)
    800068d0:	02c73023          	sd	a2,32(a4)
    800068d4:	34071073          	csrw	mscratch,a4
    800068d8:	00000797          	auipc	a5,0x0
    800068dc:	6e878793          	addi	a5,a5,1768 # 80006fc0 <timervec>
    800068e0:	30579073          	csrw	mtvec,a5
    800068e4:	300027f3          	csrr	a5,mstatus
    800068e8:	0087e793          	ori	a5,a5,8
    800068ec:	30079073          	csrw	mstatus,a5
    800068f0:	304027f3          	csrr	a5,mie
    800068f4:	0807e793          	ori	a5,a5,128
    800068f8:	30479073          	csrw	mie,a5
    800068fc:	f14027f3          	csrr	a5,mhartid
    80006900:	0007879b          	sext.w	a5,a5
    80006904:	00078213          	mv	tp,a5
    80006908:	30200073          	mret
    8000690c:	00813403          	ld	s0,8(sp)
    80006910:	01010113          	addi	sp,sp,16
    80006914:	00008067          	ret

0000000080006918 <timerinit>:
    80006918:	ff010113          	addi	sp,sp,-16
    8000691c:	00813423          	sd	s0,8(sp)
    80006920:	01010413          	addi	s0,sp,16
    80006924:	f14027f3          	csrr	a5,mhartid
    80006928:	0200c737          	lui	a4,0x200c
    8000692c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006930:	0007869b          	sext.w	a3,a5
    80006934:	00269713          	slli	a4,a3,0x2
    80006938:	000f4637          	lui	a2,0xf4
    8000693c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006940:	00d70733          	add	a4,a4,a3
    80006944:	0037979b          	slliw	a5,a5,0x3
    80006948:	020046b7          	lui	a3,0x2004
    8000694c:	00d787b3          	add	a5,a5,a3
    80006950:	00c585b3          	add	a1,a1,a2
    80006954:	00371693          	slli	a3,a4,0x3
    80006958:	00005717          	auipc	a4,0x5
    8000695c:	22870713          	addi	a4,a4,552 # 8000bb80 <timer_scratch>
    80006960:	00b7b023          	sd	a1,0(a5)
    80006964:	00d70733          	add	a4,a4,a3
    80006968:	00f73c23          	sd	a5,24(a4)
    8000696c:	02c73023          	sd	a2,32(a4)
    80006970:	34071073          	csrw	mscratch,a4
    80006974:	00000797          	auipc	a5,0x0
    80006978:	64c78793          	addi	a5,a5,1612 # 80006fc0 <timervec>
    8000697c:	30579073          	csrw	mtvec,a5
    80006980:	300027f3          	csrr	a5,mstatus
    80006984:	0087e793          	ori	a5,a5,8
    80006988:	30079073          	csrw	mstatus,a5
    8000698c:	304027f3          	csrr	a5,mie
    80006990:	0807e793          	ori	a5,a5,128
    80006994:	30479073          	csrw	mie,a5
    80006998:	00813403          	ld	s0,8(sp)
    8000699c:	01010113          	addi	sp,sp,16
    800069a0:	00008067          	ret

00000000800069a4 <system_main>:
    800069a4:	fe010113          	addi	sp,sp,-32
    800069a8:	00813823          	sd	s0,16(sp)
    800069ac:	00913423          	sd	s1,8(sp)
    800069b0:	00113c23          	sd	ra,24(sp)
    800069b4:	02010413          	addi	s0,sp,32
    800069b8:	00000097          	auipc	ra,0x0
    800069bc:	0c4080e7          	jalr	196(ra) # 80006a7c <cpuid>
    800069c0:	00005497          	auipc	s1,0x5
    800069c4:	10048493          	addi	s1,s1,256 # 8000bac0 <started>
    800069c8:	02050263          	beqz	a0,800069ec <system_main+0x48>
    800069cc:	0004a783          	lw	a5,0(s1)
    800069d0:	0007879b          	sext.w	a5,a5
    800069d4:	fe078ce3          	beqz	a5,800069cc <system_main+0x28>
    800069d8:	0ff0000f          	fence
    800069dc:	00003517          	auipc	a0,0x3
    800069e0:	c0450513          	addi	a0,a0,-1020 # 800095e0 <CONSOLE_STATUS+0x5d0>
    800069e4:	00001097          	auipc	ra,0x1
    800069e8:	a78080e7          	jalr	-1416(ra) # 8000745c <panic>
    800069ec:	00001097          	auipc	ra,0x1
    800069f0:	9cc080e7          	jalr	-1588(ra) # 800073b8 <consoleinit>
    800069f4:	00001097          	auipc	ra,0x1
    800069f8:	158080e7          	jalr	344(ra) # 80007b4c <printfinit>
    800069fc:	00002517          	auipc	a0,0x2
    80006a00:	76450513          	addi	a0,a0,1892 # 80009160 <CONSOLE_STATUS+0x150>
    80006a04:	00001097          	auipc	ra,0x1
    80006a08:	ab4080e7          	jalr	-1356(ra) # 800074b8 <__printf>
    80006a0c:	00003517          	auipc	a0,0x3
    80006a10:	ba450513          	addi	a0,a0,-1116 # 800095b0 <CONSOLE_STATUS+0x5a0>
    80006a14:	00001097          	auipc	ra,0x1
    80006a18:	aa4080e7          	jalr	-1372(ra) # 800074b8 <__printf>
    80006a1c:	00002517          	auipc	a0,0x2
    80006a20:	74450513          	addi	a0,a0,1860 # 80009160 <CONSOLE_STATUS+0x150>
    80006a24:	00001097          	auipc	ra,0x1
    80006a28:	a94080e7          	jalr	-1388(ra) # 800074b8 <__printf>
    80006a2c:	00001097          	auipc	ra,0x1
    80006a30:	4ac080e7          	jalr	1196(ra) # 80007ed8 <kinit>
    80006a34:	00000097          	auipc	ra,0x0
    80006a38:	148080e7          	jalr	328(ra) # 80006b7c <trapinit>
    80006a3c:	00000097          	auipc	ra,0x0
    80006a40:	16c080e7          	jalr	364(ra) # 80006ba8 <trapinithart>
    80006a44:	00000097          	auipc	ra,0x0
    80006a48:	5bc080e7          	jalr	1468(ra) # 80007000 <plicinit>
    80006a4c:	00000097          	auipc	ra,0x0
    80006a50:	5dc080e7          	jalr	1500(ra) # 80007028 <plicinithart>
    80006a54:	00000097          	auipc	ra,0x0
    80006a58:	078080e7          	jalr	120(ra) # 80006acc <userinit>
    80006a5c:	0ff0000f          	fence
    80006a60:	00100793          	li	a5,1
    80006a64:	00003517          	auipc	a0,0x3
    80006a68:	b6450513          	addi	a0,a0,-1180 # 800095c8 <CONSOLE_STATUS+0x5b8>
    80006a6c:	00f4a023          	sw	a5,0(s1)
    80006a70:	00001097          	auipc	ra,0x1
    80006a74:	a48080e7          	jalr	-1464(ra) # 800074b8 <__printf>
    80006a78:	0000006f          	j	80006a78 <system_main+0xd4>

0000000080006a7c <cpuid>:
    80006a7c:	ff010113          	addi	sp,sp,-16
    80006a80:	00813423          	sd	s0,8(sp)
    80006a84:	01010413          	addi	s0,sp,16
    80006a88:	00020513          	mv	a0,tp
    80006a8c:	00813403          	ld	s0,8(sp)
    80006a90:	0005051b          	sext.w	a0,a0
    80006a94:	01010113          	addi	sp,sp,16
    80006a98:	00008067          	ret

0000000080006a9c <mycpu>:
    80006a9c:	ff010113          	addi	sp,sp,-16
    80006aa0:	00813423          	sd	s0,8(sp)
    80006aa4:	01010413          	addi	s0,sp,16
    80006aa8:	00020793          	mv	a5,tp
    80006aac:	00813403          	ld	s0,8(sp)
    80006ab0:	0007879b          	sext.w	a5,a5
    80006ab4:	00779793          	slli	a5,a5,0x7
    80006ab8:	00006517          	auipc	a0,0x6
    80006abc:	0f850513          	addi	a0,a0,248 # 8000cbb0 <cpus>
    80006ac0:	00f50533          	add	a0,a0,a5
    80006ac4:	01010113          	addi	sp,sp,16
    80006ac8:	00008067          	ret

0000000080006acc <userinit>:
    80006acc:	ff010113          	addi	sp,sp,-16
    80006ad0:	00813423          	sd	s0,8(sp)
    80006ad4:	01010413          	addi	s0,sp,16
    80006ad8:	00813403          	ld	s0,8(sp)
    80006adc:	01010113          	addi	sp,sp,16
    80006ae0:	ffffb317          	auipc	t1,0xffffb
    80006ae4:	74c30067          	jr	1868(t1) # 8000222c <main>

0000000080006ae8 <either_copyout>:
    80006ae8:	ff010113          	addi	sp,sp,-16
    80006aec:	00813023          	sd	s0,0(sp)
    80006af0:	00113423          	sd	ra,8(sp)
    80006af4:	01010413          	addi	s0,sp,16
    80006af8:	02051663          	bnez	a0,80006b24 <either_copyout+0x3c>
    80006afc:	00058513          	mv	a0,a1
    80006b00:	00060593          	mv	a1,a2
    80006b04:	0006861b          	sext.w	a2,a3
    80006b08:	00002097          	auipc	ra,0x2
    80006b0c:	c5c080e7          	jalr	-932(ra) # 80008764 <__memmove>
    80006b10:	00813083          	ld	ra,8(sp)
    80006b14:	00013403          	ld	s0,0(sp)
    80006b18:	00000513          	li	a0,0
    80006b1c:	01010113          	addi	sp,sp,16
    80006b20:	00008067          	ret
    80006b24:	00003517          	auipc	a0,0x3
    80006b28:	ae450513          	addi	a0,a0,-1308 # 80009608 <CONSOLE_STATUS+0x5f8>
    80006b2c:	00001097          	auipc	ra,0x1
    80006b30:	930080e7          	jalr	-1744(ra) # 8000745c <panic>

0000000080006b34 <either_copyin>:
    80006b34:	ff010113          	addi	sp,sp,-16
    80006b38:	00813023          	sd	s0,0(sp)
    80006b3c:	00113423          	sd	ra,8(sp)
    80006b40:	01010413          	addi	s0,sp,16
    80006b44:	02059463          	bnez	a1,80006b6c <either_copyin+0x38>
    80006b48:	00060593          	mv	a1,a2
    80006b4c:	0006861b          	sext.w	a2,a3
    80006b50:	00002097          	auipc	ra,0x2
    80006b54:	c14080e7          	jalr	-1004(ra) # 80008764 <__memmove>
    80006b58:	00813083          	ld	ra,8(sp)
    80006b5c:	00013403          	ld	s0,0(sp)
    80006b60:	00000513          	li	a0,0
    80006b64:	01010113          	addi	sp,sp,16
    80006b68:	00008067          	ret
    80006b6c:	00003517          	auipc	a0,0x3
    80006b70:	ac450513          	addi	a0,a0,-1340 # 80009630 <CONSOLE_STATUS+0x620>
    80006b74:	00001097          	auipc	ra,0x1
    80006b78:	8e8080e7          	jalr	-1816(ra) # 8000745c <panic>

0000000080006b7c <trapinit>:
    80006b7c:	ff010113          	addi	sp,sp,-16
    80006b80:	00813423          	sd	s0,8(sp)
    80006b84:	01010413          	addi	s0,sp,16
    80006b88:	00813403          	ld	s0,8(sp)
    80006b8c:	00003597          	auipc	a1,0x3
    80006b90:	acc58593          	addi	a1,a1,-1332 # 80009658 <CONSOLE_STATUS+0x648>
    80006b94:	00006517          	auipc	a0,0x6
    80006b98:	09c50513          	addi	a0,a0,156 # 8000cc30 <tickslock>
    80006b9c:	01010113          	addi	sp,sp,16
    80006ba0:	00001317          	auipc	t1,0x1
    80006ba4:	5c830067          	jr	1480(t1) # 80008168 <initlock>

0000000080006ba8 <trapinithart>:
    80006ba8:	ff010113          	addi	sp,sp,-16
    80006bac:	00813423          	sd	s0,8(sp)
    80006bb0:	01010413          	addi	s0,sp,16
    80006bb4:	00000797          	auipc	a5,0x0
    80006bb8:	2fc78793          	addi	a5,a5,764 # 80006eb0 <kernelvec>
    80006bbc:	10579073          	csrw	stvec,a5
    80006bc0:	00813403          	ld	s0,8(sp)
    80006bc4:	01010113          	addi	sp,sp,16
    80006bc8:	00008067          	ret

0000000080006bcc <usertrap>:
    80006bcc:	ff010113          	addi	sp,sp,-16
    80006bd0:	00813423          	sd	s0,8(sp)
    80006bd4:	01010413          	addi	s0,sp,16
    80006bd8:	00813403          	ld	s0,8(sp)
    80006bdc:	01010113          	addi	sp,sp,16
    80006be0:	00008067          	ret

0000000080006be4 <usertrapret>:
    80006be4:	ff010113          	addi	sp,sp,-16
    80006be8:	00813423          	sd	s0,8(sp)
    80006bec:	01010413          	addi	s0,sp,16
    80006bf0:	00813403          	ld	s0,8(sp)
    80006bf4:	01010113          	addi	sp,sp,16
    80006bf8:	00008067          	ret

0000000080006bfc <kerneltrap>:
    80006bfc:	fe010113          	addi	sp,sp,-32
    80006c00:	00813823          	sd	s0,16(sp)
    80006c04:	00113c23          	sd	ra,24(sp)
    80006c08:	00913423          	sd	s1,8(sp)
    80006c0c:	02010413          	addi	s0,sp,32
    80006c10:	142025f3          	csrr	a1,scause
    80006c14:	100027f3          	csrr	a5,sstatus
    80006c18:	0027f793          	andi	a5,a5,2
    80006c1c:	10079c63          	bnez	a5,80006d34 <kerneltrap+0x138>
    80006c20:	142027f3          	csrr	a5,scause
    80006c24:	0207ce63          	bltz	a5,80006c60 <kerneltrap+0x64>
    80006c28:	00003517          	auipc	a0,0x3
    80006c2c:	a7850513          	addi	a0,a0,-1416 # 800096a0 <CONSOLE_STATUS+0x690>
    80006c30:	00001097          	auipc	ra,0x1
    80006c34:	888080e7          	jalr	-1912(ra) # 800074b8 <__printf>
    80006c38:	141025f3          	csrr	a1,sepc
    80006c3c:	14302673          	csrr	a2,stval
    80006c40:	00003517          	auipc	a0,0x3
    80006c44:	a7050513          	addi	a0,a0,-1424 # 800096b0 <CONSOLE_STATUS+0x6a0>
    80006c48:	00001097          	auipc	ra,0x1
    80006c4c:	870080e7          	jalr	-1936(ra) # 800074b8 <__printf>
    80006c50:	00003517          	auipc	a0,0x3
    80006c54:	a7850513          	addi	a0,a0,-1416 # 800096c8 <CONSOLE_STATUS+0x6b8>
    80006c58:	00001097          	auipc	ra,0x1
    80006c5c:	804080e7          	jalr	-2044(ra) # 8000745c <panic>
    80006c60:	0ff7f713          	andi	a4,a5,255
    80006c64:	00900693          	li	a3,9
    80006c68:	04d70063          	beq	a4,a3,80006ca8 <kerneltrap+0xac>
    80006c6c:	fff00713          	li	a4,-1
    80006c70:	03f71713          	slli	a4,a4,0x3f
    80006c74:	00170713          	addi	a4,a4,1
    80006c78:	fae798e3          	bne	a5,a4,80006c28 <kerneltrap+0x2c>
    80006c7c:	00000097          	auipc	ra,0x0
    80006c80:	e00080e7          	jalr	-512(ra) # 80006a7c <cpuid>
    80006c84:	06050663          	beqz	a0,80006cf0 <kerneltrap+0xf4>
    80006c88:	144027f3          	csrr	a5,sip
    80006c8c:	ffd7f793          	andi	a5,a5,-3
    80006c90:	14479073          	csrw	sip,a5
    80006c94:	01813083          	ld	ra,24(sp)
    80006c98:	01013403          	ld	s0,16(sp)
    80006c9c:	00813483          	ld	s1,8(sp)
    80006ca0:	02010113          	addi	sp,sp,32
    80006ca4:	00008067          	ret
    80006ca8:	00000097          	auipc	ra,0x0
    80006cac:	3cc080e7          	jalr	972(ra) # 80007074 <plic_claim>
    80006cb0:	00a00793          	li	a5,10
    80006cb4:	00050493          	mv	s1,a0
    80006cb8:	06f50863          	beq	a0,a5,80006d28 <kerneltrap+0x12c>
    80006cbc:	fc050ce3          	beqz	a0,80006c94 <kerneltrap+0x98>
    80006cc0:	00050593          	mv	a1,a0
    80006cc4:	00003517          	auipc	a0,0x3
    80006cc8:	9bc50513          	addi	a0,a0,-1604 # 80009680 <CONSOLE_STATUS+0x670>
    80006ccc:	00000097          	auipc	ra,0x0
    80006cd0:	7ec080e7          	jalr	2028(ra) # 800074b8 <__printf>
    80006cd4:	01013403          	ld	s0,16(sp)
    80006cd8:	01813083          	ld	ra,24(sp)
    80006cdc:	00048513          	mv	a0,s1
    80006ce0:	00813483          	ld	s1,8(sp)
    80006ce4:	02010113          	addi	sp,sp,32
    80006ce8:	00000317          	auipc	t1,0x0
    80006cec:	3c430067          	jr	964(t1) # 800070ac <plic_complete>
    80006cf0:	00006517          	auipc	a0,0x6
    80006cf4:	f4050513          	addi	a0,a0,-192 # 8000cc30 <tickslock>
    80006cf8:	00001097          	auipc	ra,0x1
    80006cfc:	494080e7          	jalr	1172(ra) # 8000818c <acquire>
    80006d00:	00005717          	auipc	a4,0x5
    80006d04:	dc470713          	addi	a4,a4,-572 # 8000bac4 <ticks>
    80006d08:	00072783          	lw	a5,0(a4)
    80006d0c:	00006517          	auipc	a0,0x6
    80006d10:	f2450513          	addi	a0,a0,-220 # 8000cc30 <tickslock>
    80006d14:	0017879b          	addiw	a5,a5,1
    80006d18:	00f72023          	sw	a5,0(a4)
    80006d1c:	00001097          	auipc	ra,0x1
    80006d20:	53c080e7          	jalr	1340(ra) # 80008258 <release>
    80006d24:	f65ff06f          	j	80006c88 <kerneltrap+0x8c>
    80006d28:	00001097          	auipc	ra,0x1
    80006d2c:	098080e7          	jalr	152(ra) # 80007dc0 <uartintr>
    80006d30:	fa5ff06f          	j	80006cd4 <kerneltrap+0xd8>
    80006d34:	00003517          	auipc	a0,0x3
    80006d38:	92c50513          	addi	a0,a0,-1748 # 80009660 <CONSOLE_STATUS+0x650>
    80006d3c:	00000097          	auipc	ra,0x0
    80006d40:	720080e7          	jalr	1824(ra) # 8000745c <panic>

0000000080006d44 <clockintr>:
    80006d44:	fe010113          	addi	sp,sp,-32
    80006d48:	00813823          	sd	s0,16(sp)
    80006d4c:	00913423          	sd	s1,8(sp)
    80006d50:	00113c23          	sd	ra,24(sp)
    80006d54:	02010413          	addi	s0,sp,32
    80006d58:	00006497          	auipc	s1,0x6
    80006d5c:	ed848493          	addi	s1,s1,-296 # 8000cc30 <tickslock>
    80006d60:	00048513          	mv	a0,s1
    80006d64:	00001097          	auipc	ra,0x1
    80006d68:	428080e7          	jalr	1064(ra) # 8000818c <acquire>
    80006d6c:	00005717          	auipc	a4,0x5
    80006d70:	d5870713          	addi	a4,a4,-680 # 8000bac4 <ticks>
    80006d74:	00072783          	lw	a5,0(a4)
    80006d78:	01013403          	ld	s0,16(sp)
    80006d7c:	01813083          	ld	ra,24(sp)
    80006d80:	00048513          	mv	a0,s1
    80006d84:	0017879b          	addiw	a5,a5,1
    80006d88:	00813483          	ld	s1,8(sp)
    80006d8c:	00f72023          	sw	a5,0(a4)
    80006d90:	02010113          	addi	sp,sp,32
    80006d94:	00001317          	auipc	t1,0x1
    80006d98:	4c430067          	jr	1220(t1) # 80008258 <release>

0000000080006d9c <devintr>:
    80006d9c:	142027f3          	csrr	a5,scause
    80006da0:	00000513          	li	a0,0
    80006da4:	0007c463          	bltz	a5,80006dac <devintr+0x10>
    80006da8:	00008067          	ret
    80006dac:	fe010113          	addi	sp,sp,-32
    80006db0:	00813823          	sd	s0,16(sp)
    80006db4:	00113c23          	sd	ra,24(sp)
    80006db8:	00913423          	sd	s1,8(sp)
    80006dbc:	02010413          	addi	s0,sp,32
    80006dc0:	0ff7f713          	andi	a4,a5,255
    80006dc4:	00900693          	li	a3,9
    80006dc8:	04d70c63          	beq	a4,a3,80006e20 <devintr+0x84>
    80006dcc:	fff00713          	li	a4,-1
    80006dd0:	03f71713          	slli	a4,a4,0x3f
    80006dd4:	00170713          	addi	a4,a4,1
    80006dd8:	00e78c63          	beq	a5,a4,80006df0 <devintr+0x54>
    80006ddc:	01813083          	ld	ra,24(sp)
    80006de0:	01013403          	ld	s0,16(sp)
    80006de4:	00813483          	ld	s1,8(sp)
    80006de8:	02010113          	addi	sp,sp,32
    80006dec:	00008067          	ret
    80006df0:	00000097          	auipc	ra,0x0
    80006df4:	c8c080e7          	jalr	-884(ra) # 80006a7c <cpuid>
    80006df8:	06050663          	beqz	a0,80006e64 <devintr+0xc8>
    80006dfc:	144027f3          	csrr	a5,sip
    80006e00:	ffd7f793          	andi	a5,a5,-3
    80006e04:	14479073          	csrw	sip,a5
    80006e08:	01813083          	ld	ra,24(sp)
    80006e0c:	01013403          	ld	s0,16(sp)
    80006e10:	00813483          	ld	s1,8(sp)
    80006e14:	00200513          	li	a0,2
    80006e18:	02010113          	addi	sp,sp,32
    80006e1c:	00008067          	ret
    80006e20:	00000097          	auipc	ra,0x0
    80006e24:	254080e7          	jalr	596(ra) # 80007074 <plic_claim>
    80006e28:	00a00793          	li	a5,10
    80006e2c:	00050493          	mv	s1,a0
    80006e30:	06f50663          	beq	a0,a5,80006e9c <devintr+0x100>
    80006e34:	00100513          	li	a0,1
    80006e38:	fa0482e3          	beqz	s1,80006ddc <devintr+0x40>
    80006e3c:	00048593          	mv	a1,s1
    80006e40:	00003517          	auipc	a0,0x3
    80006e44:	84050513          	addi	a0,a0,-1984 # 80009680 <CONSOLE_STATUS+0x670>
    80006e48:	00000097          	auipc	ra,0x0
    80006e4c:	670080e7          	jalr	1648(ra) # 800074b8 <__printf>
    80006e50:	00048513          	mv	a0,s1
    80006e54:	00000097          	auipc	ra,0x0
    80006e58:	258080e7          	jalr	600(ra) # 800070ac <plic_complete>
    80006e5c:	00100513          	li	a0,1
    80006e60:	f7dff06f          	j	80006ddc <devintr+0x40>
    80006e64:	00006517          	auipc	a0,0x6
    80006e68:	dcc50513          	addi	a0,a0,-564 # 8000cc30 <tickslock>
    80006e6c:	00001097          	auipc	ra,0x1
    80006e70:	320080e7          	jalr	800(ra) # 8000818c <acquire>
    80006e74:	00005717          	auipc	a4,0x5
    80006e78:	c5070713          	addi	a4,a4,-944 # 8000bac4 <ticks>
    80006e7c:	00072783          	lw	a5,0(a4)
    80006e80:	00006517          	auipc	a0,0x6
    80006e84:	db050513          	addi	a0,a0,-592 # 8000cc30 <tickslock>
    80006e88:	0017879b          	addiw	a5,a5,1
    80006e8c:	00f72023          	sw	a5,0(a4)
    80006e90:	00001097          	auipc	ra,0x1
    80006e94:	3c8080e7          	jalr	968(ra) # 80008258 <release>
    80006e98:	f65ff06f          	j	80006dfc <devintr+0x60>
    80006e9c:	00001097          	auipc	ra,0x1
    80006ea0:	f24080e7          	jalr	-220(ra) # 80007dc0 <uartintr>
    80006ea4:	fadff06f          	j	80006e50 <devintr+0xb4>
	...

0000000080006eb0 <kernelvec>:
    80006eb0:	f0010113          	addi	sp,sp,-256
    80006eb4:	00113023          	sd	ra,0(sp)
    80006eb8:	00213423          	sd	sp,8(sp)
    80006ebc:	00313823          	sd	gp,16(sp)
    80006ec0:	00413c23          	sd	tp,24(sp)
    80006ec4:	02513023          	sd	t0,32(sp)
    80006ec8:	02613423          	sd	t1,40(sp)
    80006ecc:	02713823          	sd	t2,48(sp)
    80006ed0:	02813c23          	sd	s0,56(sp)
    80006ed4:	04913023          	sd	s1,64(sp)
    80006ed8:	04a13423          	sd	a0,72(sp)
    80006edc:	04b13823          	sd	a1,80(sp)
    80006ee0:	04c13c23          	sd	a2,88(sp)
    80006ee4:	06d13023          	sd	a3,96(sp)
    80006ee8:	06e13423          	sd	a4,104(sp)
    80006eec:	06f13823          	sd	a5,112(sp)
    80006ef0:	07013c23          	sd	a6,120(sp)
    80006ef4:	09113023          	sd	a7,128(sp)
    80006ef8:	09213423          	sd	s2,136(sp)
    80006efc:	09313823          	sd	s3,144(sp)
    80006f00:	09413c23          	sd	s4,152(sp)
    80006f04:	0b513023          	sd	s5,160(sp)
    80006f08:	0b613423          	sd	s6,168(sp)
    80006f0c:	0b713823          	sd	s7,176(sp)
    80006f10:	0b813c23          	sd	s8,184(sp)
    80006f14:	0d913023          	sd	s9,192(sp)
    80006f18:	0da13423          	sd	s10,200(sp)
    80006f1c:	0db13823          	sd	s11,208(sp)
    80006f20:	0dc13c23          	sd	t3,216(sp)
    80006f24:	0fd13023          	sd	t4,224(sp)
    80006f28:	0fe13423          	sd	t5,232(sp)
    80006f2c:	0ff13823          	sd	t6,240(sp)
    80006f30:	ccdff0ef          	jal	ra,80006bfc <kerneltrap>
    80006f34:	00013083          	ld	ra,0(sp)
    80006f38:	00813103          	ld	sp,8(sp)
    80006f3c:	01013183          	ld	gp,16(sp)
    80006f40:	02013283          	ld	t0,32(sp)
    80006f44:	02813303          	ld	t1,40(sp)
    80006f48:	03013383          	ld	t2,48(sp)
    80006f4c:	03813403          	ld	s0,56(sp)
    80006f50:	04013483          	ld	s1,64(sp)
    80006f54:	04813503          	ld	a0,72(sp)
    80006f58:	05013583          	ld	a1,80(sp)
    80006f5c:	05813603          	ld	a2,88(sp)
    80006f60:	06013683          	ld	a3,96(sp)
    80006f64:	06813703          	ld	a4,104(sp)
    80006f68:	07013783          	ld	a5,112(sp)
    80006f6c:	07813803          	ld	a6,120(sp)
    80006f70:	08013883          	ld	a7,128(sp)
    80006f74:	08813903          	ld	s2,136(sp)
    80006f78:	09013983          	ld	s3,144(sp)
    80006f7c:	09813a03          	ld	s4,152(sp)
    80006f80:	0a013a83          	ld	s5,160(sp)
    80006f84:	0a813b03          	ld	s6,168(sp)
    80006f88:	0b013b83          	ld	s7,176(sp)
    80006f8c:	0b813c03          	ld	s8,184(sp)
    80006f90:	0c013c83          	ld	s9,192(sp)
    80006f94:	0c813d03          	ld	s10,200(sp)
    80006f98:	0d013d83          	ld	s11,208(sp)
    80006f9c:	0d813e03          	ld	t3,216(sp)
    80006fa0:	0e013e83          	ld	t4,224(sp)
    80006fa4:	0e813f03          	ld	t5,232(sp)
    80006fa8:	0f013f83          	ld	t6,240(sp)
    80006fac:	10010113          	addi	sp,sp,256
    80006fb0:	10200073          	sret
    80006fb4:	00000013          	nop
    80006fb8:	00000013          	nop
    80006fbc:	00000013          	nop

0000000080006fc0 <timervec>:
    80006fc0:	34051573          	csrrw	a0,mscratch,a0
    80006fc4:	00b53023          	sd	a1,0(a0)
    80006fc8:	00c53423          	sd	a2,8(a0)
    80006fcc:	00d53823          	sd	a3,16(a0)
    80006fd0:	01853583          	ld	a1,24(a0)
    80006fd4:	02053603          	ld	a2,32(a0)
    80006fd8:	0005b683          	ld	a3,0(a1)
    80006fdc:	00c686b3          	add	a3,a3,a2
    80006fe0:	00d5b023          	sd	a3,0(a1)
    80006fe4:	00200593          	li	a1,2
    80006fe8:	14459073          	csrw	sip,a1
    80006fec:	01053683          	ld	a3,16(a0)
    80006ff0:	00853603          	ld	a2,8(a0)
    80006ff4:	00053583          	ld	a1,0(a0)
    80006ff8:	34051573          	csrrw	a0,mscratch,a0
    80006ffc:	30200073          	mret

0000000080007000 <plicinit>:
    80007000:	ff010113          	addi	sp,sp,-16
    80007004:	00813423          	sd	s0,8(sp)
    80007008:	01010413          	addi	s0,sp,16
    8000700c:	00813403          	ld	s0,8(sp)
    80007010:	0c0007b7          	lui	a5,0xc000
    80007014:	00100713          	li	a4,1
    80007018:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000701c:	00e7a223          	sw	a4,4(a5)
    80007020:	01010113          	addi	sp,sp,16
    80007024:	00008067          	ret

0000000080007028 <plicinithart>:
    80007028:	ff010113          	addi	sp,sp,-16
    8000702c:	00813023          	sd	s0,0(sp)
    80007030:	00113423          	sd	ra,8(sp)
    80007034:	01010413          	addi	s0,sp,16
    80007038:	00000097          	auipc	ra,0x0
    8000703c:	a44080e7          	jalr	-1468(ra) # 80006a7c <cpuid>
    80007040:	0085171b          	slliw	a4,a0,0x8
    80007044:	0c0027b7          	lui	a5,0xc002
    80007048:	00e787b3          	add	a5,a5,a4
    8000704c:	40200713          	li	a4,1026
    80007050:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007054:	00813083          	ld	ra,8(sp)
    80007058:	00013403          	ld	s0,0(sp)
    8000705c:	00d5151b          	slliw	a0,a0,0xd
    80007060:	0c2017b7          	lui	a5,0xc201
    80007064:	00a78533          	add	a0,a5,a0
    80007068:	00052023          	sw	zero,0(a0)
    8000706c:	01010113          	addi	sp,sp,16
    80007070:	00008067          	ret

0000000080007074 <plic_claim>:
    80007074:	ff010113          	addi	sp,sp,-16
    80007078:	00813023          	sd	s0,0(sp)
    8000707c:	00113423          	sd	ra,8(sp)
    80007080:	01010413          	addi	s0,sp,16
    80007084:	00000097          	auipc	ra,0x0
    80007088:	9f8080e7          	jalr	-1544(ra) # 80006a7c <cpuid>
    8000708c:	00813083          	ld	ra,8(sp)
    80007090:	00013403          	ld	s0,0(sp)
    80007094:	00d5151b          	slliw	a0,a0,0xd
    80007098:	0c2017b7          	lui	a5,0xc201
    8000709c:	00a78533          	add	a0,a5,a0
    800070a0:	00452503          	lw	a0,4(a0)
    800070a4:	01010113          	addi	sp,sp,16
    800070a8:	00008067          	ret

00000000800070ac <plic_complete>:
    800070ac:	fe010113          	addi	sp,sp,-32
    800070b0:	00813823          	sd	s0,16(sp)
    800070b4:	00913423          	sd	s1,8(sp)
    800070b8:	00113c23          	sd	ra,24(sp)
    800070bc:	02010413          	addi	s0,sp,32
    800070c0:	00050493          	mv	s1,a0
    800070c4:	00000097          	auipc	ra,0x0
    800070c8:	9b8080e7          	jalr	-1608(ra) # 80006a7c <cpuid>
    800070cc:	01813083          	ld	ra,24(sp)
    800070d0:	01013403          	ld	s0,16(sp)
    800070d4:	00d5179b          	slliw	a5,a0,0xd
    800070d8:	0c201737          	lui	a4,0xc201
    800070dc:	00f707b3          	add	a5,a4,a5
    800070e0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800070e4:	00813483          	ld	s1,8(sp)
    800070e8:	02010113          	addi	sp,sp,32
    800070ec:	00008067          	ret

00000000800070f0 <consolewrite>:
    800070f0:	fb010113          	addi	sp,sp,-80
    800070f4:	04813023          	sd	s0,64(sp)
    800070f8:	04113423          	sd	ra,72(sp)
    800070fc:	02913c23          	sd	s1,56(sp)
    80007100:	03213823          	sd	s2,48(sp)
    80007104:	03313423          	sd	s3,40(sp)
    80007108:	03413023          	sd	s4,32(sp)
    8000710c:	01513c23          	sd	s5,24(sp)
    80007110:	05010413          	addi	s0,sp,80
    80007114:	06c05c63          	blez	a2,8000718c <consolewrite+0x9c>
    80007118:	00060993          	mv	s3,a2
    8000711c:	00050a13          	mv	s4,a0
    80007120:	00058493          	mv	s1,a1
    80007124:	00000913          	li	s2,0
    80007128:	fff00a93          	li	s5,-1
    8000712c:	01c0006f          	j	80007148 <consolewrite+0x58>
    80007130:	fbf44503          	lbu	a0,-65(s0)
    80007134:	0019091b          	addiw	s2,s2,1
    80007138:	00148493          	addi	s1,s1,1
    8000713c:	00001097          	auipc	ra,0x1
    80007140:	a9c080e7          	jalr	-1380(ra) # 80007bd8 <uartputc>
    80007144:	03298063          	beq	s3,s2,80007164 <consolewrite+0x74>
    80007148:	00048613          	mv	a2,s1
    8000714c:	00100693          	li	a3,1
    80007150:	000a0593          	mv	a1,s4
    80007154:	fbf40513          	addi	a0,s0,-65
    80007158:	00000097          	auipc	ra,0x0
    8000715c:	9dc080e7          	jalr	-1572(ra) # 80006b34 <either_copyin>
    80007160:	fd5518e3          	bne	a0,s5,80007130 <consolewrite+0x40>
    80007164:	04813083          	ld	ra,72(sp)
    80007168:	04013403          	ld	s0,64(sp)
    8000716c:	03813483          	ld	s1,56(sp)
    80007170:	02813983          	ld	s3,40(sp)
    80007174:	02013a03          	ld	s4,32(sp)
    80007178:	01813a83          	ld	s5,24(sp)
    8000717c:	00090513          	mv	a0,s2
    80007180:	03013903          	ld	s2,48(sp)
    80007184:	05010113          	addi	sp,sp,80
    80007188:	00008067          	ret
    8000718c:	00000913          	li	s2,0
    80007190:	fd5ff06f          	j	80007164 <consolewrite+0x74>

0000000080007194 <consoleread>:
    80007194:	f9010113          	addi	sp,sp,-112
    80007198:	06813023          	sd	s0,96(sp)
    8000719c:	04913c23          	sd	s1,88(sp)
    800071a0:	05213823          	sd	s2,80(sp)
    800071a4:	05313423          	sd	s3,72(sp)
    800071a8:	05413023          	sd	s4,64(sp)
    800071ac:	03513c23          	sd	s5,56(sp)
    800071b0:	03613823          	sd	s6,48(sp)
    800071b4:	03713423          	sd	s7,40(sp)
    800071b8:	03813023          	sd	s8,32(sp)
    800071bc:	06113423          	sd	ra,104(sp)
    800071c0:	01913c23          	sd	s9,24(sp)
    800071c4:	07010413          	addi	s0,sp,112
    800071c8:	00060b93          	mv	s7,a2
    800071cc:	00050913          	mv	s2,a0
    800071d0:	00058c13          	mv	s8,a1
    800071d4:	00060b1b          	sext.w	s6,a2
    800071d8:	00006497          	auipc	s1,0x6
    800071dc:	a8048493          	addi	s1,s1,-1408 # 8000cc58 <cons>
    800071e0:	00400993          	li	s3,4
    800071e4:	fff00a13          	li	s4,-1
    800071e8:	00a00a93          	li	s5,10
    800071ec:	05705e63          	blez	s7,80007248 <consoleread+0xb4>
    800071f0:	09c4a703          	lw	a4,156(s1)
    800071f4:	0984a783          	lw	a5,152(s1)
    800071f8:	0007071b          	sext.w	a4,a4
    800071fc:	08e78463          	beq	a5,a4,80007284 <consoleread+0xf0>
    80007200:	07f7f713          	andi	a4,a5,127
    80007204:	00e48733          	add	a4,s1,a4
    80007208:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000720c:	0017869b          	addiw	a3,a5,1
    80007210:	08d4ac23          	sw	a3,152(s1)
    80007214:	00070c9b          	sext.w	s9,a4
    80007218:	0b370663          	beq	a4,s3,800072c4 <consoleread+0x130>
    8000721c:	00100693          	li	a3,1
    80007220:	f9f40613          	addi	a2,s0,-97
    80007224:	000c0593          	mv	a1,s8
    80007228:	00090513          	mv	a0,s2
    8000722c:	f8e40fa3          	sb	a4,-97(s0)
    80007230:	00000097          	auipc	ra,0x0
    80007234:	8b8080e7          	jalr	-1864(ra) # 80006ae8 <either_copyout>
    80007238:	01450863          	beq	a0,s4,80007248 <consoleread+0xb4>
    8000723c:	001c0c13          	addi	s8,s8,1
    80007240:	fffb8b9b          	addiw	s7,s7,-1
    80007244:	fb5c94e3          	bne	s9,s5,800071ec <consoleread+0x58>
    80007248:	000b851b          	sext.w	a0,s7
    8000724c:	06813083          	ld	ra,104(sp)
    80007250:	06013403          	ld	s0,96(sp)
    80007254:	05813483          	ld	s1,88(sp)
    80007258:	05013903          	ld	s2,80(sp)
    8000725c:	04813983          	ld	s3,72(sp)
    80007260:	04013a03          	ld	s4,64(sp)
    80007264:	03813a83          	ld	s5,56(sp)
    80007268:	02813b83          	ld	s7,40(sp)
    8000726c:	02013c03          	ld	s8,32(sp)
    80007270:	01813c83          	ld	s9,24(sp)
    80007274:	40ab053b          	subw	a0,s6,a0
    80007278:	03013b03          	ld	s6,48(sp)
    8000727c:	07010113          	addi	sp,sp,112
    80007280:	00008067          	ret
    80007284:	00001097          	auipc	ra,0x1
    80007288:	1d8080e7          	jalr	472(ra) # 8000845c <push_on>
    8000728c:	0984a703          	lw	a4,152(s1)
    80007290:	09c4a783          	lw	a5,156(s1)
    80007294:	0007879b          	sext.w	a5,a5
    80007298:	fef70ce3          	beq	a4,a5,80007290 <consoleread+0xfc>
    8000729c:	00001097          	auipc	ra,0x1
    800072a0:	234080e7          	jalr	564(ra) # 800084d0 <pop_on>
    800072a4:	0984a783          	lw	a5,152(s1)
    800072a8:	07f7f713          	andi	a4,a5,127
    800072ac:	00e48733          	add	a4,s1,a4
    800072b0:	01874703          	lbu	a4,24(a4)
    800072b4:	0017869b          	addiw	a3,a5,1
    800072b8:	08d4ac23          	sw	a3,152(s1)
    800072bc:	00070c9b          	sext.w	s9,a4
    800072c0:	f5371ee3          	bne	a4,s3,8000721c <consoleread+0x88>
    800072c4:	000b851b          	sext.w	a0,s7
    800072c8:	f96bf2e3          	bgeu	s7,s6,8000724c <consoleread+0xb8>
    800072cc:	08f4ac23          	sw	a5,152(s1)
    800072d0:	f7dff06f          	j	8000724c <consoleread+0xb8>

00000000800072d4 <consputc>:
    800072d4:	10000793          	li	a5,256
    800072d8:	00f50663          	beq	a0,a5,800072e4 <consputc+0x10>
    800072dc:	00001317          	auipc	t1,0x1
    800072e0:	9f430067          	jr	-1548(t1) # 80007cd0 <uartputc_sync>
    800072e4:	ff010113          	addi	sp,sp,-16
    800072e8:	00113423          	sd	ra,8(sp)
    800072ec:	00813023          	sd	s0,0(sp)
    800072f0:	01010413          	addi	s0,sp,16
    800072f4:	00800513          	li	a0,8
    800072f8:	00001097          	auipc	ra,0x1
    800072fc:	9d8080e7          	jalr	-1576(ra) # 80007cd0 <uartputc_sync>
    80007300:	02000513          	li	a0,32
    80007304:	00001097          	auipc	ra,0x1
    80007308:	9cc080e7          	jalr	-1588(ra) # 80007cd0 <uartputc_sync>
    8000730c:	00013403          	ld	s0,0(sp)
    80007310:	00813083          	ld	ra,8(sp)
    80007314:	00800513          	li	a0,8
    80007318:	01010113          	addi	sp,sp,16
    8000731c:	00001317          	auipc	t1,0x1
    80007320:	9b430067          	jr	-1612(t1) # 80007cd0 <uartputc_sync>

0000000080007324 <consoleintr>:
    80007324:	fe010113          	addi	sp,sp,-32
    80007328:	00813823          	sd	s0,16(sp)
    8000732c:	00913423          	sd	s1,8(sp)
    80007330:	01213023          	sd	s2,0(sp)
    80007334:	00113c23          	sd	ra,24(sp)
    80007338:	02010413          	addi	s0,sp,32
    8000733c:	00006917          	auipc	s2,0x6
    80007340:	91c90913          	addi	s2,s2,-1764 # 8000cc58 <cons>
    80007344:	00050493          	mv	s1,a0
    80007348:	00090513          	mv	a0,s2
    8000734c:	00001097          	auipc	ra,0x1
    80007350:	e40080e7          	jalr	-448(ra) # 8000818c <acquire>
    80007354:	02048c63          	beqz	s1,8000738c <consoleintr+0x68>
    80007358:	0a092783          	lw	a5,160(s2)
    8000735c:	09892703          	lw	a4,152(s2)
    80007360:	07f00693          	li	a3,127
    80007364:	40e7873b          	subw	a4,a5,a4
    80007368:	02e6e263          	bltu	a3,a4,8000738c <consoleintr+0x68>
    8000736c:	00d00713          	li	a4,13
    80007370:	04e48063          	beq	s1,a4,800073b0 <consoleintr+0x8c>
    80007374:	07f7f713          	andi	a4,a5,127
    80007378:	00e90733          	add	a4,s2,a4
    8000737c:	0017879b          	addiw	a5,a5,1
    80007380:	0af92023          	sw	a5,160(s2)
    80007384:	00970c23          	sb	s1,24(a4)
    80007388:	08f92e23          	sw	a5,156(s2)
    8000738c:	01013403          	ld	s0,16(sp)
    80007390:	01813083          	ld	ra,24(sp)
    80007394:	00813483          	ld	s1,8(sp)
    80007398:	00013903          	ld	s2,0(sp)
    8000739c:	00006517          	auipc	a0,0x6
    800073a0:	8bc50513          	addi	a0,a0,-1860 # 8000cc58 <cons>
    800073a4:	02010113          	addi	sp,sp,32
    800073a8:	00001317          	auipc	t1,0x1
    800073ac:	eb030067          	jr	-336(t1) # 80008258 <release>
    800073b0:	00a00493          	li	s1,10
    800073b4:	fc1ff06f          	j	80007374 <consoleintr+0x50>

00000000800073b8 <consoleinit>:
    800073b8:	fe010113          	addi	sp,sp,-32
    800073bc:	00113c23          	sd	ra,24(sp)
    800073c0:	00813823          	sd	s0,16(sp)
    800073c4:	00913423          	sd	s1,8(sp)
    800073c8:	02010413          	addi	s0,sp,32
    800073cc:	00006497          	auipc	s1,0x6
    800073d0:	88c48493          	addi	s1,s1,-1908 # 8000cc58 <cons>
    800073d4:	00048513          	mv	a0,s1
    800073d8:	00002597          	auipc	a1,0x2
    800073dc:	30058593          	addi	a1,a1,768 # 800096d8 <CONSOLE_STATUS+0x6c8>
    800073e0:	00001097          	auipc	ra,0x1
    800073e4:	d88080e7          	jalr	-632(ra) # 80008168 <initlock>
    800073e8:	00000097          	auipc	ra,0x0
    800073ec:	7ac080e7          	jalr	1964(ra) # 80007b94 <uartinit>
    800073f0:	01813083          	ld	ra,24(sp)
    800073f4:	01013403          	ld	s0,16(sp)
    800073f8:	00000797          	auipc	a5,0x0
    800073fc:	d9c78793          	addi	a5,a5,-612 # 80007194 <consoleread>
    80007400:	0af4bc23          	sd	a5,184(s1)
    80007404:	00000797          	auipc	a5,0x0
    80007408:	cec78793          	addi	a5,a5,-788 # 800070f0 <consolewrite>
    8000740c:	0cf4b023          	sd	a5,192(s1)
    80007410:	00813483          	ld	s1,8(sp)
    80007414:	02010113          	addi	sp,sp,32
    80007418:	00008067          	ret

000000008000741c <console_read>:
    8000741c:	ff010113          	addi	sp,sp,-16
    80007420:	00813423          	sd	s0,8(sp)
    80007424:	01010413          	addi	s0,sp,16
    80007428:	00813403          	ld	s0,8(sp)
    8000742c:	00006317          	auipc	t1,0x6
    80007430:	8e433303          	ld	t1,-1820(t1) # 8000cd10 <devsw+0x10>
    80007434:	01010113          	addi	sp,sp,16
    80007438:	00030067          	jr	t1

000000008000743c <console_write>:
    8000743c:	ff010113          	addi	sp,sp,-16
    80007440:	00813423          	sd	s0,8(sp)
    80007444:	01010413          	addi	s0,sp,16
    80007448:	00813403          	ld	s0,8(sp)
    8000744c:	00006317          	auipc	t1,0x6
    80007450:	8cc33303          	ld	t1,-1844(t1) # 8000cd18 <devsw+0x18>
    80007454:	01010113          	addi	sp,sp,16
    80007458:	00030067          	jr	t1

000000008000745c <panic>:
    8000745c:	fe010113          	addi	sp,sp,-32
    80007460:	00113c23          	sd	ra,24(sp)
    80007464:	00813823          	sd	s0,16(sp)
    80007468:	00913423          	sd	s1,8(sp)
    8000746c:	02010413          	addi	s0,sp,32
    80007470:	00050493          	mv	s1,a0
    80007474:	00002517          	auipc	a0,0x2
    80007478:	26c50513          	addi	a0,a0,620 # 800096e0 <CONSOLE_STATUS+0x6d0>
    8000747c:	00006797          	auipc	a5,0x6
    80007480:	9207ae23          	sw	zero,-1732(a5) # 8000cdb8 <pr+0x18>
    80007484:	00000097          	auipc	ra,0x0
    80007488:	034080e7          	jalr	52(ra) # 800074b8 <__printf>
    8000748c:	00048513          	mv	a0,s1
    80007490:	00000097          	auipc	ra,0x0
    80007494:	028080e7          	jalr	40(ra) # 800074b8 <__printf>
    80007498:	00002517          	auipc	a0,0x2
    8000749c:	cc850513          	addi	a0,a0,-824 # 80009160 <CONSOLE_STATUS+0x150>
    800074a0:	00000097          	auipc	ra,0x0
    800074a4:	018080e7          	jalr	24(ra) # 800074b8 <__printf>
    800074a8:	00100793          	li	a5,1
    800074ac:	00004717          	auipc	a4,0x4
    800074b0:	60f72e23          	sw	a5,1564(a4) # 8000bac8 <panicked>
    800074b4:	0000006f          	j	800074b4 <panic+0x58>

00000000800074b8 <__printf>:
    800074b8:	f3010113          	addi	sp,sp,-208
    800074bc:	08813023          	sd	s0,128(sp)
    800074c0:	07313423          	sd	s3,104(sp)
    800074c4:	09010413          	addi	s0,sp,144
    800074c8:	05813023          	sd	s8,64(sp)
    800074cc:	08113423          	sd	ra,136(sp)
    800074d0:	06913c23          	sd	s1,120(sp)
    800074d4:	07213823          	sd	s2,112(sp)
    800074d8:	07413023          	sd	s4,96(sp)
    800074dc:	05513c23          	sd	s5,88(sp)
    800074e0:	05613823          	sd	s6,80(sp)
    800074e4:	05713423          	sd	s7,72(sp)
    800074e8:	03913c23          	sd	s9,56(sp)
    800074ec:	03a13823          	sd	s10,48(sp)
    800074f0:	03b13423          	sd	s11,40(sp)
    800074f4:	00006317          	auipc	t1,0x6
    800074f8:	8ac30313          	addi	t1,t1,-1876 # 8000cda0 <pr>
    800074fc:	01832c03          	lw	s8,24(t1)
    80007500:	00b43423          	sd	a1,8(s0)
    80007504:	00c43823          	sd	a2,16(s0)
    80007508:	00d43c23          	sd	a3,24(s0)
    8000750c:	02e43023          	sd	a4,32(s0)
    80007510:	02f43423          	sd	a5,40(s0)
    80007514:	03043823          	sd	a6,48(s0)
    80007518:	03143c23          	sd	a7,56(s0)
    8000751c:	00050993          	mv	s3,a0
    80007520:	4a0c1663          	bnez	s8,800079cc <__printf+0x514>
    80007524:	60098c63          	beqz	s3,80007b3c <__printf+0x684>
    80007528:	0009c503          	lbu	a0,0(s3)
    8000752c:	00840793          	addi	a5,s0,8
    80007530:	f6f43c23          	sd	a5,-136(s0)
    80007534:	00000493          	li	s1,0
    80007538:	22050063          	beqz	a0,80007758 <__printf+0x2a0>
    8000753c:	00002a37          	lui	s4,0x2
    80007540:	00018ab7          	lui	s5,0x18
    80007544:	000f4b37          	lui	s6,0xf4
    80007548:	00989bb7          	lui	s7,0x989
    8000754c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007550:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007554:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007558:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000755c:	00148c9b          	addiw	s9,s1,1
    80007560:	02500793          	li	a5,37
    80007564:	01998933          	add	s2,s3,s9
    80007568:	38f51263          	bne	a0,a5,800078ec <__printf+0x434>
    8000756c:	00094783          	lbu	a5,0(s2)
    80007570:	00078c9b          	sext.w	s9,a5
    80007574:	1e078263          	beqz	a5,80007758 <__printf+0x2a0>
    80007578:	0024849b          	addiw	s1,s1,2
    8000757c:	07000713          	li	a4,112
    80007580:	00998933          	add	s2,s3,s1
    80007584:	38e78a63          	beq	a5,a4,80007918 <__printf+0x460>
    80007588:	20f76863          	bltu	a4,a5,80007798 <__printf+0x2e0>
    8000758c:	42a78863          	beq	a5,a0,800079bc <__printf+0x504>
    80007590:	06400713          	li	a4,100
    80007594:	40e79663          	bne	a5,a4,800079a0 <__printf+0x4e8>
    80007598:	f7843783          	ld	a5,-136(s0)
    8000759c:	0007a603          	lw	a2,0(a5)
    800075a0:	00878793          	addi	a5,a5,8
    800075a4:	f6f43c23          	sd	a5,-136(s0)
    800075a8:	42064a63          	bltz	a2,800079dc <__printf+0x524>
    800075ac:	00a00713          	li	a4,10
    800075b0:	02e677bb          	remuw	a5,a2,a4
    800075b4:	00002d97          	auipc	s11,0x2
    800075b8:	154d8d93          	addi	s11,s11,340 # 80009708 <digits>
    800075bc:	00900593          	li	a1,9
    800075c0:	0006051b          	sext.w	a0,a2
    800075c4:	00000c93          	li	s9,0
    800075c8:	02079793          	slli	a5,a5,0x20
    800075cc:	0207d793          	srli	a5,a5,0x20
    800075d0:	00fd87b3          	add	a5,s11,a5
    800075d4:	0007c783          	lbu	a5,0(a5)
    800075d8:	02e656bb          	divuw	a3,a2,a4
    800075dc:	f8f40023          	sb	a5,-128(s0)
    800075e0:	14c5d863          	bge	a1,a2,80007730 <__printf+0x278>
    800075e4:	06300593          	li	a1,99
    800075e8:	00100c93          	li	s9,1
    800075ec:	02e6f7bb          	remuw	a5,a3,a4
    800075f0:	02079793          	slli	a5,a5,0x20
    800075f4:	0207d793          	srli	a5,a5,0x20
    800075f8:	00fd87b3          	add	a5,s11,a5
    800075fc:	0007c783          	lbu	a5,0(a5)
    80007600:	02e6d73b          	divuw	a4,a3,a4
    80007604:	f8f400a3          	sb	a5,-127(s0)
    80007608:	12a5f463          	bgeu	a1,a0,80007730 <__printf+0x278>
    8000760c:	00a00693          	li	a3,10
    80007610:	00900593          	li	a1,9
    80007614:	02d777bb          	remuw	a5,a4,a3
    80007618:	02079793          	slli	a5,a5,0x20
    8000761c:	0207d793          	srli	a5,a5,0x20
    80007620:	00fd87b3          	add	a5,s11,a5
    80007624:	0007c503          	lbu	a0,0(a5)
    80007628:	02d757bb          	divuw	a5,a4,a3
    8000762c:	f8a40123          	sb	a0,-126(s0)
    80007630:	48e5f263          	bgeu	a1,a4,80007ab4 <__printf+0x5fc>
    80007634:	06300513          	li	a0,99
    80007638:	02d7f5bb          	remuw	a1,a5,a3
    8000763c:	02059593          	slli	a1,a1,0x20
    80007640:	0205d593          	srli	a1,a1,0x20
    80007644:	00bd85b3          	add	a1,s11,a1
    80007648:	0005c583          	lbu	a1,0(a1)
    8000764c:	02d7d7bb          	divuw	a5,a5,a3
    80007650:	f8b401a3          	sb	a1,-125(s0)
    80007654:	48e57263          	bgeu	a0,a4,80007ad8 <__printf+0x620>
    80007658:	3e700513          	li	a0,999
    8000765c:	02d7f5bb          	remuw	a1,a5,a3
    80007660:	02059593          	slli	a1,a1,0x20
    80007664:	0205d593          	srli	a1,a1,0x20
    80007668:	00bd85b3          	add	a1,s11,a1
    8000766c:	0005c583          	lbu	a1,0(a1)
    80007670:	02d7d7bb          	divuw	a5,a5,a3
    80007674:	f8b40223          	sb	a1,-124(s0)
    80007678:	46e57663          	bgeu	a0,a4,80007ae4 <__printf+0x62c>
    8000767c:	02d7f5bb          	remuw	a1,a5,a3
    80007680:	02059593          	slli	a1,a1,0x20
    80007684:	0205d593          	srli	a1,a1,0x20
    80007688:	00bd85b3          	add	a1,s11,a1
    8000768c:	0005c583          	lbu	a1,0(a1)
    80007690:	02d7d7bb          	divuw	a5,a5,a3
    80007694:	f8b402a3          	sb	a1,-123(s0)
    80007698:	46ea7863          	bgeu	s4,a4,80007b08 <__printf+0x650>
    8000769c:	02d7f5bb          	remuw	a1,a5,a3
    800076a0:	02059593          	slli	a1,a1,0x20
    800076a4:	0205d593          	srli	a1,a1,0x20
    800076a8:	00bd85b3          	add	a1,s11,a1
    800076ac:	0005c583          	lbu	a1,0(a1)
    800076b0:	02d7d7bb          	divuw	a5,a5,a3
    800076b4:	f8b40323          	sb	a1,-122(s0)
    800076b8:	3eeaf863          	bgeu	s5,a4,80007aa8 <__printf+0x5f0>
    800076bc:	02d7f5bb          	remuw	a1,a5,a3
    800076c0:	02059593          	slli	a1,a1,0x20
    800076c4:	0205d593          	srli	a1,a1,0x20
    800076c8:	00bd85b3          	add	a1,s11,a1
    800076cc:	0005c583          	lbu	a1,0(a1)
    800076d0:	02d7d7bb          	divuw	a5,a5,a3
    800076d4:	f8b403a3          	sb	a1,-121(s0)
    800076d8:	42eb7e63          	bgeu	s6,a4,80007b14 <__printf+0x65c>
    800076dc:	02d7f5bb          	remuw	a1,a5,a3
    800076e0:	02059593          	slli	a1,a1,0x20
    800076e4:	0205d593          	srli	a1,a1,0x20
    800076e8:	00bd85b3          	add	a1,s11,a1
    800076ec:	0005c583          	lbu	a1,0(a1)
    800076f0:	02d7d7bb          	divuw	a5,a5,a3
    800076f4:	f8b40423          	sb	a1,-120(s0)
    800076f8:	42ebfc63          	bgeu	s7,a4,80007b30 <__printf+0x678>
    800076fc:	02079793          	slli	a5,a5,0x20
    80007700:	0207d793          	srli	a5,a5,0x20
    80007704:	00fd8db3          	add	s11,s11,a5
    80007708:	000dc703          	lbu	a4,0(s11)
    8000770c:	00a00793          	li	a5,10
    80007710:	00900c93          	li	s9,9
    80007714:	f8e404a3          	sb	a4,-119(s0)
    80007718:	00065c63          	bgez	a2,80007730 <__printf+0x278>
    8000771c:	f9040713          	addi	a4,s0,-112
    80007720:	00f70733          	add	a4,a4,a5
    80007724:	02d00693          	li	a3,45
    80007728:	fed70823          	sb	a3,-16(a4)
    8000772c:	00078c93          	mv	s9,a5
    80007730:	f8040793          	addi	a5,s0,-128
    80007734:	01978cb3          	add	s9,a5,s9
    80007738:	f7f40d13          	addi	s10,s0,-129
    8000773c:	000cc503          	lbu	a0,0(s9)
    80007740:	fffc8c93          	addi	s9,s9,-1
    80007744:	00000097          	auipc	ra,0x0
    80007748:	b90080e7          	jalr	-1136(ra) # 800072d4 <consputc>
    8000774c:	ffac98e3          	bne	s9,s10,8000773c <__printf+0x284>
    80007750:	00094503          	lbu	a0,0(s2)
    80007754:	e00514e3          	bnez	a0,8000755c <__printf+0xa4>
    80007758:	1a0c1663          	bnez	s8,80007904 <__printf+0x44c>
    8000775c:	08813083          	ld	ra,136(sp)
    80007760:	08013403          	ld	s0,128(sp)
    80007764:	07813483          	ld	s1,120(sp)
    80007768:	07013903          	ld	s2,112(sp)
    8000776c:	06813983          	ld	s3,104(sp)
    80007770:	06013a03          	ld	s4,96(sp)
    80007774:	05813a83          	ld	s5,88(sp)
    80007778:	05013b03          	ld	s6,80(sp)
    8000777c:	04813b83          	ld	s7,72(sp)
    80007780:	04013c03          	ld	s8,64(sp)
    80007784:	03813c83          	ld	s9,56(sp)
    80007788:	03013d03          	ld	s10,48(sp)
    8000778c:	02813d83          	ld	s11,40(sp)
    80007790:	0d010113          	addi	sp,sp,208
    80007794:	00008067          	ret
    80007798:	07300713          	li	a4,115
    8000779c:	1ce78a63          	beq	a5,a4,80007970 <__printf+0x4b8>
    800077a0:	07800713          	li	a4,120
    800077a4:	1ee79e63          	bne	a5,a4,800079a0 <__printf+0x4e8>
    800077a8:	f7843783          	ld	a5,-136(s0)
    800077ac:	0007a703          	lw	a4,0(a5)
    800077b0:	00878793          	addi	a5,a5,8
    800077b4:	f6f43c23          	sd	a5,-136(s0)
    800077b8:	28074263          	bltz	a4,80007a3c <__printf+0x584>
    800077bc:	00002d97          	auipc	s11,0x2
    800077c0:	f4cd8d93          	addi	s11,s11,-180 # 80009708 <digits>
    800077c4:	00f77793          	andi	a5,a4,15
    800077c8:	00fd87b3          	add	a5,s11,a5
    800077cc:	0007c683          	lbu	a3,0(a5)
    800077d0:	00f00613          	li	a2,15
    800077d4:	0007079b          	sext.w	a5,a4
    800077d8:	f8d40023          	sb	a3,-128(s0)
    800077dc:	0047559b          	srliw	a1,a4,0x4
    800077e0:	0047569b          	srliw	a3,a4,0x4
    800077e4:	00000c93          	li	s9,0
    800077e8:	0ee65063          	bge	a2,a4,800078c8 <__printf+0x410>
    800077ec:	00f6f693          	andi	a3,a3,15
    800077f0:	00dd86b3          	add	a3,s11,a3
    800077f4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800077f8:	0087d79b          	srliw	a5,a5,0x8
    800077fc:	00100c93          	li	s9,1
    80007800:	f8d400a3          	sb	a3,-127(s0)
    80007804:	0cb67263          	bgeu	a2,a1,800078c8 <__printf+0x410>
    80007808:	00f7f693          	andi	a3,a5,15
    8000780c:	00dd86b3          	add	a3,s11,a3
    80007810:	0006c583          	lbu	a1,0(a3)
    80007814:	00f00613          	li	a2,15
    80007818:	0047d69b          	srliw	a3,a5,0x4
    8000781c:	f8b40123          	sb	a1,-126(s0)
    80007820:	0047d593          	srli	a1,a5,0x4
    80007824:	28f67e63          	bgeu	a2,a5,80007ac0 <__printf+0x608>
    80007828:	00f6f693          	andi	a3,a3,15
    8000782c:	00dd86b3          	add	a3,s11,a3
    80007830:	0006c503          	lbu	a0,0(a3)
    80007834:	0087d813          	srli	a6,a5,0x8
    80007838:	0087d69b          	srliw	a3,a5,0x8
    8000783c:	f8a401a3          	sb	a0,-125(s0)
    80007840:	28b67663          	bgeu	a2,a1,80007acc <__printf+0x614>
    80007844:	00f6f693          	andi	a3,a3,15
    80007848:	00dd86b3          	add	a3,s11,a3
    8000784c:	0006c583          	lbu	a1,0(a3)
    80007850:	00c7d513          	srli	a0,a5,0xc
    80007854:	00c7d69b          	srliw	a3,a5,0xc
    80007858:	f8b40223          	sb	a1,-124(s0)
    8000785c:	29067a63          	bgeu	a2,a6,80007af0 <__printf+0x638>
    80007860:	00f6f693          	andi	a3,a3,15
    80007864:	00dd86b3          	add	a3,s11,a3
    80007868:	0006c583          	lbu	a1,0(a3)
    8000786c:	0107d813          	srli	a6,a5,0x10
    80007870:	0107d69b          	srliw	a3,a5,0x10
    80007874:	f8b402a3          	sb	a1,-123(s0)
    80007878:	28a67263          	bgeu	a2,a0,80007afc <__printf+0x644>
    8000787c:	00f6f693          	andi	a3,a3,15
    80007880:	00dd86b3          	add	a3,s11,a3
    80007884:	0006c683          	lbu	a3,0(a3)
    80007888:	0147d79b          	srliw	a5,a5,0x14
    8000788c:	f8d40323          	sb	a3,-122(s0)
    80007890:	21067663          	bgeu	a2,a6,80007a9c <__printf+0x5e4>
    80007894:	02079793          	slli	a5,a5,0x20
    80007898:	0207d793          	srli	a5,a5,0x20
    8000789c:	00fd8db3          	add	s11,s11,a5
    800078a0:	000dc683          	lbu	a3,0(s11)
    800078a4:	00800793          	li	a5,8
    800078a8:	00700c93          	li	s9,7
    800078ac:	f8d403a3          	sb	a3,-121(s0)
    800078b0:	00075c63          	bgez	a4,800078c8 <__printf+0x410>
    800078b4:	f9040713          	addi	a4,s0,-112
    800078b8:	00f70733          	add	a4,a4,a5
    800078bc:	02d00693          	li	a3,45
    800078c0:	fed70823          	sb	a3,-16(a4)
    800078c4:	00078c93          	mv	s9,a5
    800078c8:	f8040793          	addi	a5,s0,-128
    800078cc:	01978cb3          	add	s9,a5,s9
    800078d0:	f7f40d13          	addi	s10,s0,-129
    800078d4:	000cc503          	lbu	a0,0(s9)
    800078d8:	fffc8c93          	addi	s9,s9,-1
    800078dc:	00000097          	auipc	ra,0x0
    800078e0:	9f8080e7          	jalr	-1544(ra) # 800072d4 <consputc>
    800078e4:	ff9d18e3          	bne	s10,s9,800078d4 <__printf+0x41c>
    800078e8:	0100006f          	j	800078f8 <__printf+0x440>
    800078ec:	00000097          	auipc	ra,0x0
    800078f0:	9e8080e7          	jalr	-1560(ra) # 800072d4 <consputc>
    800078f4:	000c8493          	mv	s1,s9
    800078f8:	00094503          	lbu	a0,0(s2)
    800078fc:	c60510e3          	bnez	a0,8000755c <__printf+0xa4>
    80007900:	e40c0ee3          	beqz	s8,8000775c <__printf+0x2a4>
    80007904:	00005517          	auipc	a0,0x5
    80007908:	49c50513          	addi	a0,a0,1180 # 8000cda0 <pr>
    8000790c:	00001097          	auipc	ra,0x1
    80007910:	94c080e7          	jalr	-1716(ra) # 80008258 <release>
    80007914:	e49ff06f          	j	8000775c <__printf+0x2a4>
    80007918:	f7843783          	ld	a5,-136(s0)
    8000791c:	03000513          	li	a0,48
    80007920:	01000d13          	li	s10,16
    80007924:	00878713          	addi	a4,a5,8
    80007928:	0007bc83          	ld	s9,0(a5)
    8000792c:	f6e43c23          	sd	a4,-136(s0)
    80007930:	00000097          	auipc	ra,0x0
    80007934:	9a4080e7          	jalr	-1628(ra) # 800072d4 <consputc>
    80007938:	07800513          	li	a0,120
    8000793c:	00000097          	auipc	ra,0x0
    80007940:	998080e7          	jalr	-1640(ra) # 800072d4 <consputc>
    80007944:	00002d97          	auipc	s11,0x2
    80007948:	dc4d8d93          	addi	s11,s11,-572 # 80009708 <digits>
    8000794c:	03ccd793          	srli	a5,s9,0x3c
    80007950:	00fd87b3          	add	a5,s11,a5
    80007954:	0007c503          	lbu	a0,0(a5)
    80007958:	fffd0d1b          	addiw	s10,s10,-1
    8000795c:	004c9c93          	slli	s9,s9,0x4
    80007960:	00000097          	auipc	ra,0x0
    80007964:	974080e7          	jalr	-1676(ra) # 800072d4 <consputc>
    80007968:	fe0d12e3          	bnez	s10,8000794c <__printf+0x494>
    8000796c:	f8dff06f          	j	800078f8 <__printf+0x440>
    80007970:	f7843783          	ld	a5,-136(s0)
    80007974:	0007bc83          	ld	s9,0(a5)
    80007978:	00878793          	addi	a5,a5,8
    8000797c:	f6f43c23          	sd	a5,-136(s0)
    80007980:	000c9a63          	bnez	s9,80007994 <__printf+0x4dc>
    80007984:	1080006f          	j	80007a8c <__printf+0x5d4>
    80007988:	001c8c93          	addi	s9,s9,1
    8000798c:	00000097          	auipc	ra,0x0
    80007990:	948080e7          	jalr	-1720(ra) # 800072d4 <consputc>
    80007994:	000cc503          	lbu	a0,0(s9)
    80007998:	fe0518e3          	bnez	a0,80007988 <__printf+0x4d0>
    8000799c:	f5dff06f          	j	800078f8 <__printf+0x440>
    800079a0:	02500513          	li	a0,37
    800079a4:	00000097          	auipc	ra,0x0
    800079a8:	930080e7          	jalr	-1744(ra) # 800072d4 <consputc>
    800079ac:	000c8513          	mv	a0,s9
    800079b0:	00000097          	auipc	ra,0x0
    800079b4:	924080e7          	jalr	-1756(ra) # 800072d4 <consputc>
    800079b8:	f41ff06f          	j	800078f8 <__printf+0x440>
    800079bc:	02500513          	li	a0,37
    800079c0:	00000097          	auipc	ra,0x0
    800079c4:	914080e7          	jalr	-1772(ra) # 800072d4 <consputc>
    800079c8:	f31ff06f          	j	800078f8 <__printf+0x440>
    800079cc:	00030513          	mv	a0,t1
    800079d0:	00000097          	auipc	ra,0x0
    800079d4:	7bc080e7          	jalr	1980(ra) # 8000818c <acquire>
    800079d8:	b4dff06f          	j	80007524 <__printf+0x6c>
    800079dc:	40c0053b          	negw	a0,a2
    800079e0:	00a00713          	li	a4,10
    800079e4:	02e576bb          	remuw	a3,a0,a4
    800079e8:	00002d97          	auipc	s11,0x2
    800079ec:	d20d8d93          	addi	s11,s11,-736 # 80009708 <digits>
    800079f0:	ff700593          	li	a1,-9
    800079f4:	02069693          	slli	a3,a3,0x20
    800079f8:	0206d693          	srli	a3,a3,0x20
    800079fc:	00dd86b3          	add	a3,s11,a3
    80007a00:	0006c683          	lbu	a3,0(a3)
    80007a04:	02e557bb          	divuw	a5,a0,a4
    80007a08:	f8d40023          	sb	a3,-128(s0)
    80007a0c:	10b65e63          	bge	a2,a1,80007b28 <__printf+0x670>
    80007a10:	06300593          	li	a1,99
    80007a14:	02e7f6bb          	remuw	a3,a5,a4
    80007a18:	02069693          	slli	a3,a3,0x20
    80007a1c:	0206d693          	srli	a3,a3,0x20
    80007a20:	00dd86b3          	add	a3,s11,a3
    80007a24:	0006c683          	lbu	a3,0(a3)
    80007a28:	02e7d73b          	divuw	a4,a5,a4
    80007a2c:	00200793          	li	a5,2
    80007a30:	f8d400a3          	sb	a3,-127(s0)
    80007a34:	bca5ece3          	bltu	a1,a0,8000760c <__printf+0x154>
    80007a38:	ce5ff06f          	j	8000771c <__printf+0x264>
    80007a3c:	40e007bb          	negw	a5,a4
    80007a40:	00002d97          	auipc	s11,0x2
    80007a44:	cc8d8d93          	addi	s11,s11,-824 # 80009708 <digits>
    80007a48:	00f7f693          	andi	a3,a5,15
    80007a4c:	00dd86b3          	add	a3,s11,a3
    80007a50:	0006c583          	lbu	a1,0(a3)
    80007a54:	ff100613          	li	a2,-15
    80007a58:	0047d69b          	srliw	a3,a5,0x4
    80007a5c:	f8b40023          	sb	a1,-128(s0)
    80007a60:	0047d59b          	srliw	a1,a5,0x4
    80007a64:	0ac75e63          	bge	a4,a2,80007b20 <__printf+0x668>
    80007a68:	00f6f693          	andi	a3,a3,15
    80007a6c:	00dd86b3          	add	a3,s11,a3
    80007a70:	0006c603          	lbu	a2,0(a3)
    80007a74:	00f00693          	li	a3,15
    80007a78:	0087d79b          	srliw	a5,a5,0x8
    80007a7c:	f8c400a3          	sb	a2,-127(s0)
    80007a80:	d8b6e4e3          	bltu	a3,a1,80007808 <__printf+0x350>
    80007a84:	00200793          	li	a5,2
    80007a88:	e2dff06f          	j	800078b4 <__printf+0x3fc>
    80007a8c:	00002c97          	auipc	s9,0x2
    80007a90:	c5cc8c93          	addi	s9,s9,-932 # 800096e8 <CONSOLE_STATUS+0x6d8>
    80007a94:	02800513          	li	a0,40
    80007a98:	ef1ff06f          	j	80007988 <__printf+0x4d0>
    80007a9c:	00700793          	li	a5,7
    80007aa0:	00600c93          	li	s9,6
    80007aa4:	e0dff06f          	j	800078b0 <__printf+0x3f8>
    80007aa8:	00700793          	li	a5,7
    80007aac:	00600c93          	li	s9,6
    80007ab0:	c69ff06f          	j	80007718 <__printf+0x260>
    80007ab4:	00300793          	li	a5,3
    80007ab8:	00200c93          	li	s9,2
    80007abc:	c5dff06f          	j	80007718 <__printf+0x260>
    80007ac0:	00300793          	li	a5,3
    80007ac4:	00200c93          	li	s9,2
    80007ac8:	de9ff06f          	j	800078b0 <__printf+0x3f8>
    80007acc:	00400793          	li	a5,4
    80007ad0:	00300c93          	li	s9,3
    80007ad4:	dddff06f          	j	800078b0 <__printf+0x3f8>
    80007ad8:	00400793          	li	a5,4
    80007adc:	00300c93          	li	s9,3
    80007ae0:	c39ff06f          	j	80007718 <__printf+0x260>
    80007ae4:	00500793          	li	a5,5
    80007ae8:	00400c93          	li	s9,4
    80007aec:	c2dff06f          	j	80007718 <__printf+0x260>
    80007af0:	00500793          	li	a5,5
    80007af4:	00400c93          	li	s9,4
    80007af8:	db9ff06f          	j	800078b0 <__printf+0x3f8>
    80007afc:	00600793          	li	a5,6
    80007b00:	00500c93          	li	s9,5
    80007b04:	dadff06f          	j	800078b0 <__printf+0x3f8>
    80007b08:	00600793          	li	a5,6
    80007b0c:	00500c93          	li	s9,5
    80007b10:	c09ff06f          	j	80007718 <__printf+0x260>
    80007b14:	00800793          	li	a5,8
    80007b18:	00700c93          	li	s9,7
    80007b1c:	bfdff06f          	j	80007718 <__printf+0x260>
    80007b20:	00100793          	li	a5,1
    80007b24:	d91ff06f          	j	800078b4 <__printf+0x3fc>
    80007b28:	00100793          	li	a5,1
    80007b2c:	bf1ff06f          	j	8000771c <__printf+0x264>
    80007b30:	00900793          	li	a5,9
    80007b34:	00800c93          	li	s9,8
    80007b38:	be1ff06f          	j	80007718 <__printf+0x260>
    80007b3c:	00002517          	auipc	a0,0x2
    80007b40:	bb450513          	addi	a0,a0,-1100 # 800096f0 <CONSOLE_STATUS+0x6e0>
    80007b44:	00000097          	auipc	ra,0x0
    80007b48:	918080e7          	jalr	-1768(ra) # 8000745c <panic>

0000000080007b4c <printfinit>:
    80007b4c:	fe010113          	addi	sp,sp,-32
    80007b50:	00813823          	sd	s0,16(sp)
    80007b54:	00913423          	sd	s1,8(sp)
    80007b58:	00113c23          	sd	ra,24(sp)
    80007b5c:	02010413          	addi	s0,sp,32
    80007b60:	00005497          	auipc	s1,0x5
    80007b64:	24048493          	addi	s1,s1,576 # 8000cda0 <pr>
    80007b68:	00048513          	mv	a0,s1
    80007b6c:	00002597          	auipc	a1,0x2
    80007b70:	b9458593          	addi	a1,a1,-1132 # 80009700 <CONSOLE_STATUS+0x6f0>
    80007b74:	00000097          	auipc	ra,0x0
    80007b78:	5f4080e7          	jalr	1524(ra) # 80008168 <initlock>
    80007b7c:	01813083          	ld	ra,24(sp)
    80007b80:	01013403          	ld	s0,16(sp)
    80007b84:	0004ac23          	sw	zero,24(s1)
    80007b88:	00813483          	ld	s1,8(sp)
    80007b8c:	02010113          	addi	sp,sp,32
    80007b90:	00008067          	ret

0000000080007b94 <uartinit>:
    80007b94:	ff010113          	addi	sp,sp,-16
    80007b98:	00813423          	sd	s0,8(sp)
    80007b9c:	01010413          	addi	s0,sp,16
    80007ba0:	100007b7          	lui	a5,0x10000
    80007ba4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007ba8:	f8000713          	li	a4,-128
    80007bac:	00e781a3          	sb	a4,3(a5)
    80007bb0:	00300713          	li	a4,3
    80007bb4:	00e78023          	sb	a4,0(a5)
    80007bb8:	000780a3          	sb	zero,1(a5)
    80007bbc:	00e781a3          	sb	a4,3(a5)
    80007bc0:	00700693          	li	a3,7
    80007bc4:	00d78123          	sb	a3,2(a5)
    80007bc8:	00e780a3          	sb	a4,1(a5)
    80007bcc:	00813403          	ld	s0,8(sp)
    80007bd0:	01010113          	addi	sp,sp,16
    80007bd4:	00008067          	ret

0000000080007bd8 <uartputc>:
    80007bd8:	00004797          	auipc	a5,0x4
    80007bdc:	ef07a783          	lw	a5,-272(a5) # 8000bac8 <panicked>
    80007be0:	00078463          	beqz	a5,80007be8 <uartputc+0x10>
    80007be4:	0000006f          	j	80007be4 <uartputc+0xc>
    80007be8:	fd010113          	addi	sp,sp,-48
    80007bec:	02813023          	sd	s0,32(sp)
    80007bf0:	00913c23          	sd	s1,24(sp)
    80007bf4:	01213823          	sd	s2,16(sp)
    80007bf8:	01313423          	sd	s3,8(sp)
    80007bfc:	02113423          	sd	ra,40(sp)
    80007c00:	03010413          	addi	s0,sp,48
    80007c04:	00004917          	auipc	s2,0x4
    80007c08:	ecc90913          	addi	s2,s2,-308 # 8000bad0 <uart_tx_r>
    80007c0c:	00093783          	ld	a5,0(s2)
    80007c10:	00004497          	auipc	s1,0x4
    80007c14:	ec848493          	addi	s1,s1,-312 # 8000bad8 <uart_tx_w>
    80007c18:	0004b703          	ld	a4,0(s1)
    80007c1c:	02078693          	addi	a3,a5,32
    80007c20:	00050993          	mv	s3,a0
    80007c24:	02e69c63          	bne	a3,a4,80007c5c <uartputc+0x84>
    80007c28:	00001097          	auipc	ra,0x1
    80007c2c:	834080e7          	jalr	-1996(ra) # 8000845c <push_on>
    80007c30:	00093783          	ld	a5,0(s2)
    80007c34:	0004b703          	ld	a4,0(s1)
    80007c38:	02078793          	addi	a5,a5,32
    80007c3c:	00e79463          	bne	a5,a4,80007c44 <uartputc+0x6c>
    80007c40:	0000006f          	j	80007c40 <uartputc+0x68>
    80007c44:	00001097          	auipc	ra,0x1
    80007c48:	88c080e7          	jalr	-1908(ra) # 800084d0 <pop_on>
    80007c4c:	00093783          	ld	a5,0(s2)
    80007c50:	0004b703          	ld	a4,0(s1)
    80007c54:	02078693          	addi	a3,a5,32
    80007c58:	fce688e3          	beq	a3,a4,80007c28 <uartputc+0x50>
    80007c5c:	01f77693          	andi	a3,a4,31
    80007c60:	00005597          	auipc	a1,0x5
    80007c64:	16058593          	addi	a1,a1,352 # 8000cdc0 <uart_tx_buf>
    80007c68:	00d586b3          	add	a3,a1,a3
    80007c6c:	00170713          	addi	a4,a4,1
    80007c70:	01368023          	sb	s3,0(a3)
    80007c74:	00e4b023          	sd	a4,0(s1)
    80007c78:	10000637          	lui	a2,0x10000
    80007c7c:	02f71063          	bne	a4,a5,80007c9c <uartputc+0xc4>
    80007c80:	0340006f          	j	80007cb4 <uartputc+0xdc>
    80007c84:	00074703          	lbu	a4,0(a4)
    80007c88:	00f93023          	sd	a5,0(s2)
    80007c8c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007c90:	00093783          	ld	a5,0(s2)
    80007c94:	0004b703          	ld	a4,0(s1)
    80007c98:	00f70e63          	beq	a4,a5,80007cb4 <uartputc+0xdc>
    80007c9c:	00564683          	lbu	a3,5(a2)
    80007ca0:	01f7f713          	andi	a4,a5,31
    80007ca4:	00e58733          	add	a4,a1,a4
    80007ca8:	0206f693          	andi	a3,a3,32
    80007cac:	00178793          	addi	a5,a5,1
    80007cb0:	fc069ae3          	bnez	a3,80007c84 <uartputc+0xac>
    80007cb4:	02813083          	ld	ra,40(sp)
    80007cb8:	02013403          	ld	s0,32(sp)
    80007cbc:	01813483          	ld	s1,24(sp)
    80007cc0:	01013903          	ld	s2,16(sp)
    80007cc4:	00813983          	ld	s3,8(sp)
    80007cc8:	03010113          	addi	sp,sp,48
    80007ccc:	00008067          	ret

0000000080007cd0 <uartputc_sync>:
    80007cd0:	ff010113          	addi	sp,sp,-16
    80007cd4:	00813423          	sd	s0,8(sp)
    80007cd8:	01010413          	addi	s0,sp,16
    80007cdc:	00004717          	auipc	a4,0x4
    80007ce0:	dec72703          	lw	a4,-532(a4) # 8000bac8 <panicked>
    80007ce4:	02071663          	bnez	a4,80007d10 <uartputc_sync+0x40>
    80007ce8:	00050793          	mv	a5,a0
    80007cec:	100006b7          	lui	a3,0x10000
    80007cf0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007cf4:	02077713          	andi	a4,a4,32
    80007cf8:	fe070ce3          	beqz	a4,80007cf0 <uartputc_sync+0x20>
    80007cfc:	0ff7f793          	andi	a5,a5,255
    80007d00:	00f68023          	sb	a5,0(a3)
    80007d04:	00813403          	ld	s0,8(sp)
    80007d08:	01010113          	addi	sp,sp,16
    80007d0c:	00008067          	ret
    80007d10:	0000006f          	j	80007d10 <uartputc_sync+0x40>

0000000080007d14 <uartstart>:
    80007d14:	ff010113          	addi	sp,sp,-16
    80007d18:	00813423          	sd	s0,8(sp)
    80007d1c:	01010413          	addi	s0,sp,16
    80007d20:	00004617          	auipc	a2,0x4
    80007d24:	db060613          	addi	a2,a2,-592 # 8000bad0 <uart_tx_r>
    80007d28:	00004517          	auipc	a0,0x4
    80007d2c:	db050513          	addi	a0,a0,-592 # 8000bad8 <uart_tx_w>
    80007d30:	00063783          	ld	a5,0(a2)
    80007d34:	00053703          	ld	a4,0(a0)
    80007d38:	04f70263          	beq	a4,a5,80007d7c <uartstart+0x68>
    80007d3c:	100005b7          	lui	a1,0x10000
    80007d40:	00005817          	auipc	a6,0x5
    80007d44:	08080813          	addi	a6,a6,128 # 8000cdc0 <uart_tx_buf>
    80007d48:	01c0006f          	j	80007d64 <uartstart+0x50>
    80007d4c:	0006c703          	lbu	a4,0(a3)
    80007d50:	00f63023          	sd	a5,0(a2)
    80007d54:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007d58:	00063783          	ld	a5,0(a2)
    80007d5c:	00053703          	ld	a4,0(a0)
    80007d60:	00f70e63          	beq	a4,a5,80007d7c <uartstart+0x68>
    80007d64:	01f7f713          	andi	a4,a5,31
    80007d68:	00e806b3          	add	a3,a6,a4
    80007d6c:	0055c703          	lbu	a4,5(a1)
    80007d70:	00178793          	addi	a5,a5,1
    80007d74:	02077713          	andi	a4,a4,32
    80007d78:	fc071ae3          	bnez	a4,80007d4c <uartstart+0x38>
    80007d7c:	00813403          	ld	s0,8(sp)
    80007d80:	01010113          	addi	sp,sp,16
    80007d84:	00008067          	ret

0000000080007d88 <uartgetc>:
    80007d88:	ff010113          	addi	sp,sp,-16
    80007d8c:	00813423          	sd	s0,8(sp)
    80007d90:	01010413          	addi	s0,sp,16
    80007d94:	10000737          	lui	a4,0x10000
    80007d98:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80007d9c:	0017f793          	andi	a5,a5,1
    80007da0:	00078c63          	beqz	a5,80007db8 <uartgetc+0x30>
    80007da4:	00074503          	lbu	a0,0(a4)
    80007da8:	0ff57513          	andi	a0,a0,255
    80007dac:	00813403          	ld	s0,8(sp)
    80007db0:	01010113          	addi	sp,sp,16
    80007db4:	00008067          	ret
    80007db8:	fff00513          	li	a0,-1
    80007dbc:	ff1ff06f          	j	80007dac <uartgetc+0x24>

0000000080007dc0 <uartintr>:
    80007dc0:	100007b7          	lui	a5,0x10000
    80007dc4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007dc8:	0017f793          	andi	a5,a5,1
    80007dcc:	0a078463          	beqz	a5,80007e74 <uartintr+0xb4>
    80007dd0:	fe010113          	addi	sp,sp,-32
    80007dd4:	00813823          	sd	s0,16(sp)
    80007dd8:	00913423          	sd	s1,8(sp)
    80007ddc:	00113c23          	sd	ra,24(sp)
    80007de0:	02010413          	addi	s0,sp,32
    80007de4:	100004b7          	lui	s1,0x10000
    80007de8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80007dec:	0ff57513          	andi	a0,a0,255
    80007df0:	fffff097          	auipc	ra,0xfffff
    80007df4:	534080e7          	jalr	1332(ra) # 80007324 <consoleintr>
    80007df8:	0054c783          	lbu	a5,5(s1)
    80007dfc:	0017f793          	andi	a5,a5,1
    80007e00:	fe0794e3          	bnez	a5,80007de8 <uartintr+0x28>
    80007e04:	00004617          	auipc	a2,0x4
    80007e08:	ccc60613          	addi	a2,a2,-820 # 8000bad0 <uart_tx_r>
    80007e0c:	00004517          	auipc	a0,0x4
    80007e10:	ccc50513          	addi	a0,a0,-820 # 8000bad8 <uart_tx_w>
    80007e14:	00063783          	ld	a5,0(a2)
    80007e18:	00053703          	ld	a4,0(a0)
    80007e1c:	04f70263          	beq	a4,a5,80007e60 <uartintr+0xa0>
    80007e20:	100005b7          	lui	a1,0x10000
    80007e24:	00005817          	auipc	a6,0x5
    80007e28:	f9c80813          	addi	a6,a6,-100 # 8000cdc0 <uart_tx_buf>
    80007e2c:	01c0006f          	j	80007e48 <uartintr+0x88>
    80007e30:	0006c703          	lbu	a4,0(a3)
    80007e34:	00f63023          	sd	a5,0(a2)
    80007e38:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007e3c:	00063783          	ld	a5,0(a2)
    80007e40:	00053703          	ld	a4,0(a0)
    80007e44:	00f70e63          	beq	a4,a5,80007e60 <uartintr+0xa0>
    80007e48:	01f7f713          	andi	a4,a5,31
    80007e4c:	00e806b3          	add	a3,a6,a4
    80007e50:	0055c703          	lbu	a4,5(a1)
    80007e54:	00178793          	addi	a5,a5,1
    80007e58:	02077713          	andi	a4,a4,32
    80007e5c:	fc071ae3          	bnez	a4,80007e30 <uartintr+0x70>
    80007e60:	01813083          	ld	ra,24(sp)
    80007e64:	01013403          	ld	s0,16(sp)
    80007e68:	00813483          	ld	s1,8(sp)
    80007e6c:	02010113          	addi	sp,sp,32
    80007e70:	00008067          	ret
    80007e74:	00004617          	auipc	a2,0x4
    80007e78:	c5c60613          	addi	a2,a2,-932 # 8000bad0 <uart_tx_r>
    80007e7c:	00004517          	auipc	a0,0x4
    80007e80:	c5c50513          	addi	a0,a0,-932 # 8000bad8 <uart_tx_w>
    80007e84:	00063783          	ld	a5,0(a2)
    80007e88:	00053703          	ld	a4,0(a0)
    80007e8c:	04f70263          	beq	a4,a5,80007ed0 <uartintr+0x110>
    80007e90:	100005b7          	lui	a1,0x10000
    80007e94:	00005817          	auipc	a6,0x5
    80007e98:	f2c80813          	addi	a6,a6,-212 # 8000cdc0 <uart_tx_buf>
    80007e9c:	01c0006f          	j	80007eb8 <uartintr+0xf8>
    80007ea0:	0006c703          	lbu	a4,0(a3)
    80007ea4:	00f63023          	sd	a5,0(a2)
    80007ea8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007eac:	00063783          	ld	a5,0(a2)
    80007eb0:	00053703          	ld	a4,0(a0)
    80007eb4:	02f70063          	beq	a4,a5,80007ed4 <uartintr+0x114>
    80007eb8:	01f7f713          	andi	a4,a5,31
    80007ebc:	00e806b3          	add	a3,a6,a4
    80007ec0:	0055c703          	lbu	a4,5(a1)
    80007ec4:	00178793          	addi	a5,a5,1
    80007ec8:	02077713          	andi	a4,a4,32
    80007ecc:	fc071ae3          	bnez	a4,80007ea0 <uartintr+0xe0>
    80007ed0:	00008067          	ret
    80007ed4:	00008067          	ret

0000000080007ed8 <kinit>:
    80007ed8:	fc010113          	addi	sp,sp,-64
    80007edc:	02913423          	sd	s1,40(sp)
    80007ee0:	fffff7b7          	lui	a5,0xfffff
    80007ee4:	00006497          	auipc	s1,0x6
    80007ee8:	efb48493          	addi	s1,s1,-261 # 8000dddf <end+0xfff>
    80007eec:	02813823          	sd	s0,48(sp)
    80007ef0:	01313c23          	sd	s3,24(sp)
    80007ef4:	00f4f4b3          	and	s1,s1,a5
    80007ef8:	02113c23          	sd	ra,56(sp)
    80007efc:	03213023          	sd	s2,32(sp)
    80007f00:	01413823          	sd	s4,16(sp)
    80007f04:	01513423          	sd	s5,8(sp)
    80007f08:	04010413          	addi	s0,sp,64
    80007f0c:	000017b7          	lui	a5,0x1
    80007f10:	01100993          	li	s3,17
    80007f14:	00f487b3          	add	a5,s1,a5
    80007f18:	01b99993          	slli	s3,s3,0x1b
    80007f1c:	06f9e063          	bltu	s3,a5,80007f7c <kinit+0xa4>
    80007f20:	00005a97          	auipc	s5,0x5
    80007f24:	ec0a8a93          	addi	s5,s5,-320 # 8000cde0 <end>
    80007f28:	0754ec63          	bltu	s1,s5,80007fa0 <kinit+0xc8>
    80007f2c:	0734fa63          	bgeu	s1,s3,80007fa0 <kinit+0xc8>
    80007f30:	00088a37          	lui	s4,0x88
    80007f34:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007f38:	00004917          	auipc	s2,0x4
    80007f3c:	ba890913          	addi	s2,s2,-1112 # 8000bae0 <kmem>
    80007f40:	00ca1a13          	slli	s4,s4,0xc
    80007f44:	0140006f          	j	80007f58 <kinit+0x80>
    80007f48:	000017b7          	lui	a5,0x1
    80007f4c:	00f484b3          	add	s1,s1,a5
    80007f50:	0554e863          	bltu	s1,s5,80007fa0 <kinit+0xc8>
    80007f54:	0534f663          	bgeu	s1,s3,80007fa0 <kinit+0xc8>
    80007f58:	00001637          	lui	a2,0x1
    80007f5c:	00100593          	li	a1,1
    80007f60:	00048513          	mv	a0,s1
    80007f64:	00000097          	auipc	ra,0x0
    80007f68:	5e4080e7          	jalr	1508(ra) # 80008548 <__memset>
    80007f6c:	00093783          	ld	a5,0(s2)
    80007f70:	00f4b023          	sd	a5,0(s1)
    80007f74:	00993023          	sd	s1,0(s2)
    80007f78:	fd4498e3          	bne	s1,s4,80007f48 <kinit+0x70>
    80007f7c:	03813083          	ld	ra,56(sp)
    80007f80:	03013403          	ld	s0,48(sp)
    80007f84:	02813483          	ld	s1,40(sp)
    80007f88:	02013903          	ld	s2,32(sp)
    80007f8c:	01813983          	ld	s3,24(sp)
    80007f90:	01013a03          	ld	s4,16(sp)
    80007f94:	00813a83          	ld	s5,8(sp)
    80007f98:	04010113          	addi	sp,sp,64
    80007f9c:	00008067          	ret
    80007fa0:	00001517          	auipc	a0,0x1
    80007fa4:	78050513          	addi	a0,a0,1920 # 80009720 <digits+0x18>
    80007fa8:	fffff097          	auipc	ra,0xfffff
    80007fac:	4b4080e7          	jalr	1204(ra) # 8000745c <panic>

0000000080007fb0 <freerange>:
    80007fb0:	fc010113          	addi	sp,sp,-64
    80007fb4:	000017b7          	lui	a5,0x1
    80007fb8:	02913423          	sd	s1,40(sp)
    80007fbc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007fc0:	009504b3          	add	s1,a0,s1
    80007fc4:	fffff537          	lui	a0,0xfffff
    80007fc8:	02813823          	sd	s0,48(sp)
    80007fcc:	02113c23          	sd	ra,56(sp)
    80007fd0:	03213023          	sd	s2,32(sp)
    80007fd4:	01313c23          	sd	s3,24(sp)
    80007fd8:	01413823          	sd	s4,16(sp)
    80007fdc:	01513423          	sd	s5,8(sp)
    80007fe0:	01613023          	sd	s6,0(sp)
    80007fe4:	04010413          	addi	s0,sp,64
    80007fe8:	00a4f4b3          	and	s1,s1,a0
    80007fec:	00f487b3          	add	a5,s1,a5
    80007ff0:	06f5e463          	bltu	a1,a5,80008058 <freerange+0xa8>
    80007ff4:	00005a97          	auipc	s5,0x5
    80007ff8:	deca8a93          	addi	s5,s5,-532 # 8000cde0 <end>
    80007ffc:	0954e263          	bltu	s1,s5,80008080 <freerange+0xd0>
    80008000:	01100993          	li	s3,17
    80008004:	01b99993          	slli	s3,s3,0x1b
    80008008:	0734fc63          	bgeu	s1,s3,80008080 <freerange+0xd0>
    8000800c:	00058a13          	mv	s4,a1
    80008010:	00004917          	auipc	s2,0x4
    80008014:	ad090913          	addi	s2,s2,-1328 # 8000bae0 <kmem>
    80008018:	00002b37          	lui	s6,0x2
    8000801c:	0140006f          	j	80008030 <freerange+0x80>
    80008020:	000017b7          	lui	a5,0x1
    80008024:	00f484b3          	add	s1,s1,a5
    80008028:	0554ec63          	bltu	s1,s5,80008080 <freerange+0xd0>
    8000802c:	0534fa63          	bgeu	s1,s3,80008080 <freerange+0xd0>
    80008030:	00001637          	lui	a2,0x1
    80008034:	00100593          	li	a1,1
    80008038:	00048513          	mv	a0,s1
    8000803c:	00000097          	auipc	ra,0x0
    80008040:	50c080e7          	jalr	1292(ra) # 80008548 <__memset>
    80008044:	00093703          	ld	a4,0(s2)
    80008048:	016487b3          	add	a5,s1,s6
    8000804c:	00e4b023          	sd	a4,0(s1)
    80008050:	00993023          	sd	s1,0(s2)
    80008054:	fcfa76e3          	bgeu	s4,a5,80008020 <freerange+0x70>
    80008058:	03813083          	ld	ra,56(sp)
    8000805c:	03013403          	ld	s0,48(sp)
    80008060:	02813483          	ld	s1,40(sp)
    80008064:	02013903          	ld	s2,32(sp)
    80008068:	01813983          	ld	s3,24(sp)
    8000806c:	01013a03          	ld	s4,16(sp)
    80008070:	00813a83          	ld	s5,8(sp)
    80008074:	00013b03          	ld	s6,0(sp)
    80008078:	04010113          	addi	sp,sp,64
    8000807c:	00008067          	ret
    80008080:	00001517          	auipc	a0,0x1
    80008084:	6a050513          	addi	a0,a0,1696 # 80009720 <digits+0x18>
    80008088:	fffff097          	auipc	ra,0xfffff
    8000808c:	3d4080e7          	jalr	980(ra) # 8000745c <panic>

0000000080008090 <kfree>:
    80008090:	fe010113          	addi	sp,sp,-32
    80008094:	00813823          	sd	s0,16(sp)
    80008098:	00113c23          	sd	ra,24(sp)
    8000809c:	00913423          	sd	s1,8(sp)
    800080a0:	02010413          	addi	s0,sp,32
    800080a4:	03451793          	slli	a5,a0,0x34
    800080a8:	04079c63          	bnez	a5,80008100 <kfree+0x70>
    800080ac:	00005797          	auipc	a5,0x5
    800080b0:	d3478793          	addi	a5,a5,-716 # 8000cde0 <end>
    800080b4:	00050493          	mv	s1,a0
    800080b8:	04f56463          	bltu	a0,a5,80008100 <kfree+0x70>
    800080bc:	01100793          	li	a5,17
    800080c0:	01b79793          	slli	a5,a5,0x1b
    800080c4:	02f57e63          	bgeu	a0,a5,80008100 <kfree+0x70>
    800080c8:	00001637          	lui	a2,0x1
    800080cc:	00100593          	li	a1,1
    800080d0:	00000097          	auipc	ra,0x0
    800080d4:	478080e7          	jalr	1144(ra) # 80008548 <__memset>
    800080d8:	00004797          	auipc	a5,0x4
    800080dc:	a0878793          	addi	a5,a5,-1528 # 8000bae0 <kmem>
    800080e0:	0007b703          	ld	a4,0(a5)
    800080e4:	01813083          	ld	ra,24(sp)
    800080e8:	01013403          	ld	s0,16(sp)
    800080ec:	00e4b023          	sd	a4,0(s1)
    800080f0:	0097b023          	sd	s1,0(a5)
    800080f4:	00813483          	ld	s1,8(sp)
    800080f8:	02010113          	addi	sp,sp,32
    800080fc:	00008067          	ret
    80008100:	00001517          	auipc	a0,0x1
    80008104:	62050513          	addi	a0,a0,1568 # 80009720 <digits+0x18>
    80008108:	fffff097          	auipc	ra,0xfffff
    8000810c:	354080e7          	jalr	852(ra) # 8000745c <panic>

0000000080008110 <kalloc>:
    80008110:	fe010113          	addi	sp,sp,-32
    80008114:	00813823          	sd	s0,16(sp)
    80008118:	00913423          	sd	s1,8(sp)
    8000811c:	00113c23          	sd	ra,24(sp)
    80008120:	02010413          	addi	s0,sp,32
    80008124:	00004797          	auipc	a5,0x4
    80008128:	9bc78793          	addi	a5,a5,-1604 # 8000bae0 <kmem>
    8000812c:	0007b483          	ld	s1,0(a5)
    80008130:	02048063          	beqz	s1,80008150 <kalloc+0x40>
    80008134:	0004b703          	ld	a4,0(s1)
    80008138:	00001637          	lui	a2,0x1
    8000813c:	00500593          	li	a1,5
    80008140:	00048513          	mv	a0,s1
    80008144:	00e7b023          	sd	a4,0(a5)
    80008148:	00000097          	auipc	ra,0x0
    8000814c:	400080e7          	jalr	1024(ra) # 80008548 <__memset>
    80008150:	01813083          	ld	ra,24(sp)
    80008154:	01013403          	ld	s0,16(sp)
    80008158:	00048513          	mv	a0,s1
    8000815c:	00813483          	ld	s1,8(sp)
    80008160:	02010113          	addi	sp,sp,32
    80008164:	00008067          	ret

0000000080008168 <initlock>:
    80008168:	ff010113          	addi	sp,sp,-16
    8000816c:	00813423          	sd	s0,8(sp)
    80008170:	01010413          	addi	s0,sp,16
    80008174:	00813403          	ld	s0,8(sp)
    80008178:	00b53423          	sd	a1,8(a0)
    8000817c:	00052023          	sw	zero,0(a0)
    80008180:	00053823          	sd	zero,16(a0)
    80008184:	01010113          	addi	sp,sp,16
    80008188:	00008067          	ret

000000008000818c <acquire>:
    8000818c:	fe010113          	addi	sp,sp,-32
    80008190:	00813823          	sd	s0,16(sp)
    80008194:	00913423          	sd	s1,8(sp)
    80008198:	00113c23          	sd	ra,24(sp)
    8000819c:	01213023          	sd	s2,0(sp)
    800081a0:	02010413          	addi	s0,sp,32
    800081a4:	00050493          	mv	s1,a0
    800081a8:	10002973          	csrr	s2,sstatus
    800081ac:	100027f3          	csrr	a5,sstatus
    800081b0:	ffd7f793          	andi	a5,a5,-3
    800081b4:	10079073          	csrw	sstatus,a5
    800081b8:	fffff097          	auipc	ra,0xfffff
    800081bc:	8e4080e7          	jalr	-1820(ra) # 80006a9c <mycpu>
    800081c0:	07852783          	lw	a5,120(a0)
    800081c4:	06078e63          	beqz	a5,80008240 <acquire+0xb4>
    800081c8:	fffff097          	auipc	ra,0xfffff
    800081cc:	8d4080e7          	jalr	-1836(ra) # 80006a9c <mycpu>
    800081d0:	07852783          	lw	a5,120(a0)
    800081d4:	0004a703          	lw	a4,0(s1)
    800081d8:	0017879b          	addiw	a5,a5,1
    800081dc:	06f52c23          	sw	a5,120(a0)
    800081e0:	04071063          	bnez	a4,80008220 <acquire+0x94>
    800081e4:	00100713          	li	a4,1
    800081e8:	00070793          	mv	a5,a4
    800081ec:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800081f0:	0007879b          	sext.w	a5,a5
    800081f4:	fe079ae3          	bnez	a5,800081e8 <acquire+0x5c>
    800081f8:	0ff0000f          	fence
    800081fc:	fffff097          	auipc	ra,0xfffff
    80008200:	8a0080e7          	jalr	-1888(ra) # 80006a9c <mycpu>
    80008204:	01813083          	ld	ra,24(sp)
    80008208:	01013403          	ld	s0,16(sp)
    8000820c:	00a4b823          	sd	a0,16(s1)
    80008210:	00013903          	ld	s2,0(sp)
    80008214:	00813483          	ld	s1,8(sp)
    80008218:	02010113          	addi	sp,sp,32
    8000821c:	00008067          	ret
    80008220:	0104b903          	ld	s2,16(s1)
    80008224:	fffff097          	auipc	ra,0xfffff
    80008228:	878080e7          	jalr	-1928(ra) # 80006a9c <mycpu>
    8000822c:	faa91ce3          	bne	s2,a0,800081e4 <acquire+0x58>
    80008230:	00001517          	auipc	a0,0x1
    80008234:	4f850513          	addi	a0,a0,1272 # 80009728 <digits+0x20>
    80008238:	fffff097          	auipc	ra,0xfffff
    8000823c:	224080e7          	jalr	548(ra) # 8000745c <panic>
    80008240:	00195913          	srli	s2,s2,0x1
    80008244:	fffff097          	auipc	ra,0xfffff
    80008248:	858080e7          	jalr	-1960(ra) # 80006a9c <mycpu>
    8000824c:	00197913          	andi	s2,s2,1
    80008250:	07252e23          	sw	s2,124(a0)
    80008254:	f75ff06f          	j	800081c8 <acquire+0x3c>

0000000080008258 <release>:
    80008258:	fe010113          	addi	sp,sp,-32
    8000825c:	00813823          	sd	s0,16(sp)
    80008260:	00113c23          	sd	ra,24(sp)
    80008264:	00913423          	sd	s1,8(sp)
    80008268:	01213023          	sd	s2,0(sp)
    8000826c:	02010413          	addi	s0,sp,32
    80008270:	00052783          	lw	a5,0(a0)
    80008274:	00079a63          	bnez	a5,80008288 <release+0x30>
    80008278:	00001517          	auipc	a0,0x1
    8000827c:	4b850513          	addi	a0,a0,1208 # 80009730 <digits+0x28>
    80008280:	fffff097          	auipc	ra,0xfffff
    80008284:	1dc080e7          	jalr	476(ra) # 8000745c <panic>
    80008288:	01053903          	ld	s2,16(a0)
    8000828c:	00050493          	mv	s1,a0
    80008290:	fffff097          	auipc	ra,0xfffff
    80008294:	80c080e7          	jalr	-2036(ra) # 80006a9c <mycpu>
    80008298:	fea910e3          	bne	s2,a0,80008278 <release+0x20>
    8000829c:	0004b823          	sd	zero,16(s1)
    800082a0:	0ff0000f          	fence
    800082a4:	0f50000f          	fence	iorw,ow
    800082a8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800082ac:	ffffe097          	auipc	ra,0xffffe
    800082b0:	7f0080e7          	jalr	2032(ra) # 80006a9c <mycpu>
    800082b4:	100027f3          	csrr	a5,sstatus
    800082b8:	0027f793          	andi	a5,a5,2
    800082bc:	04079a63          	bnez	a5,80008310 <release+0xb8>
    800082c0:	07852783          	lw	a5,120(a0)
    800082c4:	02f05e63          	blez	a5,80008300 <release+0xa8>
    800082c8:	fff7871b          	addiw	a4,a5,-1
    800082cc:	06e52c23          	sw	a4,120(a0)
    800082d0:	00071c63          	bnez	a4,800082e8 <release+0x90>
    800082d4:	07c52783          	lw	a5,124(a0)
    800082d8:	00078863          	beqz	a5,800082e8 <release+0x90>
    800082dc:	100027f3          	csrr	a5,sstatus
    800082e0:	0027e793          	ori	a5,a5,2
    800082e4:	10079073          	csrw	sstatus,a5
    800082e8:	01813083          	ld	ra,24(sp)
    800082ec:	01013403          	ld	s0,16(sp)
    800082f0:	00813483          	ld	s1,8(sp)
    800082f4:	00013903          	ld	s2,0(sp)
    800082f8:	02010113          	addi	sp,sp,32
    800082fc:	00008067          	ret
    80008300:	00001517          	auipc	a0,0x1
    80008304:	45050513          	addi	a0,a0,1104 # 80009750 <digits+0x48>
    80008308:	fffff097          	auipc	ra,0xfffff
    8000830c:	154080e7          	jalr	340(ra) # 8000745c <panic>
    80008310:	00001517          	auipc	a0,0x1
    80008314:	42850513          	addi	a0,a0,1064 # 80009738 <digits+0x30>
    80008318:	fffff097          	auipc	ra,0xfffff
    8000831c:	144080e7          	jalr	324(ra) # 8000745c <panic>

0000000080008320 <holding>:
    80008320:	00052783          	lw	a5,0(a0)
    80008324:	00079663          	bnez	a5,80008330 <holding+0x10>
    80008328:	00000513          	li	a0,0
    8000832c:	00008067          	ret
    80008330:	fe010113          	addi	sp,sp,-32
    80008334:	00813823          	sd	s0,16(sp)
    80008338:	00913423          	sd	s1,8(sp)
    8000833c:	00113c23          	sd	ra,24(sp)
    80008340:	02010413          	addi	s0,sp,32
    80008344:	01053483          	ld	s1,16(a0)
    80008348:	ffffe097          	auipc	ra,0xffffe
    8000834c:	754080e7          	jalr	1876(ra) # 80006a9c <mycpu>
    80008350:	01813083          	ld	ra,24(sp)
    80008354:	01013403          	ld	s0,16(sp)
    80008358:	40a48533          	sub	a0,s1,a0
    8000835c:	00153513          	seqz	a0,a0
    80008360:	00813483          	ld	s1,8(sp)
    80008364:	02010113          	addi	sp,sp,32
    80008368:	00008067          	ret

000000008000836c <push_off>:
    8000836c:	fe010113          	addi	sp,sp,-32
    80008370:	00813823          	sd	s0,16(sp)
    80008374:	00113c23          	sd	ra,24(sp)
    80008378:	00913423          	sd	s1,8(sp)
    8000837c:	02010413          	addi	s0,sp,32
    80008380:	100024f3          	csrr	s1,sstatus
    80008384:	100027f3          	csrr	a5,sstatus
    80008388:	ffd7f793          	andi	a5,a5,-3
    8000838c:	10079073          	csrw	sstatus,a5
    80008390:	ffffe097          	auipc	ra,0xffffe
    80008394:	70c080e7          	jalr	1804(ra) # 80006a9c <mycpu>
    80008398:	07852783          	lw	a5,120(a0)
    8000839c:	02078663          	beqz	a5,800083c8 <push_off+0x5c>
    800083a0:	ffffe097          	auipc	ra,0xffffe
    800083a4:	6fc080e7          	jalr	1788(ra) # 80006a9c <mycpu>
    800083a8:	07852783          	lw	a5,120(a0)
    800083ac:	01813083          	ld	ra,24(sp)
    800083b0:	01013403          	ld	s0,16(sp)
    800083b4:	0017879b          	addiw	a5,a5,1
    800083b8:	06f52c23          	sw	a5,120(a0)
    800083bc:	00813483          	ld	s1,8(sp)
    800083c0:	02010113          	addi	sp,sp,32
    800083c4:	00008067          	ret
    800083c8:	0014d493          	srli	s1,s1,0x1
    800083cc:	ffffe097          	auipc	ra,0xffffe
    800083d0:	6d0080e7          	jalr	1744(ra) # 80006a9c <mycpu>
    800083d4:	0014f493          	andi	s1,s1,1
    800083d8:	06952e23          	sw	s1,124(a0)
    800083dc:	fc5ff06f          	j	800083a0 <push_off+0x34>

00000000800083e0 <pop_off>:
    800083e0:	ff010113          	addi	sp,sp,-16
    800083e4:	00813023          	sd	s0,0(sp)
    800083e8:	00113423          	sd	ra,8(sp)
    800083ec:	01010413          	addi	s0,sp,16
    800083f0:	ffffe097          	auipc	ra,0xffffe
    800083f4:	6ac080e7          	jalr	1708(ra) # 80006a9c <mycpu>
    800083f8:	100027f3          	csrr	a5,sstatus
    800083fc:	0027f793          	andi	a5,a5,2
    80008400:	04079663          	bnez	a5,8000844c <pop_off+0x6c>
    80008404:	07852783          	lw	a5,120(a0)
    80008408:	02f05a63          	blez	a5,8000843c <pop_off+0x5c>
    8000840c:	fff7871b          	addiw	a4,a5,-1
    80008410:	06e52c23          	sw	a4,120(a0)
    80008414:	00071c63          	bnez	a4,8000842c <pop_off+0x4c>
    80008418:	07c52783          	lw	a5,124(a0)
    8000841c:	00078863          	beqz	a5,8000842c <pop_off+0x4c>
    80008420:	100027f3          	csrr	a5,sstatus
    80008424:	0027e793          	ori	a5,a5,2
    80008428:	10079073          	csrw	sstatus,a5
    8000842c:	00813083          	ld	ra,8(sp)
    80008430:	00013403          	ld	s0,0(sp)
    80008434:	01010113          	addi	sp,sp,16
    80008438:	00008067          	ret
    8000843c:	00001517          	auipc	a0,0x1
    80008440:	31450513          	addi	a0,a0,788 # 80009750 <digits+0x48>
    80008444:	fffff097          	auipc	ra,0xfffff
    80008448:	018080e7          	jalr	24(ra) # 8000745c <panic>
    8000844c:	00001517          	auipc	a0,0x1
    80008450:	2ec50513          	addi	a0,a0,748 # 80009738 <digits+0x30>
    80008454:	fffff097          	auipc	ra,0xfffff
    80008458:	008080e7          	jalr	8(ra) # 8000745c <panic>

000000008000845c <push_on>:
    8000845c:	fe010113          	addi	sp,sp,-32
    80008460:	00813823          	sd	s0,16(sp)
    80008464:	00113c23          	sd	ra,24(sp)
    80008468:	00913423          	sd	s1,8(sp)
    8000846c:	02010413          	addi	s0,sp,32
    80008470:	100024f3          	csrr	s1,sstatus
    80008474:	100027f3          	csrr	a5,sstatus
    80008478:	0027e793          	ori	a5,a5,2
    8000847c:	10079073          	csrw	sstatus,a5
    80008480:	ffffe097          	auipc	ra,0xffffe
    80008484:	61c080e7          	jalr	1564(ra) # 80006a9c <mycpu>
    80008488:	07852783          	lw	a5,120(a0)
    8000848c:	02078663          	beqz	a5,800084b8 <push_on+0x5c>
    80008490:	ffffe097          	auipc	ra,0xffffe
    80008494:	60c080e7          	jalr	1548(ra) # 80006a9c <mycpu>
    80008498:	07852783          	lw	a5,120(a0)
    8000849c:	01813083          	ld	ra,24(sp)
    800084a0:	01013403          	ld	s0,16(sp)
    800084a4:	0017879b          	addiw	a5,a5,1
    800084a8:	06f52c23          	sw	a5,120(a0)
    800084ac:	00813483          	ld	s1,8(sp)
    800084b0:	02010113          	addi	sp,sp,32
    800084b4:	00008067          	ret
    800084b8:	0014d493          	srli	s1,s1,0x1
    800084bc:	ffffe097          	auipc	ra,0xffffe
    800084c0:	5e0080e7          	jalr	1504(ra) # 80006a9c <mycpu>
    800084c4:	0014f493          	andi	s1,s1,1
    800084c8:	06952e23          	sw	s1,124(a0)
    800084cc:	fc5ff06f          	j	80008490 <push_on+0x34>

00000000800084d0 <pop_on>:
    800084d0:	ff010113          	addi	sp,sp,-16
    800084d4:	00813023          	sd	s0,0(sp)
    800084d8:	00113423          	sd	ra,8(sp)
    800084dc:	01010413          	addi	s0,sp,16
    800084e0:	ffffe097          	auipc	ra,0xffffe
    800084e4:	5bc080e7          	jalr	1468(ra) # 80006a9c <mycpu>
    800084e8:	100027f3          	csrr	a5,sstatus
    800084ec:	0027f793          	andi	a5,a5,2
    800084f0:	04078463          	beqz	a5,80008538 <pop_on+0x68>
    800084f4:	07852783          	lw	a5,120(a0)
    800084f8:	02f05863          	blez	a5,80008528 <pop_on+0x58>
    800084fc:	fff7879b          	addiw	a5,a5,-1
    80008500:	06f52c23          	sw	a5,120(a0)
    80008504:	07853783          	ld	a5,120(a0)
    80008508:	00079863          	bnez	a5,80008518 <pop_on+0x48>
    8000850c:	100027f3          	csrr	a5,sstatus
    80008510:	ffd7f793          	andi	a5,a5,-3
    80008514:	10079073          	csrw	sstatus,a5
    80008518:	00813083          	ld	ra,8(sp)
    8000851c:	00013403          	ld	s0,0(sp)
    80008520:	01010113          	addi	sp,sp,16
    80008524:	00008067          	ret
    80008528:	00001517          	auipc	a0,0x1
    8000852c:	25050513          	addi	a0,a0,592 # 80009778 <digits+0x70>
    80008530:	fffff097          	auipc	ra,0xfffff
    80008534:	f2c080e7          	jalr	-212(ra) # 8000745c <panic>
    80008538:	00001517          	auipc	a0,0x1
    8000853c:	22050513          	addi	a0,a0,544 # 80009758 <digits+0x50>
    80008540:	fffff097          	auipc	ra,0xfffff
    80008544:	f1c080e7          	jalr	-228(ra) # 8000745c <panic>

0000000080008548 <__memset>:
    80008548:	ff010113          	addi	sp,sp,-16
    8000854c:	00813423          	sd	s0,8(sp)
    80008550:	01010413          	addi	s0,sp,16
    80008554:	1a060e63          	beqz	a2,80008710 <__memset+0x1c8>
    80008558:	40a007b3          	neg	a5,a0
    8000855c:	0077f793          	andi	a5,a5,7
    80008560:	00778693          	addi	a3,a5,7
    80008564:	00b00813          	li	a6,11
    80008568:	0ff5f593          	andi	a1,a1,255
    8000856c:	fff6071b          	addiw	a4,a2,-1
    80008570:	1b06e663          	bltu	a3,a6,8000871c <__memset+0x1d4>
    80008574:	1cd76463          	bltu	a4,a3,8000873c <__memset+0x1f4>
    80008578:	1a078e63          	beqz	a5,80008734 <__memset+0x1ec>
    8000857c:	00b50023          	sb	a1,0(a0)
    80008580:	00100713          	li	a4,1
    80008584:	1ae78463          	beq	a5,a4,8000872c <__memset+0x1e4>
    80008588:	00b500a3          	sb	a1,1(a0)
    8000858c:	00200713          	li	a4,2
    80008590:	1ae78a63          	beq	a5,a4,80008744 <__memset+0x1fc>
    80008594:	00b50123          	sb	a1,2(a0)
    80008598:	00300713          	li	a4,3
    8000859c:	18e78463          	beq	a5,a4,80008724 <__memset+0x1dc>
    800085a0:	00b501a3          	sb	a1,3(a0)
    800085a4:	00400713          	li	a4,4
    800085a8:	1ae78263          	beq	a5,a4,8000874c <__memset+0x204>
    800085ac:	00b50223          	sb	a1,4(a0)
    800085b0:	00500713          	li	a4,5
    800085b4:	1ae78063          	beq	a5,a4,80008754 <__memset+0x20c>
    800085b8:	00b502a3          	sb	a1,5(a0)
    800085bc:	00700713          	li	a4,7
    800085c0:	18e79e63          	bne	a5,a4,8000875c <__memset+0x214>
    800085c4:	00b50323          	sb	a1,6(a0)
    800085c8:	00700e93          	li	t4,7
    800085cc:	00859713          	slli	a4,a1,0x8
    800085d0:	00e5e733          	or	a4,a1,a4
    800085d4:	01059e13          	slli	t3,a1,0x10
    800085d8:	01c76e33          	or	t3,a4,t3
    800085dc:	01859313          	slli	t1,a1,0x18
    800085e0:	006e6333          	or	t1,t3,t1
    800085e4:	02059893          	slli	a7,a1,0x20
    800085e8:	40f60e3b          	subw	t3,a2,a5
    800085ec:	011368b3          	or	a7,t1,a7
    800085f0:	02859813          	slli	a6,a1,0x28
    800085f4:	0108e833          	or	a6,a7,a6
    800085f8:	03059693          	slli	a3,a1,0x30
    800085fc:	003e589b          	srliw	a7,t3,0x3
    80008600:	00d866b3          	or	a3,a6,a3
    80008604:	03859713          	slli	a4,a1,0x38
    80008608:	00389813          	slli	a6,a7,0x3
    8000860c:	00f507b3          	add	a5,a0,a5
    80008610:	00e6e733          	or	a4,a3,a4
    80008614:	000e089b          	sext.w	a7,t3
    80008618:	00f806b3          	add	a3,a6,a5
    8000861c:	00e7b023          	sd	a4,0(a5)
    80008620:	00878793          	addi	a5,a5,8
    80008624:	fed79ce3          	bne	a5,a3,8000861c <__memset+0xd4>
    80008628:	ff8e7793          	andi	a5,t3,-8
    8000862c:	0007871b          	sext.w	a4,a5
    80008630:	01d787bb          	addw	a5,a5,t4
    80008634:	0ce88e63          	beq	a7,a4,80008710 <__memset+0x1c8>
    80008638:	00f50733          	add	a4,a0,a5
    8000863c:	00b70023          	sb	a1,0(a4)
    80008640:	0017871b          	addiw	a4,a5,1
    80008644:	0cc77663          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    80008648:	00e50733          	add	a4,a0,a4
    8000864c:	00b70023          	sb	a1,0(a4)
    80008650:	0027871b          	addiw	a4,a5,2
    80008654:	0ac77e63          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    80008658:	00e50733          	add	a4,a0,a4
    8000865c:	00b70023          	sb	a1,0(a4)
    80008660:	0037871b          	addiw	a4,a5,3
    80008664:	0ac77663          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    80008668:	00e50733          	add	a4,a0,a4
    8000866c:	00b70023          	sb	a1,0(a4)
    80008670:	0047871b          	addiw	a4,a5,4
    80008674:	08c77e63          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    80008678:	00e50733          	add	a4,a0,a4
    8000867c:	00b70023          	sb	a1,0(a4)
    80008680:	0057871b          	addiw	a4,a5,5
    80008684:	08c77663          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    80008688:	00e50733          	add	a4,a0,a4
    8000868c:	00b70023          	sb	a1,0(a4)
    80008690:	0067871b          	addiw	a4,a5,6
    80008694:	06c77e63          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    80008698:	00e50733          	add	a4,a0,a4
    8000869c:	00b70023          	sb	a1,0(a4)
    800086a0:	0077871b          	addiw	a4,a5,7
    800086a4:	06c77663          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    800086a8:	00e50733          	add	a4,a0,a4
    800086ac:	00b70023          	sb	a1,0(a4)
    800086b0:	0087871b          	addiw	a4,a5,8
    800086b4:	04c77e63          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    800086b8:	00e50733          	add	a4,a0,a4
    800086bc:	00b70023          	sb	a1,0(a4)
    800086c0:	0097871b          	addiw	a4,a5,9
    800086c4:	04c77663          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    800086c8:	00e50733          	add	a4,a0,a4
    800086cc:	00b70023          	sb	a1,0(a4)
    800086d0:	00a7871b          	addiw	a4,a5,10
    800086d4:	02c77e63          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    800086d8:	00e50733          	add	a4,a0,a4
    800086dc:	00b70023          	sb	a1,0(a4)
    800086e0:	00b7871b          	addiw	a4,a5,11
    800086e4:	02c77663          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    800086e8:	00e50733          	add	a4,a0,a4
    800086ec:	00b70023          	sb	a1,0(a4)
    800086f0:	00c7871b          	addiw	a4,a5,12
    800086f4:	00c77e63          	bgeu	a4,a2,80008710 <__memset+0x1c8>
    800086f8:	00e50733          	add	a4,a0,a4
    800086fc:	00b70023          	sb	a1,0(a4)
    80008700:	00d7879b          	addiw	a5,a5,13
    80008704:	00c7f663          	bgeu	a5,a2,80008710 <__memset+0x1c8>
    80008708:	00f507b3          	add	a5,a0,a5
    8000870c:	00b78023          	sb	a1,0(a5)
    80008710:	00813403          	ld	s0,8(sp)
    80008714:	01010113          	addi	sp,sp,16
    80008718:	00008067          	ret
    8000871c:	00b00693          	li	a3,11
    80008720:	e55ff06f          	j	80008574 <__memset+0x2c>
    80008724:	00300e93          	li	t4,3
    80008728:	ea5ff06f          	j	800085cc <__memset+0x84>
    8000872c:	00100e93          	li	t4,1
    80008730:	e9dff06f          	j	800085cc <__memset+0x84>
    80008734:	00000e93          	li	t4,0
    80008738:	e95ff06f          	j	800085cc <__memset+0x84>
    8000873c:	00000793          	li	a5,0
    80008740:	ef9ff06f          	j	80008638 <__memset+0xf0>
    80008744:	00200e93          	li	t4,2
    80008748:	e85ff06f          	j	800085cc <__memset+0x84>
    8000874c:	00400e93          	li	t4,4
    80008750:	e7dff06f          	j	800085cc <__memset+0x84>
    80008754:	00500e93          	li	t4,5
    80008758:	e75ff06f          	j	800085cc <__memset+0x84>
    8000875c:	00600e93          	li	t4,6
    80008760:	e6dff06f          	j	800085cc <__memset+0x84>

0000000080008764 <__memmove>:
    80008764:	ff010113          	addi	sp,sp,-16
    80008768:	00813423          	sd	s0,8(sp)
    8000876c:	01010413          	addi	s0,sp,16
    80008770:	0e060863          	beqz	a2,80008860 <__memmove+0xfc>
    80008774:	fff6069b          	addiw	a3,a2,-1
    80008778:	0006881b          	sext.w	a6,a3
    8000877c:	0ea5e863          	bltu	a1,a0,8000886c <__memmove+0x108>
    80008780:	00758713          	addi	a4,a1,7
    80008784:	00a5e7b3          	or	a5,a1,a0
    80008788:	40a70733          	sub	a4,a4,a0
    8000878c:	0077f793          	andi	a5,a5,7
    80008790:	00f73713          	sltiu	a4,a4,15
    80008794:	00174713          	xori	a4,a4,1
    80008798:	0017b793          	seqz	a5,a5
    8000879c:	00e7f7b3          	and	a5,a5,a4
    800087a0:	10078863          	beqz	a5,800088b0 <__memmove+0x14c>
    800087a4:	00900793          	li	a5,9
    800087a8:	1107f463          	bgeu	a5,a6,800088b0 <__memmove+0x14c>
    800087ac:	0036581b          	srliw	a6,a2,0x3
    800087b0:	fff8081b          	addiw	a6,a6,-1
    800087b4:	02081813          	slli	a6,a6,0x20
    800087b8:	01d85893          	srli	a7,a6,0x1d
    800087bc:	00858813          	addi	a6,a1,8
    800087c0:	00058793          	mv	a5,a1
    800087c4:	00050713          	mv	a4,a0
    800087c8:	01088833          	add	a6,a7,a6
    800087cc:	0007b883          	ld	a7,0(a5)
    800087d0:	00878793          	addi	a5,a5,8
    800087d4:	00870713          	addi	a4,a4,8
    800087d8:	ff173c23          	sd	a7,-8(a4)
    800087dc:	ff0798e3          	bne	a5,a6,800087cc <__memmove+0x68>
    800087e0:	ff867713          	andi	a4,a2,-8
    800087e4:	02071793          	slli	a5,a4,0x20
    800087e8:	0207d793          	srli	a5,a5,0x20
    800087ec:	00f585b3          	add	a1,a1,a5
    800087f0:	40e686bb          	subw	a3,a3,a4
    800087f4:	00f507b3          	add	a5,a0,a5
    800087f8:	06e60463          	beq	a2,a4,80008860 <__memmove+0xfc>
    800087fc:	0005c703          	lbu	a4,0(a1)
    80008800:	00e78023          	sb	a4,0(a5)
    80008804:	04068e63          	beqz	a3,80008860 <__memmove+0xfc>
    80008808:	0015c603          	lbu	a2,1(a1)
    8000880c:	00100713          	li	a4,1
    80008810:	00c780a3          	sb	a2,1(a5)
    80008814:	04e68663          	beq	a3,a4,80008860 <__memmove+0xfc>
    80008818:	0025c603          	lbu	a2,2(a1)
    8000881c:	00200713          	li	a4,2
    80008820:	00c78123          	sb	a2,2(a5)
    80008824:	02e68e63          	beq	a3,a4,80008860 <__memmove+0xfc>
    80008828:	0035c603          	lbu	a2,3(a1)
    8000882c:	00300713          	li	a4,3
    80008830:	00c781a3          	sb	a2,3(a5)
    80008834:	02e68663          	beq	a3,a4,80008860 <__memmove+0xfc>
    80008838:	0045c603          	lbu	a2,4(a1)
    8000883c:	00400713          	li	a4,4
    80008840:	00c78223          	sb	a2,4(a5)
    80008844:	00e68e63          	beq	a3,a4,80008860 <__memmove+0xfc>
    80008848:	0055c603          	lbu	a2,5(a1)
    8000884c:	00500713          	li	a4,5
    80008850:	00c782a3          	sb	a2,5(a5)
    80008854:	00e68663          	beq	a3,a4,80008860 <__memmove+0xfc>
    80008858:	0065c703          	lbu	a4,6(a1)
    8000885c:	00e78323          	sb	a4,6(a5)
    80008860:	00813403          	ld	s0,8(sp)
    80008864:	01010113          	addi	sp,sp,16
    80008868:	00008067          	ret
    8000886c:	02061713          	slli	a4,a2,0x20
    80008870:	02075713          	srli	a4,a4,0x20
    80008874:	00e587b3          	add	a5,a1,a4
    80008878:	f0f574e3          	bgeu	a0,a5,80008780 <__memmove+0x1c>
    8000887c:	02069613          	slli	a2,a3,0x20
    80008880:	02065613          	srli	a2,a2,0x20
    80008884:	fff64613          	not	a2,a2
    80008888:	00e50733          	add	a4,a0,a4
    8000888c:	00c78633          	add	a2,a5,a2
    80008890:	fff7c683          	lbu	a3,-1(a5)
    80008894:	fff78793          	addi	a5,a5,-1
    80008898:	fff70713          	addi	a4,a4,-1
    8000889c:	00d70023          	sb	a3,0(a4)
    800088a0:	fec798e3          	bne	a5,a2,80008890 <__memmove+0x12c>
    800088a4:	00813403          	ld	s0,8(sp)
    800088a8:	01010113          	addi	sp,sp,16
    800088ac:	00008067          	ret
    800088b0:	02069713          	slli	a4,a3,0x20
    800088b4:	02075713          	srli	a4,a4,0x20
    800088b8:	00170713          	addi	a4,a4,1
    800088bc:	00e50733          	add	a4,a0,a4
    800088c0:	00050793          	mv	a5,a0
    800088c4:	0005c683          	lbu	a3,0(a1)
    800088c8:	00178793          	addi	a5,a5,1
    800088cc:	00158593          	addi	a1,a1,1
    800088d0:	fed78fa3          	sb	a3,-1(a5)
    800088d4:	fee798e3          	bne	a5,a4,800088c4 <__memmove+0x160>
    800088d8:	f89ff06f          	j	80008860 <__memmove+0xfc>
	...
