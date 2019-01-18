cmake_minimum_required(VERSION 3.6)
project(planarity)
enable_language(C)

file(GLOB SOURCES c/*.c)
list(FILTER SOURCES EXCLUDE REGEX "planarity.c|planarityCommandLine.c")

include_directories(c)
add_library(planarity SHARED ${SOURCES})
set_target_properties(planarity PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS True)

add_executable(planarity_exe c/planarity.c c/planarityCommandLine.c)
target_link_libraries(planarity_exe planarity)
set_target_properties(planarity_exe PROPERTIES OUTPUT_NAME planarity)

install(TARGETS planarity planarity_exe
            RUNTIME DESTINATION bin
            ARCHIVE DESTINATION lib
            LIBRARY DESTINATION lib)

file(GLOB HEADERS c/*.h)
install(FILES ${HEADERS} DESTINATION include/${PROJECT_NAME})
