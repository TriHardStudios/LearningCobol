TARGET = POS
SRC_FILES = POS.CBL
BUILD_PATH = bin

CXX = cobc
CFLAGS = -fixed -x

ifeq ($(OS), Windows_NT)
	SETUP = D:\sdks\cobol\set_env.cmd
	TARGET := $(TARGET).EXE
	DEBUG = gdb
	DEL = rm
else ifeq ($(shell uname -s), Darwin)
	DEBUG = lldb
	DEL = rm
else
	DEL = rm
	DEBUG = lldb
endif

all: $(TARGET)

setup: 
	mkdir $(BUILD_PATH)
	$(SETUP)

run: $(TARGET)
	./$(BUILD_PATH)/$(TARGET)

$(TARGET):
	$(CXX) $(CFLAGS) $(SRC_FILES) -o $(BUILD_PATH)/$(TARGET)

clean:
	$(DEL) $(BUILD_PATH)/$(TARGET)
