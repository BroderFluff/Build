include(CheckCXXCompilerFlag)

function(target_add_cxx_compiler_flags target)
    
    cmake_parse_arguments(args "" "" "FLAGS" ${ARGN})

    set(valid_flags "")

    foreach(flag IN LISTS args_FLAGS)
        string(REPLACE "-" "_" FLAG_NAME ${flag})
        string(REPLACE "=" "_" FLAG_NAME ${FLAG_NAME})
        string(REPLACE "+" "_" FLAG_NAME ${FLAG_NAME})
        string(REPLACE "," "_" FLAG_NAME ${FLAG_NAME})
        string(TOUPPER ${FLAG_NAME} FLAG_NAME)
        
        check_cxx_compiler_flag(${flag} HAS${FLAG_NAME})

        if (HAS${FLAG_NAME})
            list(APPEND valid_flags ${flag})
        endif()
    endforeach()

    #message(STATUS "flags: ${valid_flags}")

    target_compile_options("${target}"
        PRIVATE
            "${valid_flags}"
    )
endfunction()