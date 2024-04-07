/** @file
  Generic ARM implementation of TimerLib.h

  Copyright (c) 2011 - 2021, Arm Limited. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include <Base.h>
#include <Library/ArmLib.h>
#include <Library/BaseLib.h>
#include <Library/TimerLib.h>
#include <Library/DebugLib.h>
#include <Library/PcdLib.h>
#include <Library/ArmGenericTimerCounterLib.h>

#define TimerSystemCount  (*(volatile UINT32 *)(0x3F200000 + 0x0020))

#define TICKS_PER_MICRO_SEC  (PcdGet32 (PcdArmArchTimerFreqInHz)/1000000U)

// Select appropriate multiply function for platform architecture.
#ifdef MDE_CPU_ARM
#define MULT_U64_X_N  MultU64x32
#else
#define MULT_U64_X_N  MultU64x64
#endif

/**
  A local utility function that returns the PCD value, if specified.
  Otherwise it defaults to ArmGenericTimerGetTimerFreq.

  @return The timer frequency.

**/
RETURN_STATUS
EFIAPI
TimerConstructor (
  VOID
  )
{
//  UINT32 TimerBaseAddress = TimerBase(0);
  DEBUG ((EFI_D_INFO, "Timer init not done!!!\n"));
  return EFI_SUCCESS;
}

UINTN
EFIAPI
MicroSecondDelay (
  IN  UINTN MicroSeconds
  )
{
  // Todo
  return MicroSeconds;
}

UINTN
EFIAPI
NanoSecondDelay (
  IN  UINTN NanoSeconds
  )
{
  // Todo
  return NanoSeconds;
}

UINT64
EFIAPI
GetPerformanceCounter (
  VOID
  )
{ 
  // Todo
  return (UINT64)-1;
}

UINT64
EFIAPI
GetPerformanceCounterProperties (
  OUT UINT64  *StartValue,  OPTIONAL
  OUT UINT64  *EndValue     OPTIONAL
  )
{
  // Todo
  if (StartValue != NULL) {
    // Timer starts with the reload value
    *StartValue = (UINT64)10000;
  }
  
  if (EndValue != NULL) {
    // Timer counts up to 0xFFFFFFFF
    *EndValue = 0xFFFFFFFF;
  }
  
  return (UINT64)PcdGet32 (PcdArmArchTimerFreqInHz);
}

/**
  Converts elapsed ticks of performance counter to time in nanoseconds.

  This function converts the elapsed ticks of running performance counter to
  time value in unit of nanoseconds.

  @param  Ticks     The number of elapsed ticks of running performance counter.

  @return The elapsed time in nanoseconds.

**/
UINT64
EFIAPI
GetTimeInNanoSecond (
  IN      UINT64  Ticks
  )
{



  return 0;
}
