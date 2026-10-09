cmake_minimum_required(VERSION 3.20)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

project(main LANGUAGES ASM)

set(CMAKE_EXECUTABLE_SUFFIX .elf)

file(GLOB SOURCES CONFIGURE_DEPENDS *.s)
add_executable(main ${SOURCES})

target_compile_options(main PRIVATE -g -mcpu=cortex-a8)

target_link_options(main PRIVATE -nostdlib -T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld)
set_target_properties(main PROPERTIES LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld)
