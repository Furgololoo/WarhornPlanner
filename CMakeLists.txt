cmake_minimum_required(VERSION 3.16)

project(WarhornPlanner VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 20)


find_package(Qt6 6.2 COMPONENTS Quick WebSockets REQUIRED)

qt_add_executable(appWarhornPlanner

    src/main.cpp

    # Config
    src/config/config.h

    # Main Class
    src/coffey.h src/coffey.cpp

    # Managers
    src/managers/objectmanager.h src/managers/objectmanager.cpp
    src/managers/boardmanager.h src/managers/boardmanager.cpp
    src/managers/networkmanager.h src/managers/networkmanager.cpp
    src/managers/accountmanager.h src/managers/accountmanager.cpp
    src/managers/ticketmanager.h src/managers/ticketmanager.cpp
    src/managers/popupmanager.h src/managers/popupmanager.cpp
    src/managers/configmanager.h src/managers/configmanager.cpp

    # Ticket
    src/ticket/ticketinfo.h src/ticket/ticketinfo.cpp
    src/ticket/ticketbase.h src/ticket/ticketbase.cpp
    src/ticket/ticket.h src/ticket/ticket.cpp

    # Popup
    src/popup/popup.h src/popup/popup.cpp
    src/popup/error.h src/popup/error.cpp
    src/popup/warning.h src/popup/warning.cpp
    src/popup/notify.h src/popup/notify.cpp

    # User
    src/user/user.h src/user/user.cpp

    # Resources
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
    PRIVATE Qt6::Quick Qt6::WebSockets)

install(TARGETS appWarhornPlanner
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
