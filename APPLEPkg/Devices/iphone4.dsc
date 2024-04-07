[Defines]
  PLATFORM_NAME                  = APPLEPkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = ARM
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = APPLEPkg/Devices/iphone4.fdf

[BuildOptions.common]
  GCC:*_*_ARM_CC_FLAGS = -DSILICON_PLATFORM=S5L8930

[PcdsFixedAtBuild.common]
  # gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x40C00000
  # System Memory
  # TODO: the only diff between iPhone 4 and Touch 4 is the memory size, so ifdef it
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x40000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x20000000 # For iPod Touch 4

  # Size of the region used by UEFI in permanent memory (Reserved 16MB)
  gArmPlatformTokenSpaceGuid.PcdSystemMemoryUefiRegionSize|0x08000000

 # Memory allocation
  gAPPLEPkgTokenSpaceGuid.PcdPreAllocatedMemorySize|0x0EE00000
  gAPPLEPkgTokenSpaceGuid.PcdUefiMemPoolSize|0x093B0000
  gArmPlatformTokenSpaceGuid.PcdCoreCount|1
  gArmPlatformTokenSpaceGuid.PcdClusterCount|1

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x40004000
  gArmTokenSpaceGuid.PcdCpuResetAddress|0x40004000

  # Framebuffer (720x1280)
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|640
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|960
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|640
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|960
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32
  gAPPLEPkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x5f700000

# Make it so ConOut will choose what's best at startup 
  [PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|640 # /8 = column
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|960 #/19 = row
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|640
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|960
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|80
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|120
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|80
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|120

!include APPLEPkg/APPLEPkg.dsc
