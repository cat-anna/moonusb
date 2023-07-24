package = "moonusb"
version = "0.1-1"
source = {
  url = "git+https://github.com/stetre/moonusb.git",
  branch = "master",
  tag = nil,
}
description = {
   summary = "Lua binding library for libusb",
   detailed = [[
MoonUSB is a Lua binding library for libusb, allowing applications to access and use USB devices.
MoonUSB also provides a submodule for emulating USB devices via USB/IP.
   ]],
   license = "MIT/X11",
   homepage = "https://github.com/stetre/moonusb"
}
dependencies = {
  "lua >= 5.3"
}

local sources = {
    "src/compat-5.3.c",
    "src/context.c",
    "src/datahandling.c",
    "src/datastructs.c",
    "src/devhandle.c",
    "src/device.c",
    "src/enums.c",
    "src/hostmem.c",
    "src/hotplug.c",
    "src/interface.c",
    "src/main.c",
    "src/objects.c",
    "src/polling.c",
    "src/synch.c",
    "src/tracing.c",
    "src/transfer.c",
    "src/udata.c",
    "src/utils.c",
}

external_dependencies = {
  LIBUSB = {
     header = "libusb-1.0/libusb.h"
  }
}

build = {
  type = "builtin",
  modules = {
    ["moonusb"] = {
      sources = sources,
      incdir = "/src",
      libraries = {"usb-1.0"},
      incdirs = {"$(LIBUSB_INCDIR)"},
      libdirs = {"$(LIBUSB_LIBDIR)"},
      defines = { "LINUX" },
    },
    ["moonusb.bosdescriptors"] = "moonusb/bosdescriptors.lua",
    ["moonusb.emulator"] = "moonusb/emulator.lua",
    ["moonusb.utils"] = "moonusb/utils.lua",
  },
  copy_directories = {
    "thirdparty",
    "examples",
  }
}
