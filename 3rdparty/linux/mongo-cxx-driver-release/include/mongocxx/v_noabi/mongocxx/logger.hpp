// Copyright 2009-present MongoDB, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#pragma once

#include <memory>

#include <mongocxx/logger-fwd.hpp>

#include <bsoncxx/stdx/string_view.hpp>

#include <mongocxx/config/prelude.hpp>

namespace mongocxx {
namespace v_noabi {

///
/// The log level of a log message.
///
enum class log_level {
    k_error,    ///< Log Level Error.
    k_critical, ///< Log Level Critical.
    k_warning,  ///< Log Level Warning.
    k_message,  ///< Log Level Message.
    k_info,     ///< Log Level Info.
    k_debug,    ///< Log Level Debug.
    k_trace,    ///< Log Level Trace.
};

///
/// Returns a stringification of the given log level.
///
/// @param level
///   The type to stringify.
///
/// @return a std::string representation of the type.
///
MONGOCXX_ABI_EXPORT_CDECL(bsoncxx::v_noabi::stdx::string_view) to_string(log_level level);

///
/// The interface which user-defined loggers must implement.
///
/// @see
/// - @ref mongocxx::v_noabi::instance
///
class logger {
   public:
    virtual ~logger();

    logger(logger&&) = default;
    logger& operator=(logger&&) = default;
    logger(logger const&) = default;
    logger& operator=(logger const&) = default;

    ///
    /// Handles a log message. User defined logger implementations may do whatever they wish when
    /// this is called, such as log the output to a file or send it to a remote server for analysis.
    ///
    /// @param level
    ///   The log level of the current log message
    /// @param domain
    ///   The domain of the current log message, such as 'client'
    /// @param message
    ///   The text of the current log message.
    virtual void operator()(
        log_level level,
        bsoncxx::v_noabi::stdx::string_view domain,
        bsoncxx::v_noabi::stdx::string_view message) noexcept = 0;

   protected:
    ///
    /// Default constructor
    ///
    logger();
};

} // namespace v_noabi
} // namespace mongocxx

namespace mongocxx {

using ::mongocxx::v_noabi::to_string;

} // namespace mongocxx

#include <mongocxx/config/postlude.hpp>

///
/// @file
/// Provides utilities related to mongocxx logging.
///
