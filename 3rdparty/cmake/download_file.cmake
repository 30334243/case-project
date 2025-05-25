message(STATUS "Downloading ${URL} to ${DEST}")

file(DOWNLOAD ${URL} ${DEST}
        SHOW_PROGRESS
        TIMEOUT 300
        STATUS download_status
        LOG download_log
)

list(GET download_status 0 status_code)
if(NOT status_code EQUAL 0)
    list(GET download_status 1 error_message)
    message(FATAL_ERROR "Download failed: ${error_message}\nLog: ${download_log}")
endif()

message(STATUS "Download completed successfully")