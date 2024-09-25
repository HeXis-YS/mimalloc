# Copyright (C) 2023 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)
SRCDIR := $(LOCAL_PATH)/src

include $(CLEAR_VARS)
LOCAL_MODULE    := libmimalloc
LOCAL_SRC_FILES := \
    $(SRCDIR)/alloc.c \
    $(SRCDIR)/alloc-aligned.c \
    $(SRCDIR)/alloc-posix.c \
    $(SRCDIR)/arena.c \
    $(SRCDIR)/bitmap.c \
    $(SRCDIR)/heap.c \
    $(SRCDIR)/init.c \
    $(SRCDIR)/libc.c \
    $(SRCDIR)/options.c \
    $(SRCDIR)/os.c \
    $(SRCDIR)/page.c \
    $(SRCDIR)/random.c \
    $(SRCDIR)/segment.c \
    $(SRCDIR)/segment-map.c \
    $(SRCDIR)/stats.c \
    $(SRCDIR)/prim/prim.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_CFLAGS += -DMI_MALLOC_OVERRIDE -DMI_STATIC_LIB -DNDEBUG
LOCAL_CFLAGS += -std=gnu11 -ftls-model=local-dynamic -fno-builtin-malloc
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_CFLAGS += -mfpu=neon
endif
include $(BUILD_STATIC_LIBRARY)
