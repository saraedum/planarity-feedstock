cmake_minimum_required(VERSION 3.6)
project(planarity)
enable_language(C)

file(GLOB SOURCES c/*.c)
include_directories(c)
add_library(${PROJECT_NAME} SHARED ${SOURCES})
set_target_properties(${PROJECT_NAME} PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS True)

install(TARGETS ${PROJECT_NAME} 
            RUNTIME DESTINATION bin
            ARCHIVE DESTINATION lib
            LIBRARY DESTINATION lib)

file(GLOB HEADERS c/*.h)
install(FILES ${HEADERS} DESTINATION include/${PROJECT_NAME})
