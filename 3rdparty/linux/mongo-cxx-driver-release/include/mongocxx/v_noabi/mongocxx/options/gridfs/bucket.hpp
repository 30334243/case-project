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

#include <string>

#include <mongocxx/options/gridfs/bucket-fwd.hpp>

#include <bsoncxx/stdx/optional.hpp>

#include <mongocxx/read_concern.hpp>
#include <mongocxx/read_preference.hpp>
#include <mongocxx/write_concern.hpp>

#include <mongocxx/config/prelude.hpp>

namespace mongocxx {
namespace v_noabi {
namespace options {
namespace gridfs {

///
/// Used by @ref mongocxx::v_noabi::gridfs::bucket.
///
class bucket {
   public:
    ///
    /// Sets the name of the bucket. Defaults to 'fs'.
    ///
    /// @param bucket_name
    ///   The name of the bucket.
    ///
    /// @return
    ///   A reference to the object on which this member function is being called. This facilitates
    ///   method chaining.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bucket&) bucket_name(std::string bucket_name);

    ///
    /// Gets the name of the bucket.
    ///
    /// @return
    ///   The name of the bucket.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bsoncxx::v_noabi::stdx::optional<std::string> const&)
    bucket_name() const;

    ///
    /// Sets the size of the chunks in the bucket. This will be used as the chunk size for files
    /// uploaded through the bucket without a custom size specified. Defaults to 255KB (255 * 1024).
    ///
    /// @param chunk_size_bytes
    ///   The size of the chunks in bytes.
    ///
    /// @return
    ///   A reference to the object on which this member function is being called. This facilitates
    ///   method chaining.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bucket&) chunk_size_bytes(std::int32_t chunk_size_bytes);

    ///
    /// Gets the size of the chunks in the bucket.
    ///
    /// @return
    ///   The size of the chunks in the bucket in bytes.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bsoncxx::v_noabi::stdx::optional<std::int32_t> const&)
    chunk_size_bytes() const;

    ///
    /// Sets the read concern to be used when reading from the bucket. Defaults to the read
    /// concern of the database containing the bucket's collections.
    ///
    /// @param read_concern
    ///   The read concern of the bucket.
    ///
    /// @return
    ///   A reference to the object on which this member function is being called.  This facilitates
    ///   method chaining.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bucket&) read_concern(mongocxx::v_noabi::read_concern read_concern);

    ///
    /// Gets the read concern of the bucket.
    ///
    /// @return
    ///   The read concern of the bucket.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bsoncxx::v_noabi::stdx::optional<mongocxx::v_noabi::read_concern> const&)
    read_concern() const;

    ///
    /// Sets the read preference to be used when reading from the GridFS bucket. Defaults to the
    /// read preference of the database containing the bucket's collections.
    ///
    /// @note
    ///   Because many GridFS operations require multiple independent reads from separate
    ///   collections, use with secondaries is strongly discouraged because reads could go to
    ///   different secondaries, resulting in inconsistent data if all file and chunk documents have
    ///   not replicated to all secondaries.
    ///
    /// @param read_preference
    ///   The read preference of the GridFS bucket.
    ///
    /// @return
    ///   A reference to the object on which this member function is being called.  This facilitates
    ///   method chaining.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bucket&)
    read_preference(mongocxx::v_noabi::read_preference read_preference);

    ///
    /// Gets the read preference of the bucket.
    ///
    /// @return
    ///   The read preference of the bucket.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bsoncxx::v_noabi::stdx::optional<mongocxx::v_noabi::read_preference> const&)
    read_preference() const;

    ///
    /// Sets the write concern to be used when writing to the GridFS bucket. Defaults to the write
    /// concern of the database containing the bucket's collections.
    ///
    /// @param write_concern
    ///   The write concern of the GridFS bucket.
    ///
    /// @return
    ///   A reference to the object on which this member function is being called.  This facilitates
    ///   method chaining.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bucket&)
    write_concern(mongocxx::v_noabi::write_concern write_concern);

    ///
    /// Gets the write concern of the bucket.
    ///
    /// @return
    ///   The write concern of the bucket.
    ///
    MONGOCXX_ABI_EXPORT_CDECL(bsoncxx::v_noabi::stdx::optional<mongocxx::v_noabi::write_concern> const&)
    write_concern() const;

   private:
    bsoncxx::v_noabi::stdx::optional<std::string> _bucket_name;
    bsoncxx::v_noabi::stdx::optional<std::int32_t> _chunk_size_bytes;
    bsoncxx::v_noabi::stdx::optional<mongocxx::v_noabi::read_concern> _read_concern;
    bsoncxx::v_noabi::stdx::optional<mongocxx::v_noabi::read_preference> _read_preference;
    bsoncxx::v_noabi::stdx::optional<mongocxx::v_noabi::write_concern> _write_concern;
};

} // namespace gridfs
} // namespace options
} // namespace v_noabi
} // namespace mongocxx

#include <mongocxx/config/postlude.hpp>

///
/// @file
/// Provides @ref mongocxx::v_noabi::options::gridfs::bucket.
///
