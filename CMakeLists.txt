cmake_minimum_required(VERSION 3.16)

project(WarhornPlanner VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 20)


find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appWarhornPlanner

    src/main.cpp
    src/config/config.h

    src/coffey.h src/coffey.cpp

    src/managers/objectmanager.h src/managers/objectmanager.cpp
    src/managers/boardmanager.h src/managers/boardmanager.cpp
    src/managers/networkmanager.h src/managers/networkmanager.cpp
    src/managers/accountmanager.h src/managers/accountmanager.cpp

    # Ticket
    src/ticket/ticketinfo.h src/ticket/ticketinfo.cpp
    src/ticket/ticketbase.h src/ticket/ticketbase.cpp

    # User
    src/user/user.h src/user/user.cpp

    src/qml/qml.qrc
)

set_target_properties(appWarhornPlanner PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appWarhornPlanner
    PRIVATE Qt6::Quick)

install(TARGETS appWarhornPlanner
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
