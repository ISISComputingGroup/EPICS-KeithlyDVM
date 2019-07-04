# Makefile for Asyn Keithley_2700 support
#
# Created by zyz29835 on Mon Aug 14 09:53:15 2017
# Based on the Asyn streamSCPI template

TOP = .
include $(TOP)/configure/CONFIG

DIRS := configure
DIRS += $(wildcard *[Ss]up)
DIRS += $(wildcard *[Aa]pp)
DIRS += $(wildcard ioc[Bb]oot)

TEST_RUNNER = $(TOP)/Keithley_2700Sup/O.$(EPICS_HOST_ARCH)/runner

include $(TOP)/configure/RULES_TOP

.PHONY: test
test:
ifneq ($(wildcard $(TEST_RUNNER)*),)
	$(TEST_RUNNER) --gtest_output=xml:$(TOP)/test-reports/TEST-Keithley2700.xml
endif
