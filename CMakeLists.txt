cmake_minimum_required(VERSION 3.20)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

project(main LANGUAGES ASM)

find_program(OBJCOPY arm-none-eabi-objcopy REQUIRED)

set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/linker.ld)

file(GLOB SRC_SOURCES CONFIGURE_DEPENDS ${CMAKE_SOURCE_DIR}/*.s)

add_executable(main ${SRC_SOURCES})
set_target_properties(main PROPERTIES
    SUFFIX ".elf"
    LINK_DEPENDS ${LINKER_SCRIPT}
)
target_compile_options(main PRIVATE -g -mcpu=cortex-a8)
target_link_options(main PRIVATE -nostdlib -nostartfiles -T ${LINKER_SCRIPT})

set(BIN_FILE ${CMAKE_BINARY_DIR}/main.bin)
add_custom_command(TARGET main POST_BUILD
    COMMAND ${OBJCOPY} -O binary $<TARGET_FILE:main> ${BIN_FILE}
    BYPRODUCTS ${BIN_FILE}
    COMMENT "Creating main.bin"
)
