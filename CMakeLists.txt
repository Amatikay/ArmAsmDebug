cmake_minimum_required(VERSION 3.20)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

project(main LANGUAGES C ASM)

add_executable(${PROJECT_NAME}
    src/startup.s
    src/main.c
    src/functions.s
)

target_compile_options(${PROJECT_NAME} PRIVATE -g -mcpu=cortex-a8 -ffreestanding)
target_link_options(${PROJECT_NAME} PRIVATE -nostdlib -T ${CMAKE_SOURCE_DIR}/virtual_device/linker.ld)
set_target_properties(${PROJECT_NAME} PROPERTIES
    SUFFIX .elf
    LINK_DEPENDS ${CMAKE_SOURCE_DIR}/virtual_device/linker.ld
)
