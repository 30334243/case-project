list(APPEND CMAKE_MESSAGE_INDENT "[cache] ")
set(QUICKLY quickly)
add_subdirectory(quickly)
set(SLOWLY slowly)
add_subdirectory(slowly)

add_custom_target(
        diff_cache
        COMMAND curl -O "https://drive.google.com/file/d/1uZq717ey7N7iq0UZLUjxmPvV0JY5aOcD/view?usp=sharing"
)