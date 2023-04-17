add_executable (main main.cpp)

set (CMAKE_CXX_STANDARD 14)

install(TARGETS main
        RUNTIME DESTINATION bin)