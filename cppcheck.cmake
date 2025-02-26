# Will set the CXX_CPPCHECK property on the provided target
function(enable_cppcheck target)
    if (NOT CPPCHECK_PATH)
        find_program(CPPCHECK_PATH cppcheck REQUIRED)
        if (NOT CPPCHECK_PATH)
            message(FATAL_ERROR "cppcheck requested but program not found")
        endif()
    endif()

    set(CPPCHECK_CMD "${CPPCHECK_PATH}" --inline-suppr)

    set_target_properties(${target}
        PROPERTIES
            CXX_CPPCHECK "${CPPCHECK_CMD}"
    )
endfunction()