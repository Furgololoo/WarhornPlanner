#pragma once

#include <QString>
#include <array>

constexpr const std::array kTicketColNames = {
    "TO DO", "IN PROGRESS", "BLOCKED", "IN TEST", "VALIDATED", "TDD", "DONE"};

constexpr const std::array kAppDirs = {"logs", "config", "images",
                                       "images/other", "images/users"};
const QString kConfigFileName = "app_config.json";
