check_function_exists(process_vm_readv HAVE_PROCESS_VM_READV)

set(CMAKE_EXTRA_INCLUDE_FILES asm/ptrace.h)
check_type_size("struct pt_regs" PT_REGS)
set(CMAKE_EXTRA_INCLUDE_FILES)

check_cxx_source_compiles("
#include <sys/ptrace.h>

int main(void)
{
    ptrace((__ptrace_request)PTRACE_ATTACH, 0, 0, 0);
    return 0;
}" HAVE_PTRACE_ENUM_ARGUMENT)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/config.h.in ${CMAKE_CURRENT_BINARY_DIR}/config.h)
