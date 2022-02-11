include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  GLFW
#################
set(CONAN_GLFW_ROOT "/home/eric/.conan/data/glfw/3.3.6/_/_/package/3e7c626a326fdadc4c93f195efa1603f300bf722")
set(CONAN_INCLUDE_DIRS_GLFW "/home/eric/.conan/data/glfw/3.3.6/_/_/package/3e7c626a326fdadc4c93f195efa1603f300bf722/include")
set(CONAN_LIB_DIRS_GLFW "/home/eric/.conan/data/glfw/3.3.6/_/_/package/3e7c626a326fdadc4c93f195efa1603f300bf722/lib")
set(CONAN_BIN_DIRS_GLFW )
set(CONAN_RES_DIRS_GLFW )
set(CONAN_SRC_DIRS_GLFW )
set(CONAN_BUILD_DIRS_GLFW "/home/eric/.conan/data/glfw/3.3.6/_/_/package/3e7c626a326fdadc4c93f195efa1603f300bf722/")
set(CONAN_FRAMEWORK_DIRS_GLFW )
set(CONAN_LIBS_GLFW glfw3)
set(CONAN_PKG_LIBS_GLFW glfw3)
set(CONAN_SYSTEM_LIBS_GLFW m pthread dl rt)
set(CONAN_FRAMEWORKS_GLFW )
set(CONAN_FRAMEWORKS_FOUND_GLFW "")  # Will be filled later
set(CONAN_DEFINES_GLFW )
set(CONAN_BUILD_MODULES_PATHS_GLFW )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLFW )

set(CONAN_C_FLAGS_GLFW "")
set(CONAN_CXX_FLAGS_GLFW "")
set(CONAN_SHARED_LINKER_FLAGS_GLFW "")
set(CONAN_EXE_LINKER_FLAGS_GLFW "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLFW_LIST "")
set(CONAN_CXX_FLAGS_GLFW_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLFW_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLFW_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLFW "${CONAN_FRAMEWORKS_GLFW}" "_GLFW" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLFW ${CONAN_PKG_LIBS_GLFW} ${CONAN_SYSTEM_LIBS_GLFW} ${CONAN_FRAMEWORKS_FOUND_GLFW})


#################
###  GLEW
#################
set(CONAN_GLEW_ROOT "/home/eric/.conan/data/glew/2.2.0/_/_/package/44d755ad550d5ae865104e5fce17a92b27f9ef4d")
set(CONAN_INCLUDE_DIRS_GLEW "/home/eric/.conan/data/glew/2.2.0/_/_/package/44d755ad550d5ae865104e5fce17a92b27f9ef4d/include")
set(CONAN_LIB_DIRS_GLEW "/home/eric/.conan/data/glew/2.2.0/_/_/package/44d755ad550d5ae865104e5fce17a92b27f9ef4d/lib")
set(CONAN_BIN_DIRS_GLEW )
set(CONAN_RES_DIRS_GLEW )
set(CONAN_SRC_DIRS_GLEW )
set(CONAN_BUILD_DIRS_GLEW "/home/eric/.conan/data/glew/2.2.0/_/_/package/44d755ad550d5ae865104e5fce17a92b27f9ef4d/")
set(CONAN_FRAMEWORK_DIRS_GLEW )
set(CONAN_LIBS_GLEW GLEW)
set(CONAN_PKG_LIBS_GLEW GLEW)
set(CONAN_SYSTEM_LIBS_GLEW )
set(CONAN_FRAMEWORKS_GLEW )
set(CONAN_FRAMEWORKS_FOUND_GLEW "")  # Will be filled later
set(CONAN_DEFINES_GLEW )
set(CONAN_BUILD_MODULES_PATHS_GLEW )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLEW )

set(CONAN_C_FLAGS_GLEW "")
set(CONAN_CXX_FLAGS_GLEW "")
set(CONAN_SHARED_LINKER_FLAGS_GLEW "")
set(CONAN_EXE_LINKER_FLAGS_GLEW "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLEW_LIST "")
set(CONAN_CXX_FLAGS_GLEW_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLEW_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLEW_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLEW "${CONAN_FRAMEWORKS_GLEW}" "_GLEW" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLEW ${CONAN_PKG_LIBS_GLEW} ${CONAN_SYSTEM_LIBS_GLEW} ${CONAN_FRAMEWORKS_FOUND_GLEW})


#################
###  GLM
#################
set(CONAN_GLM_ROOT "/home/eric/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_GLM "/home/eric/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_GLM )
set(CONAN_BIN_DIRS_GLM )
set(CONAN_RES_DIRS_GLM )
set(CONAN_SRC_DIRS_GLM )
set(CONAN_BUILD_DIRS_GLM "/home/eric/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_GLM )
set(CONAN_LIBS_GLM )
set(CONAN_PKG_LIBS_GLM )
set(CONAN_SYSTEM_LIBS_GLM )
set(CONAN_FRAMEWORKS_GLM )
set(CONAN_FRAMEWORKS_FOUND_GLM "")  # Will be filled later
set(CONAN_DEFINES_GLM )
set(CONAN_BUILD_MODULES_PATHS_GLM )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLM )

set(CONAN_C_FLAGS_GLM "")
set(CONAN_CXX_FLAGS_GLM "")
set(CONAN_SHARED_LINKER_FLAGS_GLM "")
set(CONAN_EXE_LINKER_FLAGS_GLM "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLM_LIST "")
set(CONAN_CXX_FLAGS_GLM_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLM_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLM_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLM "${CONAN_FRAMEWORKS_GLM}" "_GLM" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLM ${CONAN_PKG_LIBS_GLM} ${CONAN_SYSTEM_LIBS_GLM} ${CONAN_FRAMEWORKS_FOUND_GLM})


#################
###  ASSIMP
#################
set(CONAN_ASSIMP_ROOT "/home/eric/.conan/data/assimp/5.1.0/_/_/package/2d34d3a9840990cf9cda5b5d0c4262c370949a2c")
set(CONAN_INCLUDE_DIRS_ASSIMP "/home/eric/.conan/data/assimp/5.1.0/_/_/package/2d34d3a9840990cf9cda5b5d0c4262c370949a2c/include")
set(CONAN_LIB_DIRS_ASSIMP "/home/eric/.conan/data/assimp/5.1.0/_/_/package/2d34d3a9840990cf9cda5b5d0c4262c370949a2c/lib")
set(CONAN_BIN_DIRS_ASSIMP )
set(CONAN_RES_DIRS_ASSIMP )
set(CONAN_SRC_DIRS_ASSIMP )
set(CONAN_BUILD_DIRS_ASSIMP "/home/eric/.conan/data/assimp/5.1.0/_/_/package/2d34d3a9840990cf9cda5b5d0c4262c370949a2c/")
set(CONAN_FRAMEWORK_DIRS_ASSIMP )
set(CONAN_LIBS_ASSIMP assimp)
set(CONAN_PKG_LIBS_ASSIMP assimp)
set(CONAN_SYSTEM_LIBS_ASSIMP rt m pthread stdc++)
set(CONAN_FRAMEWORKS_ASSIMP )
set(CONAN_FRAMEWORKS_FOUND_ASSIMP "")  # Will be filled later
set(CONAN_DEFINES_ASSIMP )
set(CONAN_BUILD_MODULES_PATHS_ASSIMP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ASSIMP )

set(CONAN_C_FLAGS_ASSIMP "")
set(CONAN_CXX_FLAGS_ASSIMP "")
set(CONAN_SHARED_LINKER_FLAGS_ASSIMP "")
set(CONAN_EXE_LINKER_FLAGS_ASSIMP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ASSIMP_LIST "")
set(CONAN_CXX_FLAGS_ASSIMP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ASSIMP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ASSIMP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ASSIMP "${CONAN_FRAMEWORKS_ASSIMP}" "_ASSIMP" "")
# Append to aggregated values variable
set(CONAN_LIBS_ASSIMP ${CONAN_PKG_LIBS_ASSIMP} ${CONAN_SYSTEM_LIBS_ASSIMP} ${CONAN_FRAMEWORKS_FOUND_ASSIMP})


#################
###  STB
#################
set(CONAN_STB_ROOT "/home/eric/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_STB "/home/eric/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_STB )
set(CONAN_BIN_DIRS_STB )
set(CONAN_RES_DIRS_STB )
set(CONAN_SRC_DIRS_STB )
set(CONAN_BUILD_DIRS_STB "/home/eric/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_STB )
set(CONAN_LIBS_STB )
set(CONAN_PKG_LIBS_STB )
set(CONAN_SYSTEM_LIBS_STB )
set(CONAN_FRAMEWORKS_STB )
set(CONAN_FRAMEWORKS_FOUND_STB "")  # Will be filled later
set(CONAN_DEFINES_STB "-DSTB_TEXTEDIT_KEYTYPE=unsigned")
set(CONAN_BUILD_MODULES_PATHS_STB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_STB "STB_TEXTEDIT_KEYTYPE=unsigned")

set(CONAN_C_FLAGS_STB "")
set(CONAN_CXX_FLAGS_STB "")
set(CONAN_SHARED_LINKER_FLAGS_STB "")
set(CONAN_EXE_LINKER_FLAGS_STB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_STB_LIST "")
set(CONAN_CXX_FLAGS_STB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_STB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_STB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_STB "${CONAN_FRAMEWORKS_STB}" "_STB" "")
# Append to aggregated values variable
set(CONAN_LIBS_STB ${CONAN_PKG_LIBS_STB} ${CONAN_SYSTEM_LIBS_STB} ${CONAN_FRAMEWORKS_FOUND_STB})


#################
###  XORG
#################
set(CONAN_XORG_ROOT "/home/eric/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_XORG "/usr/include/uuid"
			"/usr/include/freetype2"
			"/usr/include/libpng16")
set(CONAN_LIB_DIRS_XORG )
set(CONAN_BIN_DIRS_XORG )
set(CONAN_RES_DIRS_XORG )
set(CONAN_SRC_DIRS_XORG )
set(CONAN_BUILD_DIRS_XORG "/home/eric/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_XORG )
set(CONAN_LIBS_XORG )
set(CONAN_PKG_LIBS_XORG )
set(CONAN_SYSTEM_LIBS_XORG X11 X11-xcb xcb fontenc ICE SM Xau Xaw7 Xt Xcomposite Xcursor Xdamage Xfixes Xdmcp Xext Xft Xi Xinerama xkbfile Xmu Xmuu Xpm Xrandr Xrender XRes Xss Xtst Xv XvMC Xxf86vm xcb-xkb xcb-icccm xcb-image xcb-shm xcb-keysyms xcb-randr xcb-render xcb-render-util xcb-shape xcb-sync xcb-xfixes xcb-xinerama xcb-util xcb-dri3)
set(CONAN_FRAMEWORKS_XORG )
set(CONAN_FRAMEWORKS_FOUND_XORG "")  # Will be filled later
set(CONAN_DEFINES_XORG "-D_DEFAULT_SOURCE"
			"-D_BSD_SOURCE"
			"-DHAS_FCHOWN"
			"-DHAS_STICKY_DIR_BIT")
set(CONAN_BUILD_MODULES_PATHS_XORG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_XORG "_DEFAULT_SOURCE"
			"_BSD_SOURCE"
			"HAS_FCHOWN"
			"HAS_STICKY_DIR_BIT")

set(CONAN_C_FLAGS_XORG "")
set(CONAN_CXX_FLAGS_XORG "")
set(CONAN_SHARED_LINKER_FLAGS_XORG "")
set(CONAN_EXE_LINKER_FLAGS_XORG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_XORG_LIST "")
set(CONAN_CXX_FLAGS_XORG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_XORG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_XORG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_XORG "${CONAN_FRAMEWORKS_XORG}" "_XORG" "")
# Append to aggregated values variable
set(CONAN_LIBS_XORG ${CONAN_PKG_LIBS_XORG} ${CONAN_SYSTEM_LIBS_XORG} ${CONAN_FRAMEWORKS_FOUND_XORG})


#################
###  GLU
#################
set(CONAN_GLU_ROOT "/home/eric/.conan/data/glu/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_GLU )
set(CONAN_LIB_DIRS_GLU )
set(CONAN_BIN_DIRS_GLU )
set(CONAN_RES_DIRS_GLU )
set(CONAN_SRC_DIRS_GLU )
set(CONAN_BUILD_DIRS_GLU "/home/eric/.conan/data/glu/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_GLU )
set(CONAN_LIBS_GLU )
set(CONAN_PKG_LIBS_GLU )
set(CONAN_SYSTEM_LIBS_GLU GLU GL)
set(CONAN_FRAMEWORKS_GLU )
set(CONAN_FRAMEWORKS_FOUND_GLU "")  # Will be filled later
set(CONAN_DEFINES_GLU )
set(CONAN_BUILD_MODULES_PATHS_GLU )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_GLU )

set(CONAN_C_FLAGS_GLU "")
set(CONAN_CXX_FLAGS_GLU "")
set(CONAN_SHARED_LINKER_FLAGS_GLU "")
set(CONAN_EXE_LINKER_FLAGS_GLU "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_GLU_LIST "")
set(CONAN_CXX_FLAGS_GLU_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_GLU_LIST "")
set(CONAN_EXE_LINKER_FLAGS_GLU_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_GLU "${CONAN_FRAMEWORKS_GLU}" "_GLU" "")
# Append to aggregated values variable
set(CONAN_LIBS_GLU ${CONAN_PKG_LIBS_GLU} ${CONAN_SYSTEM_LIBS_GLU} ${CONAN_FRAMEWORKS_FOUND_GLU})


#################
###  PUGIXML
#################
set(CONAN_PUGIXML_ROOT "/home/eric/.conan/data/pugixml/1.11/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e")
set(CONAN_INCLUDE_DIRS_PUGIXML "/home/eric/.conan/data/pugixml/1.11/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/include")
set(CONAN_LIB_DIRS_PUGIXML "/home/eric/.conan/data/pugixml/1.11/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/lib")
set(CONAN_BIN_DIRS_PUGIXML )
set(CONAN_RES_DIRS_PUGIXML )
set(CONAN_SRC_DIRS_PUGIXML )
set(CONAN_BUILD_DIRS_PUGIXML "/home/eric/.conan/data/pugixml/1.11/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/")
set(CONAN_FRAMEWORK_DIRS_PUGIXML )
set(CONAN_LIBS_PUGIXML pugixml)
set(CONAN_PKG_LIBS_PUGIXML pugixml)
set(CONAN_SYSTEM_LIBS_PUGIXML )
set(CONAN_FRAMEWORKS_PUGIXML )
set(CONAN_FRAMEWORKS_FOUND_PUGIXML "")  # Will be filled later
set(CONAN_DEFINES_PUGIXML )
set(CONAN_BUILD_MODULES_PATHS_PUGIXML )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_PUGIXML )

set(CONAN_C_FLAGS_PUGIXML "")
set(CONAN_CXX_FLAGS_PUGIXML "")
set(CONAN_SHARED_LINKER_FLAGS_PUGIXML "")
set(CONAN_EXE_LINKER_FLAGS_PUGIXML "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_PUGIXML_LIST "")
set(CONAN_CXX_FLAGS_PUGIXML_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_PUGIXML_LIST "")
set(CONAN_EXE_LINKER_FLAGS_PUGIXML_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_PUGIXML "${CONAN_FRAMEWORKS_PUGIXML}" "_PUGIXML" "")
# Append to aggregated values variable
set(CONAN_LIBS_PUGIXML ${CONAN_PKG_LIBS_PUGIXML} ${CONAN_SYSTEM_LIBS_PUGIXML} ${CONAN_FRAMEWORKS_FOUND_PUGIXML})


#################
###  MINIZIP
#################
set(CONAN_MINIZIP_ROOT "/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda")
set(CONAN_INCLUDE_DIRS_MINIZIP "/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda/include"
			"/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda/include/minizip")
set(CONAN_LIB_DIRS_MINIZIP "/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda/lib")
set(CONAN_BIN_DIRS_MINIZIP )
set(CONAN_RES_DIRS_MINIZIP )
set(CONAN_SRC_DIRS_MINIZIP )
set(CONAN_BUILD_DIRS_MINIZIP "/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda/")
set(CONAN_FRAMEWORK_DIRS_MINIZIP )
set(CONAN_LIBS_MINIZIP minizip)
set(CONAN_PKG_LIBS_MINIZIP minizip)
set(CONAN_SYSTEM_LIBS_MINIZIP )
set(CONAN_FRAMEWORKS_MINIZIP )
set(CONAN_FRAMEWORKS_FOUND_MINIZIP "")  # Will be filled later
set(CONAN_DEFINES_MINIZIP "-DHAVE_BZIP2")
set(CONAN_BUILD_MODULES_PATHS_MINIZIP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_MINIZIP "HAVE_BZIP2")

set(CONAN_C_FLAGS_MINIZIP "")
set(CONAN_CXX_FLAGS_MINIZIP "")
set(CONAN_SHARED_LINKER_FLAGS_MINIZIP "")
set(CONAN_EXE_LINKER_FLAGS_MINIZIP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_MINIZIP_LIST "")
set(CONAN_CXX_FLAGS_MINIZIP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_MINIZIP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_MINIZIP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_MINIZIP "${CONAN_FRAMEWORKS_MINIZIP}" "_MINIZIP" "")
# Append to aggregated values variable
set(CONAN_LIBS_MINIZIP ${CONAN_PKG_LIBS_MINIZIP} ${CONAN_SYSTEM_LIBS_MINIZIP} ${CONAN_FRAMEWORKS_FOUND_MINIZIP})


#################
###  UTFCPP
#################
set(CONAN_UTFCPP_ROOT "/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_UTFCPP "/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/utf8cpp")
set(CONAN_LIB_DIRS_UTFCPP "/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib")
set(CONAN_BIN_DIRS_UTFCPP )
set(CONAN_RES_DIRS_UTFCPP )
set(CONAN_SRC_DIRS_UTFCPP )
set(CONAN_BUILD_DIRS_UTFCPP "/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_UTFCPP )
set(CONAN_LIBS_UTFCPP )
set(CONAN_PKG_LIBS_UTFCPP )
set(CONAN_SYSTEM_LIBS_UTFCPP )
set(CONAN_FRAMEWORKS_UTFCPP )
set(CONAN_FRAMEWORKS_FOUND_UTFCPP "")  # Will be filled later
set(CONAN_DEFINES_UTFCPP )
set(CONAN_BUILD_MODULES_PATHS_UTFCPP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_UTFCPP )

set(CONAN_C_FLAGS_UTFCPP "")
set(CONAN_CXX_FLAGS_UTFCPP "")
set(CONAN_SHARED_LINKER_FLAGS_UTFCPP "")
set(CONAN_EXE_LINKER_FLAGS_UTFCPP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_UTFCPP_LIST "")
set(CONAN_CXX_FLAGS_UTFCPP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_UTFCPP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_UTFCPP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_UTFCPP "${CONAN_FRAMEWORKS_UTFCPP}" "_UTFCPP" "")
# Append to aggregated values variable
set(CONAN_LIBS_UTFCPP ${CONAN_PKG_LIBS_UTFCPP} ${CONAN_SYSTEM_LIBS_UTFCPP} ${CONAN_FRAMEWORKS_FOUND_UTFCPP})


#################
###  KUBA-ZIP
#################
set(CONAN_KUBA-ZIP_ROOT "/home/eric/.conan/data/kuba-zip/0.1.31/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646")
set(CONAN_INCLUDE_DIRS_KUBA-ZIP "/home/eric/.conan/data/kuba-zip/0.1.31/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include")
set(CONAN_LIB_DIRS_KUBA-ZIP "/home/eric/.conan/data/kuba-zip/0.1.31/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib")
set(CONAN_BIN_DIRS_KUBA-ZIP )
set(CONAN_RES_DIRS_KUBA-ZIP )
set(CONAN_SRC_DIRS_KUBA-ZIP )
set(CONAN_BUILD_DIRS_KUBA-ZIP "/home/eric/.conan/data/kuba-zip/0.1.31/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/")
set(CONAN_FRAMEWORK_DIRS_KUBA-ZIP )
set(CONAN_LIBS_KUBA-ZIP zip)
set(CONAN_PKG_LIBS_KUBA-ZIP zip)
set(CONAN_SYSTEM_LIBS_KUBA-ZIP )
set(CONAN_FRAMEWORKS_KUBA-ZIP )
set(CONAN_FRAMEWORKS_FOUND_KUBA-ZIP "")  # Will be filled later
set(CONAN_DEFINES_KUBA-ZIP )
set(CONAN_BUILD_MODULES_PATHS_KUBA-ZIP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_KUBA-ZIP )

set(CONAN_C_FLAGS_KUBA-ZIP "")
set(CONAN_CXX_FLAGS_KUBA-ZIP "")
set(CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP "")
set(CONAN_EXE_LINKER_FLAGS_KUBA-ZIP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_KUBA-ZIP_LIST "")
set(CONAN_CXX_FLAGS_KUBA-ZIP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_KUBA-ZIP "${CONAN_FRAMEWORKS_KUBA-ZIP}" "_KUBA-ZIP" "")
# Append to aggregated values variable
set(CONAN_LIBS_KUBA-ZIP ${CONAN_PKG_LIBS_KUBA-ZIP} ${CONAN_SYSTEM_LIBS_KUBA-ZIP} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP})


#################
###  POLY2TRI
#################
set(CONAN_POLY2TRI_ROOT "/home/eric/.conan/data/poly2tri/cci.20130502/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e")
set(CONAN_INCLUDE_DIRS_POLY2TRI "/home/eric/.conan/data/poly2tri/cci.20130502/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/include")
set(CONAN_LIB_DIRS_POLY2TRI "/home/eric/.conan/data/poly2tri/cci.20130502/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/lib")
set(CONAN_BIN_DIRS_POLY2TRI )
set(CONAN_RES_DIRS_POLY2TRI )
set(CONAN_SRC_DIRS_POLY2TRI )
set(CONAN_BUILD_DIRS_POLY2TRI "/home/eric/.conan/data/poly2tri/cci.20130502/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/")
set(CONAN_FRAMEWORK_DIRS_POLY2TRI )
set(CONAN_LIBS_POLY2TRI poly2tri)
set(CONAN_PKG_LIBS_POLY2TRI poly2tri)
set(CONAN_SYSTEM_LIBS_POLY2TRI )
set(CONAN_FRAMEWORKS_POLY2TRI )
set(CONAN_FRAMEWORKS_FOUND_POLY2TRI "")  # Will be filled later
set(CONAN_DEFINES_POLY2TRI )
set(CONAN_BUILD_MODULES_PATHS_POLY2TRI )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_POLY2TRI )

set(CONAN_C_FLAGS_POLY2TRI "")
set(CONAN_CXX_FLAGS_POLY2TRI "")
set(CONAN_SHARED_LINKER_FLAGS_POLY2TRI "")
set(CONAN_EXE_LINKER_FLAGS_POLY2TRI "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_POLY2TRI_LIST "")
set(CONAN_CXX_FLAGS_POLY2TRI_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_POLY2TRI_LIST "")
set(CONAN_EXE_LINKER_FLAGS_POLY2TRI_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_POLY2TRI "${CONAN_FRAMEWORKS_POLY2TRI}" "_POLY2TRI" "")
# Append to aggregated values variable
set(CONAN_LIBS_POLY2TRI ${CONAN_PKG_LIBS_POLY2TRI} ${CONAN_SYSTEM_LIBS_POLY2TRI} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI})


#################
###  RAPIDJSON
#################
set(CONAN_RAPIDJSON_ROOT "/home/eric/.conan/data/rapidjson/cci.20200410/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_RAPIDJSON "/home/eric/.conan/data/rapidjson/cci.20200410/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_RAPIDJSON )
set(CONAN_BIN_DIRS_RAPIDJSON )
set(CONAN_RES_DIRS_RAPIDJSON )
set(CONAN_SRC_DIRS_RAPIDJSON )
set(CONAN_BUILD_DIRS_RAPIDJSON "/home/eric/.conan/data/rapidjson/cci.20200410/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_RAPIDJSON )
set(CONAN_LIBS_RAPIDJSON )
set(CONAN_PKG_LIBS_RAPIDJSON )
set(CONAN_SYSTEM_LIBS_RAPIDJSON )
set(CONAN_FRAMEWORKS_RAPIDJSON )
set(CONAN_FRAMEWORKS_FOUND_RAPIDJSON "")  # Will be filled later
set(CONAN_DEFINES_RAPIDJSON )
set(CONAN_BUILD_MODULES_PATHS_RAPIDJSON )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_RAPIDJSON )

set(CONAN_C_FLAGS_RAPIDJSON "")
set(CONAN_CXX_FLAGS_RAPIDJSON "")
set(CONAN_SHARED_LINKER_FLAGS_RAPIDJSON "")
set(CONAN_EXE_LINKER_FLAGS_RAPIDJSON "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_RAPIDJSON_LIST "")
set(CONAN_CXX_FLAGS_RAPIDJSON_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_LIST "")
set(CONAN_EXE_LINKER_FLAGS_RAPIDJSON_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_RAPIDJSON "${CONAN_FRAMEWORKS_RAPIDJSON}" "_RAPIDJSON" "")
# Append to aggregated values variable
set(CONAN_LIBS_RAPIDJSON ${CONAN_PKG_LIBS_RAPIDJSON} ${CONAN_SYSTEM_LIBS_RAPIDJSON} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON})


#################
###  DRACO
#################
set(CONAN_DRACO_ROOT "/home/eric/.conan/data/draco/1.4.3/_/_/package/cde31b514152d4d6c90034134c0a11c4e3e56b09")
set(CONAN_INCLUDE_DIRS_DRACO "/home/eric/.conan/data/draco/1.4.3/_/_/package/cde31b514152d4d6c90034134c0a11c4e3e56b09/include")
set(CONAN_LIB_DIRS_DRACO "/home/eric/.conan/data/draco/1.4.3/_/_/package/cde31b514152d4d6c90034134c0a11c4e3e56b09/lib")
set(CONAN_BIN_DIRS_DRACO )
set(CONAN_RES_DIRS_DRACO )
set(CONAN_SRC_DIRS_DRACO )
set(CONAN_BUILD_DIRS_DRACO "/home/eric/.conan/data/draco/1.4.3/_/_/package/cde31b514152d4d6c90034134c0a11c4e3e56b09/")
set(CONAN_FRAMEWORK_DIRS_DRACO )
set(CONAN_LIBS_DRACO draco)
set(CONAN_PKG_LIBS_DRACO draco)
set(CONAN_SYSTEM_LIBS_DRACO m)
set(CONAN_FRAMEWORKS_DRACO )
set(CONAN_FRAMEWORKS_FOUND_DRACO "")  # Will be filled later
set(CONAN_DEFINES_DRACO )
set(CONAN_BUILD_MODULES_PATHS_DRACO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_DRACO )

set(CONAN_C_FLAGS_DRACO "")
set(CONAN_CXX_FLAGS_DRACO "")
set(CONAN_SHARED_LINKER_FLAGS_DRACO "")
set(CONAN_EXE_LINKER_FLAGS_DRACO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_DRACO_LIST "")
set(CONAN_CXX_FLAGS_DRACO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_DRACO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_DRACO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_DRACO "${CONAN_FRAMEWORKS_DRACO}" "_DRACO" "")
# Append to aggregated values variable
set(CONAN_LIBS_DRACO ${CONAN_PKG_LIBS_DRACO} ${CONAN_SYSTEM_LIBS_DRACO} ${CONAN_FRAMEWORKS_FOUND_DRACO})


#################
###  OPENGL
#################
set(CONAN_OPENGL_ROOT "/home/eric/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_OPENGL )
set(CONAN_LIB_DIRS_OPENGL )
set(CONAN_BIN_DIRS_OPENGL )
set(CONAN_RES_DIRS_OPENGL )
set(CONAN_SRC_DIRS_OPENGL )
set(CONAN_BUILD_DIRS_OPENGL "/home/eric/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_OPENGL )
set(CONAN_LIBS_OPENGL )
set(CONAN_PKG_LIBS_OPENGL )
set(CONAN_SYSTEM_LIBS_OPENGL GL)
set(CONAN_FRAMEWORKS_OPENGL )
set(CONAN_FRAMEWORKS_FOUND_OPENGL "")  # Will be filled later
set(CONAN_DEFINES_OPENGL )
set(CONAN_BUILD_MODULES_PATHS_OPENGL )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPENGL )

set(CONAN_C_FLAGS_OPENGL "")
set(CONAN_CXX_FLAGS_OPENGL "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPENGL_LIST "")
set(CONAN_CXX_FLAGS_OPENGL_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPENGL_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPENGL "${CONAN_FRAMEWORKS_OPENGL}" "_OPENGL" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPENGL ${CONAN_PKG_LIBS_OPENGL} ${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL})


#################
###  ZLIB
#################
set(CONAN_ZLIB_ROOT "/home/eric/.conan/data/zlib/1.2.11/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646")
set(CONAN_INCLUDE_DIRS_ZLIB "/home/eric/.conan/data/zlib/1.2.11/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include")
set(CONAN_LIB_DIRS_ZLIB "/home/eric/.conan/data/zlib/1.2.11/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib")
set(CONAN_BIN_DIRS_ZLIB )
set(CONAN_RES_DIRS_ZLIB )
set(CONAN_SRC_DIRS_ZLIB )
set(CONAN_BUILD_DIRS_ZLIB "/home/eric/.conan/data/zlib/1.2.11/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/")
set(CONAN_FRAMEWORK_DIRS_ZLIB )
set(CONAN_LIBS_ZLIB z)
set(CONAN_PKG_LIBS_ZLIB z)
set(CONAN_SYSTEM_LIBS_ZLIB )
set(CONAN_FRAMEWORKS_ZLIB )
set(CONAN_FRAMEWORKS_FOUND_ZLIB "")  # Will be filled later
set(CONAN_DEFINES_ZLIB )
set(CONAN_BUILD_MODULES_PATHS_ZLIB )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ZLIB )

set(CONAN_C_FLAGS_ZLIB "")
set(CONAN_CXX_FLAGS_ZLIB "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ZLIB_LIST "")
set(CONAN_CXX_FLAGS_ZLIB_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ZLIB_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ZLIB "${CONAN_FRAMEWORKS_ZLIB}" "_ZLIB" "")
# Append to aggregated values variable
set(CONAN_LIBS_ZLIB ${CONAN_PKG_LIBS_ZLIB} ${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB})


#################
###  BZIP2
#################
set(CONAN_BZIP2_ROOT "/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e")
set(CONAN_INCLUDE_DIRS_BZIP2 "/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/include")
set(CONAN_LIB_DIRS_BZIP2 "/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/lib")
set(CONAN_BIN_DIRS_BZIP2 "/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/bin")
set(CONAN_RES_DIRS_BZIP2 )
set(CONAN_SRC_DIRS_BZIP2 )
set(CONAN_BUILD_DIRS_BZIP2 "/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/"
			"/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/lib/cmake")
set(CONAN_FRAMEWORK_DIRS_BZIP2 )
set(CONAN_LIBS_BZIP2 bz2)
set(CONAN_PKG_LIBS_BZIP2 bz2)
set(CONAN_SYSTEM_LIBS_BZIP2 )
set(CONAN_FRAMEWORKS_BZIP2 )
set(CONAN_FRAMEWORKS_FOUND_BZIP2 "")  # Will be filled later
set(CONAN_DEFINES_BZIP2 )
set(CONAN_BUILD_MODULES_PATHS_BZIP2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_BZIP2 )

set(CONAN_C_FLAGS_BZIP2 "")
set(CONAN_CXX_FLAGS_BZIP2 "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2 "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_BZIP2_LIST "")
set(CONAN_CXX_FLAGS_BZIP2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_BZIP2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_BZIP2 "${CONAN_FRAMEWORKS_BZIP2}" "_BZIP2" "")
# Append to aggregated values variable
set(CONAN_LIBS_BZIP2 ${CONAN_PKG_LIBS_BZIP2} ${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "Release")
set(CONAN_SETTINGS_COMPILER "gcc")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libstdc++11")
set(CONAN_SETTINGS_COMPILER_VERSION "11")
set(CONAN_SETTINGS_OS "Linux")
set(CONAN_SETTINGS_OS_BUILD "Linux")

set(CONAN_DEPENDENCIES glfw glew glm assimp stb xorg glu pugixml minizip utfcpp kuba-zip poly2tri rapidjson draco opengl zlib bzip2)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/home/eric/.conan/data/glfw/3.3.6/_/_/package/3e7c626a326fdadc4c93f195efa1603f300bf722/include"
			"/home/eric/.conan/data/glew/2.2.0/_/_/package/44d755ad550d5ae865104e5fce17a92b27f9ef4d/include"
			"/home/eric/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/home/eric/.conan/data/assimp/5.1.0/_/_/package/2d34d3a9840990cf9cda5b5d0c4262c370949a2c/include"
			"/home/eric/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/usr/include/uuid"
			"/usr/include/freetype2"
			"/usr/include/libpng16"
			"/home/eric/.conan/data/pugixml/1.11/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/include"
			"/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda/include"
			"/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda/include/minizip"
			"/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include/utf8cpp"
			"/home/eric/.conan/data/kuba-zip/0.1.31/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include"
			"/home/eric/.conan/data/poly2tri/cci.20130502/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/include"
			"/home/eric/.conan/data/rapidjson/cci.20200410/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/home/eric/.conan/data/draco/1.4.3/_/_/package/cde31b514152d4d6c90034134c0a11c4e3e56b09/include"
			"/home/eric/.conan/data/zlib/1.2.11/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/include"
			"/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/home/eric/.conan/data/glfw/3.3.6/_/_/package/3e7c626a326fdadc4c93f195efa1603f300bf722/lib"
			"/home/eric/.conan/data/glew/2.2.0/_/_/package/44d755ad550d5ae865104e5fce17a92b27f9ef4d/lib"
			"/home/eric/.conan/data/assimp/5.1.0/_/_/package/2d34d3a9840990cf9cda5b5d0c4262c370949a2c/lib"
			"/home/eric/.conan/data/pugixml/1.11/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/lib"
			"/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda/lib"
			"/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib"
			"/home/eric/.conan/data/kuba-zip/0.1.31/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib"
			"/home/eric/.conan/data/poly2tri/cci.20130502/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/lib"
			"/home/eric/.conan/data/draco/1.4.3/_/_/package/cde31b514152d4d6c90034134c0a11c4e3e56b09/lib"
			"/home/eric/.conan/data/zlib/1.2.11/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/lib"
			"/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS  ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS glfw3 GLEW assimp pugixml minizip zip poly2tri draco z bz2 ${CONAN_LIBS})
set(CONAN_PKG_LIBS glfw3 GLEW assimp pugixml minizip zip poly2tri draco z bz2 ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS dl rt pthread stdc++ X11 X11-xcb xcb fontenc ICE SM Xau Xaw7 Xt Xcomposite Xcursor Xdamage Xfixes Xdmcp Xext Xft Xi Xinerama xkbfile Xmu Xmuu Xpm Xrandr Xrender XRes Xss Xtst Xv XvMC Xxf86vm xcb-xkb xcb-icccm xcb-image xcb-shm xcb-keysyms xcb-randr xcb-render xcb-render-util xcb-shape xcb-sync xcb-xfixes xcb-xinerama xcb-util xcb-dri3 GLU m GL ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DHAVE_BZIP2"
			"-D_DEFAULT_SOURCE"
			"-D_BSD_SOURCE"
			"-DHAS_FCHOWN"
			"-DHAS_STICKY_DIR_BIT"
			"-DSTB_TEXTEDIT_KEYTYPE=unsigned" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/home/eric/.conan/data/glfw/3.3.6/_/_/package/3e7c626a326fdadc4c93f195efa1603f300bf722/"
			"/home/eric/.conan/data/glew/2.2.0/_/_/package/44d755ad550d5ae865104e5fce17a92b27f9ef4d/"
			"/home/eric/.conan/data/glm/0.9.9.8/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/eric/.conan/data/assimp/5.1.0/_/_/package/2d34d3a9840990cf9cda5b5d0c4262c370949a2c/"
			"/home/eric/.conan/data/stb/cci.20210910/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/eric/.conan/data/xorg/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/eric/.conan/data/glu/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/eric/.conan/data/pugixml/1.11/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/"
			"/home/eric/.conan/data/minizip/1.2.11/_/_/package/5d4c7f15f7da1ee7b71e4fe557b9fcd17b47abda/"
			"/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/eric/.conan/data/utfcpp/3.1.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/cmake"
			"/home/eric/.conan/data/kuba-zip/0.1.31/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/"
			"/home/eric/.conan/data/poly2tri/cci.20130502/_/_/package/6557f18ca99c0b6a233f43db00e30efaa525e27e/"
			"/home/eric/.conan/data/rapidjson/cci.20200410/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/eric/.conan/data/draco/1.4.3/_/_/package/cde31b514152d4d6c90034134c0a11c4e3e56b09/"
			"/home/eric/.conan/data/opengl/system/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/home/eric/.conan/data/zlib/1.2.11/_/_/package/dfbe50feef7f3c6223a476cd5aeadb687084a646/"
			"/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/"
			"/home/eric/.conan/data/bzip2/1.0.8/_/_/package/c32092bf4d4bb47cf962af898e02823f499b017e/lib/cmake" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLFW} ${CONAN_FRAMEWORKS_FOUND_GLFW} CONAN_PKG::opengl CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW}" "${CONAN_LIB_DIRS_GLFW}"
                                  CONAN_PACKAGE_TARGETS_GLFW "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES}"
                                  "" glfw)
    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLFW_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLFW_DEBUG} CONAN_PKG::opengl CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW_DEBUG}" "${CONAN_LIB_DIRS_GLFW_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLFW_DEBUG "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG}"
                                  "debug" glfw)
    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLFW_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLFW_RELEASE} CONAN_PKG::opengl CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW_RELEASE}" "${CONAN_LIB_DIRS_GLFW_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLFW_RELEASE "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE}"
                                  "release" glfw)
    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLFW_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLFW_RELWITHDEBINFO} CONAN_PKG::opengl CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLFW_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLFW_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glfw)
    set(_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLFW_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLFW_MINSIZEREL} CONAN_PKG::opengl CONAN_PKG::xorg")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLFW_MINSIZEREL}" "${CONAN_LIB_DIRS_GLFW_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLFW_MINSIZEREL "${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glfw)

    add_library(CONAN_PKG::glfw INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glfw PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLFW} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLFW_RELEASE} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLFW_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLFW_MINSIZEREL} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLFW_DEBUG} ${_CONAN_PKG_LIBS_GLFW_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLFW_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLFW_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glfw PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLFW}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLFW_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLFW_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLFW_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLFW_DEBUG}>)
    set_property(TARGET CONAN_PKG::glfw PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLFW}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLFW_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLFW_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLFW_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLFW_DEBUG}>)
    set_property(TARGET CONAN_PKG::glfw PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLFW_LIST} ${CONAN_CXX_FLAGS_GLFW_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLFW_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLFW_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLFW_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLFW_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLFW_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLFW_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLFW_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLFW_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GLEW_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLEW} ${CONAN_FRAMEWORKS_FOUND_GLEW} CONAN_PKG::opengl CONAN_PKG::glu")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLEW_DEPENDENCIES "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLEW}" "${CONAN_LIB_DIRS_GLEW}"
                                  CONAN_PACKAGE_TARGETS_GLEW "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES}"
                                  "" glew)
    set(_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLEW_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLEW_DEBUG} CONAN_PKG::opengl CONAN_PKG::glu")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLEW_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLEW_DEBUG}" "${CONAN_LIB_DIRS_GLEW_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLEW_DEBUG "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_DEBUG}"
                                  "debug" glew)
    set(_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLEW_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLEW_RELEASE} CONAN_PKG::opengl CONAN_PKG::glu")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLEW_RELEASE}" "${CONAN_LIB_DIRS_GLEW_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLEW_RELEASE "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELEASE}"
                                  "release" glew)
    set(_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLEW_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLEW_RELWITHDEBINFO} CONAN_PKG::opengl CONAN_PKG::glu")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLEW_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLEW_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLEW_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glew)
    set(_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLEW_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLEW_MINSIZEREL} CONAN_PKG::opengl CONAN_PKG::glu")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLEW_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLEW_MINSIZEREL}" "${CONAN_LIB_DIRS_GLEW_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLEW_MINSIZEREL "${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glew)

    add_library(CONAN_PKG::glew INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glew PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLEW} ${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLEW_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLEW_RELEASE} ${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLEW_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLEW_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLEW_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLEW_MINSIZEREL} ${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLEW_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLEW_DEBUG} ${_CONAN_PKG_LIBS_GLEW_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLEW_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLEW_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glew PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLEW}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLEW_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLEW_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLEW_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLEW_DEBUG}>)
    set_property(TARGET CONAN_PKG::glew PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLEW}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLEW_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLEW_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLEW_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLEW_DEBUG}>)
    set_property(TARGET CONAN_PKG::glew PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLEW_LIST} ${CONAN_CXX_FLAGS_GLEW_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLEW_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLEW_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLEW_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLEW_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLEW_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLEW_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLEW_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLEW_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLM} ${CONAN_FRAMEWORKS_FOUND_GLM} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM}" "${CONAN_LIB_DIRS_GLM}"
                                  CONAN_PACKAGE_TARGETS_GLM "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES}"
                                  "" glm)
    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLM_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLM_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM_DEBUG}" "${CONAN_LIB_DIRS_GLM_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLM_DEBUG "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG}"
                                  "debug" glm)
    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLM_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLM_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM_RELEASE}" "${CONAN_LIB_DIRS_GLM_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLM_RELEASE "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE}"
                                  "release" glm)
    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLM_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLM_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLM_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLM_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glm)
    set(_CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLM_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLM_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLM_MINSIZEREL}" "${CONAN_LIB_DIRS_GLM_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLM_MINSIZEREL "${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glm)

    add_library(CONAN_PKG::glm INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glm PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLM} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLM_RELEASE} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLM_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLM_MINSIZEREL} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLM_DEBUG} ${_CONAN_PKG_LIBS_GLM_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLM_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLM_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glm PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLM}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLM_DEBUG}>)
    set_property(TARGET CONAN_PKG::glm PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLM}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLM_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLM_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLM_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLM_DEBUG}>)
    set_property(TARGET CONAN_PKG::glm PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLM_LIST} ${CONAN_CXX_FLAGS_GLM_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLM_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLM_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLM_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLM_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLM_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLM_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLM_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLM_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ASSIMP} ${CONAN_FRAMEWORKS_FOUND_ASSIMP} CONAN_PKG::pugixml CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP}" "${CONAN_LIB_DIRS_ASSIMP}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES}"
                                  "" assimp)
    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ASSIMP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ASSIMP_DEBUG} CONAN_PKG::pugixml CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP_DEBUG}" "${CONAN_LIB_DIRS_ASSIMP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP_DEBUG "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG}"
                                  "debug" assimp)
    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ASSIMP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ASSIMP_RELEASE} CONAN_PKG::pugixml CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP_RELEASE}" "${CONAN_LIB_DIRS_ASSIMP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP_RELEASE "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE}"
                                  "release" assimp)
    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ASSIMP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ASSIMP_RELWITHDEBINFO} CONAN_PKG::pugixml CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ASSIMP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" assimp)
    set(_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ASSIMP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ASSIMP_MINSIZEREL} CONAN_PKG::pugixml CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::zlib CONAN_PKG::draco")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASSIMP_MINSIZEREL}" "${CONAN_LIB_DIRS_ASSIMP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ASSIMP_MINSIZEREL "${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" assimp)

    add_library(CONAN_PKG::assimp INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::assimp PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ASSIMP} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ASSIMP_RELEASE} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ASSIMP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ASSIMP_MINSIZEREL} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ASSIMP_DEBUG} ${_CONAN_PKG_LIBS_ASSIMP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASSIMP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASSIMP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::assimp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ASSIMP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ASSIMP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ASSIMP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ASSIMP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ASSIMP_DEBUG}>)
    set_property(TARGET CONAN_PKG::assimp PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ASSIMP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ASSIMP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ASSIMP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ASSIMP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ASSIMP_DEBUG}>)
    set_property(TARGET CONAN_PKG::assimp PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ASSIMP_LIST} ${CONAN_CXX_FLAGS_ASSIMP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ASSIMP_RELEASE_LIST} ${CONAN_CXX_FLAGS_ASSIMP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ASSIMP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ASSIMP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ASSIMP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ASSIMP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ASSIMP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ASSIMP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_STB} ${CONAN_FRAMEWORKS_FOUND_STB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES "${_CONAN_PKG_LIBS_STB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB}" "${CONAN_LIB_DIRS_STB}"
                                  CONAN_PACKAGE_TARGETS_STB "${_CONAN_PKG_LIBS_STB_DEPENDENCIES}"
                                  "" stb)
    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_STB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_STB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB_DEBUG}" "${CONAN_LIB_DIRS_STB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_STB_DEBUG "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG}"
                                  "debug" stb)
    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_STB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_STB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB_RELEASE}" "${CONAN_LIB_DIRS_STB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_STB_RELEASE "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE}"
                                  "release" stb)
    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_STB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_STB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_STB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_STB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" stb)
    set(_CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_STB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_STB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STB_MINSIZEREL}" "${CONAN_LIB_DIRS_STB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_STB_MINSIZEREL "${_CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" stb)

    add_library(CONAN_PKG::stb INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_STB} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_STB_RELEASE} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_STB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_STB_MINSIZEREL} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_STB_DEBUG} ${_CONAN_PKG_LIBS_STB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_STB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_STB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_STB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_STB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_STB_DEBUG}>)
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_STB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_STB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_STB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_STB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_STB_DEBUG}>)
    set_property(TARGET CONAN_PKG::stb PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_STB_LIST} ${CONAN_CXX_FLAGS_STB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_STB_RELEASE_LIST} ${CONAN_CXX_FLAGS_STB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_STB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_STB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_STB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_STB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_STB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_STB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_XORG} ${CONAN_FRAMEWORKS_FOUND_XORG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG}" "${CONAN_LIB_DIRS_XORG}"
                                  CONAN_PACKAGE_TARGETS_XORG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}"
                                  "" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_XORG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_XORG_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_DEBUG}" "${CONAN_LIB_DIRS_XORG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_XORG_DEBUG "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}"
                                  "debug" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_XORG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_XORG_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_RELEASE}" "${CONAN_LIB_DIRS_XORG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_XORG_RELEASE "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}"
                                  "release" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_XORG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_XORG_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_XORG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_XORG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" xorg)
    set(_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_XORG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_XORG_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_XORG_MINSIZEREL}" "${CONAN_LIB_DIRS_XORG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_XORG_MINSIZEREL "${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" xorg)

    add_library(CONAN_PKG::xorg INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_XORG} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_XORG_RELEASE} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_XORG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_XORG_MINSIZEREL} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_XORG_DEBUG} ${_CONAN_PKG_LIBS_XORG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_XORG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_XORG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_XORG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_XORG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_XORG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_XORG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_XORG_DEBUG}>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_XORG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_XORG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_XORG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_XORG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_XORG_DEBUG}>)
    set_property(TARGET CONAN_PKG::xorg PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_XORG_LIST} ${CONAN_CXX_FLAGS_XORG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_XORG_RELEASE_LIST} ${CONAN_CXX_FLAGS_XORG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_XORG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_XORG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_XORG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_XORG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_XORG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_XORG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_GLU_DEPENDENCIES "${CONAN_SYSTEM_LIBS_GLU} ${CONAN_FRAMEWORKS_FOUND_GLU} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLU_DEPENDENCIES "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLU}" "${CONAN_LIB_DIRS_GLU}"
                                  CONAN_PACKAGE_TARGETS_GLU "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES}"
                                  "" glu)
    set(_CONAN_PKG_LIBS_GLU_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_GLU_DEBUG} ${CONAN_FRAMEWORKS_FOUND_GLU_DEBUG} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLU_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLU_DEBUG}" "${CONAN_LIB_DIRS_GLU_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_GLU_DEBUG "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_DEBUG}"
                                  "debug" glu)
    set(_CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_GLU_RELEASE} ${CONAN_FRAMEWORKS_FOUND_GLU_RELEASE} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLU_RELEASE}" "${CONAN_LIB_DIRS_GLU_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_GLU_RELEASE "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELEASE}"
                                  "release" glu)
    set(_CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_GLU_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_GLU_RELWITHDEBINFO} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLU_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_GLU_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_GLU_RELWITHDEBINFO "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" glu)
    set(_CONAN_PKG_LIBS_GLU_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_GLU_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_GLU_MINSIZEREL} CONAN_PKG::opengl")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_GLU_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_GLU_MINSIZEREL}" "${CONAN_LIB_DIRS_GLU_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_GLU_MINSIZEREL "${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" glu)

    add_library(CONAN_PKG::glu INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::glu PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_GLU} ${_CONAN_PKG_LIBS_GLU_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLU_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_GLU_RELEASE} ${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLU_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_GLU_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLU_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_GLU_MINSIZEREL} ${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLU_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_GLU_DEBUG} ${_CONAN_PKG_LIBS_GLU_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_GLU_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_GLU_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::glu PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_GLU}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_GLU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_GLU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_GLU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_GLU_DEBUG}>)
    set_property(TARGET CONAN_PKG::glu PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_GLU}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_GLU_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_GLU_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_GLU_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_GLU_DEBUG}>)
    set_property(TARGET CONAN_PKG::glu PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_GLU_LIST} ${CONAN_CXX_FLAGS_GLU_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_GLU_RELEASE_LIST} ${CONAN_CXX_FLAGS_GLU_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_GLU_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_GLU_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_GLU_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_GLU_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_GLU_DEBUG_LIST}  ${CONAN_CXX_FLAGS_GLU_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES "${CONAN_SYSTEM_LIBS_PUGIXML} ${CONAN_FRAMEWORKS_FOUND_PUGIXML} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML}" "${CONAN_LIB_DIRS_PUGIXML}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES}"
                                  "" pugixml)
    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_PUGIXML_DEBUG} ${CONAN_FRAMEWORKS_FOUND_PUGIXML_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML_DEBUG}" "${CONAN_LIB_DIRS_PUGIXML_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML_DEBUG "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG}"
                                  "debug" pugixml)
    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_PUGIXML_RELEASE} ${CONAN_FRAMEWORKS_FOUND_PUGIXML_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML_RELEASE}" "${CONAN_LIB_DIRS_PUGIXML_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML_RELEASE "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE}"
                                  "release" pugixml)
    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_PUGIXML_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_PUGIXML_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_PUGIXML_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML_RELWITHDEBINFO "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" pugixml)
    set(_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_PUGIXML_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_PUGIXML_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_PUGIXML_MINSIZEREL}" "${CONAN_LIB_DIRS_PUGIXML_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_PUGIXML_MINSIZEREL "${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" pugixml)

    add_library(CONAN_PKG::pugixml INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::pugixml PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_PUGIXML} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_PUGIXML_RELEASE} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_PUGIXML_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_PUGIXML_MINSIZEREL} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_PUGIXML_DEBUG} ${_CONAN_PKG_LIBS_PUGIXML_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_PUGIXML_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_PUGIXML_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::pugixml PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_PUGIXML}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_PUGIXML_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_PUGIXML_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_PUGIXML_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_PUGIXML_DEBUG}>)
    set_property(TARGET CONAN_PKG::pugixml PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_PUGIXML}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_PUGIXML_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_PUGIXML_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_PUGIXML_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_PUGIXML_DEBUG}>)
    set_property(TARGET CONAN_PKG::pugixml PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_PUGIXML_LIST} ${CONAN_CXX_FLAGS_PUGIXML_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_PUGIXML_RELEASE_LIST} ${CONAN_CXX_FLAGS_PUGIXML_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_PUGIXML_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_PUGIXML_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_PUGIXML_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_PUGIXML_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_PUGIXML_DEBUG_LIST}  ${CONAN_CXX_FLAGS_PUGIXML_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_MINIZIP} ${CONAN_FRAMEWORKS_FOUND_MINIZIP} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP}" "${CONAN_LIB_DIRS_MINIZIP}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES}"
                                  "" minizip)
    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_MINIZIP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_MINIZIP_DEBUG} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP_DEBUG}" "${CONAN_LIB_DIRS_MINIZIP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP_DEBUG "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG}"
                                  "debug" minizip)
    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_MINIZIP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_MINIZIP_RELEASE} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP_RELEASE}" "${CONAN_LIB_DIRS_MINIZIP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP_RELEASE "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE}"
                                  "release" minizip)
    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_MINIZIP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_MINIZIP_RELWITHDEBINFO} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_MINIZIP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" minizip)
    set(_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_MINIZIP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_MINIZIP_MINSIZEREL} CONAN_PKG::zlib CONAN_PKG::bzip2")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_MINIZIP_MINSIZEREL}" "${CONAN_LIB_DIRS_MINIZIP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_MINIZIP_MINSIZEREL "${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" minizip)

    add_library(CONAN_PKG::minizip INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::minizip PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_MINIZIP} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_MINIZIP_RELEASE} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_MINIZIP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_MINIZIP_MINSIZEREL} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_MINIZIP_DEBUG} ${_CONAN_PKG_LIBS_MINIZIP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_MINIZIP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_MINIZIP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::minizip PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_MINIZIP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_MINIZIP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_MINIZIP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINIZIP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_MINIZIP_DEBUG}>)
    set_property(TARGET CONAN_PKG::minizip PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_MINIZIP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_MINIZIP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_MINIZIP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_MINIZIP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_MINIZIP_DEBUG}>)
    set_property(TARGET CONAN_PKG::minizip PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_MINIZIP_LIST} ${CONAN_CXX_FLAGS_MINIZIP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_MINIZIP_RELEASE_LIST} ${CONAN_CXX_FLAGS_MINIZIP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_MINIZIP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_MINIZIP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_MINIZIP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_MINIZIP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_MINIZIP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_MINIZIP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_UTFCPP} ${CONAN_FRAMEWORKS_FOUND_UTFCPP} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP}" "${CONAN_LIB_DIRS_UTFCPP}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES}"
                                  "" utfcpp)
    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_UTFCPP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_UTFCPP_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP_DEBUG}" "${CONAN_LIB_DIRS_UTFCPP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP_DEBUG "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG}"
                                  "debug" utfcpp)
    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_UTFCPP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_UTFCPP_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP_RELEASE}" "${CONAN_LIB_DIRS_UTFCPP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP_RELEASE "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE}"
                                  "release" utfcpp)
    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_UTFCPP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_UTFCPP_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_UTFCPP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" utfcpp)
    set(_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_UTFCPP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_UTFCPP_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_UTFCPP_MINSIZEREL}" "${CONAN_LIB_DIRS_UTFCPP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_UTFCPP_MINSIZEREL "${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" utfcpp)

    add_library(CONAN_PKG::utfcpp INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::utfcpp PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_UTFCPP} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_UTFCPP_RELEASE} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_UTFCPP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_UTFCPP_MINSIZEREL} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_UTFCPP_DEBUG} ${_CONAN_PKG_LIBS_UTFCPP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_UTFCPP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_UTFCPP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::utfcpp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_UTFCPP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_UTFCPP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_UTFCPP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_UTFCPP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_UTFCPP_DEBUG}>)
    set_property(TARGET CONAN_PKG::utfcpp PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_UTFCPP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_UTFCPP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_UTFCPP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_UTFCPP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_UTFCPP_DEBUG}>)
    set_property(TARGET CONAN_PKG::utfcpp PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_UTFCPP_LIST} ${CONAN_CXX_FLAGS_UTFCPP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_UTFCPP_RELEASE_LIST} ${CONAN_CXX_FLAGS_UTFCPP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_UTFCPP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_UTFCPP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_UTFCPP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_UTFCPP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_UTFCPP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_UTFCPP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_KUBA-ZIP} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP}" "${CONAN_LIB_DIRS_KUBA-ZIP}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES}"
                                  "" kuba-zip)
    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_KUBA-ZIP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP_DEBUG}" "${CONAN_LIB_DIRS_KUBA-ZIP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP_DEBUG "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG}"
                                  "debug" kuba-zip)
    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_KUBA-ZIP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP_RELEASE}" "${CONAN_LIB_DIRS_KUBA-ZIP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP_RELEASE "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE}"
                                  "release" kuba-zip)
    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_KUBA-ZIP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_KUBA-ZIP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" kuba-zip)
    set(_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_KUBA-ZIP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_KUBA-ZIP_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_KUBA-ZIP_MINSIZEREL}" "${CONAN_LIB_DIRS_KUBA-ZIP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_KUBA-ZIP_MINSIZEREL "${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" kuba-zip)

    add_library(CONAN_PKG::kuba-zip INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::kuba-zip PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_KUBA-ZIP} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_KUBA-ZIP_RELEASE} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_KUBA-ZIP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_KUBA-ZIP_MINSIZEREL} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_KUBA-ZIP_DEBUG} ${_CONAN_PKG_LIBS_KUBA-ZIP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_KUBA-ZIP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_KUBA-ZIP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::kuba-zip PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_KUBA-ZIP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_KUBA-ZIP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_KUBA-ZIP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_KUBA-ZIP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_KUBA-ZIP_DEBUG}>)
    set_property(TARGET CONAN_PKG::kuba-zip PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_KUBA-ZIP_DEBUG}>)
    set_property(TARGET CONAN_PKG::kuba-zip PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_KUBA-ZIP_LIST} ${CONAN_CXX_FLAGS_KUBA-ZIP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_KUBA-ZIP_RELEASE_LIST} ${CONAN_CXX_FLAGS_KUBA-ZIP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_KUBA-ZIP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_KUBA-ZIP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_KUBA-ZIP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_KUBA-ZIP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_KUBA-ZIP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES "${CONAN_SYSTEM_LIBS_POLY2TRI} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI}" "${CONAN_LIB_DIRS_POLY2TRI}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES}"
                                  "" poly2tri)
    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_POLY2TRI_DEBUG} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI_DEBUG}" "${CONAN_LIB_DIRS_POLY2TRI_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI_DEBUG "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG}"
                                  "debug" poly2tri)
    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_POLY2TRI_RELEASE} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI_RELEASE}" "${CONAN_LIB_DIRS_POLY2TRI_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI_RELEASE "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE}"
                                  "release" poly2tri)
    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_POLY2TRI_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_POLY2TRI_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI_RELWITHDEBINFO "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" poly2tri)
    set(_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_POLY2TRI_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_POLY2TRI_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_POLY2TRI_MINSIZEREL}" "${CONAN_LIB_DIRS_POLY2TRI_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_POLY2TRI_MINSIZEREL "${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" poly2tri)

    add_library(CONAN_PKG::poly2tri INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::poly2tri PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_POLY2TRI} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_POLY2TRI_RELEASE} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_POLY2TRI_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_POLY2TRI_MINSIZEREL} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_POLY2TRI_DEBUG} ${_CONAN_PKG_LIBS_POLY2TRI_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_POLY2TRI_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_POLY2TRI_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::poly2tri PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_POLY2TRI}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_POLY2TRI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_POLY2TRI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_POLY2TRI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_POLY2TRI_DEBUG}>)
    set_property(TARGET CONAN_PKG::poly2tri PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_POLY2TRI}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_POLY2TRI_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_POLY2TRI_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_POLY2TRI_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_POLY2TRI_DEBUG}>)
    set_property(TARGET CONAN_PKG::poly2tri PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_POLY2TRI_LIST} ${CONAN_CXX_FLAGS_POLY2TRI_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_POLY2TRI_RELEASE_LIST} ${CONAN_CXX_FLAGS_POLY2TRI_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_POLY2TRI_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_POLY2TRI_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_POLY2TRI_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_POLY2TRI_DEBUG_LIST}  ${CONAN_CXX_FLAGS_POLY2TRI_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES "${CONAN_SYSTEM_LIBS_RAPIDJSON} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON}" "${CONAN_LIB_DIRS_RAPIDJSON}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES}"
                                  "" rapidjson)
    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_RAPIDJSON_DEBUG} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON_DEBUG}" "${CONAN_LIB_DIRS_RAPIDJSON_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON_DEBUG "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG}"
                                  "debug" rapidjson)
    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_RAPIDJSON_RELEASE} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON_RELEASE}" "${CONAN_LIB_DIRS_RAPIDJSON_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON_RELEASE "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE}"
                                  "release" rapidjson)
    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_RAPIDJSON_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RAPIDJSON_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON_RELWITHDEBINFO "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" rapidjson)
    set(_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_RAPIDJSON_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_RAPIDJSON_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RAPIDJSON_MINSIZEREL}" "${CONAN_LIB_DIRS_RAPIDJSON_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_RAPIDJSON_MINSIZEREL "${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" rapidjson)

    add_library(CONAN_PKG::rapidjson INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::rapidjson PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_RAPIDJSON} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_RAPIDJSON_RELEASE} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_RAPIDJSON_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_RAPIDJSON_MINSIZEREL} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_RAPIDJSON_DEBUG} ${_CONAN_PKG_LIBS_RAPIDJSON_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RAPIDJSON_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RAPIDJSON_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::rapidjson PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_RAPIDJSON}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RAPIDJSON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RAPIDJSON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_RAPIDJSON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_RAPIDJSON_DEBUG}>)
    set_property(TARGET CONAN_PKG::rapidjson PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_RAPIDJSON}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_RAPIDJSON_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_RAPIDJSON_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_RAPIDJSON_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_RAPIDJSON_DEBUG}>)
    set_property(TARGET CONAN_PKG::rapidjson PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_RAPIDJSON_LIST} ${CONAN_CXX_FLAGS_RAPIDJSON_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_RAPIDJSON_RELEASE_LIST} ${CONAN_CXX_FLAGS_RAPIDJSON_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_RAPIDJSON_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_RAPIDJSON_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_RAPIDJSON_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_RAPIDJSON_DEBUG_LIST}  ${CONAN_CXX_FLAGS_RAPIDJSON_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_DRACO} ${CONAN_FRAMEWORKS_FOUND_DRACO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO}" "${CONAN_LIB_DIRS_DRACO}"
                                  CONAN_PACKAGE_TARGETS_DRACO "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES}"
                                  "" draco)
    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_DRACO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_DRACO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO_DEBUG}" "${CONAN_LIB_DIRS_DRACO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_DRACO_DEBUG "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG}"
                                  "debug" draco)
    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_DRACO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_DRACO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO_RELEASE}" "${CONAN_LIB_DIRS_DRACO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_DRACO_RELEASE "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE}"
                                  "release" draco)
    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_DRACO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_DRACO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_DRACO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_DRACO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" draco)
    set(_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_DRACO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_DRACO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DRACO_MINSIZEREL}" "${CONAN_LIB_DIRS_DRACO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_DRACO_MINSIZEREL "${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" draco)

    add_library(CONAN_PKG::draco INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::draco PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_DRACO} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_DRACO_RELEASE} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_DRACO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_DRACO_MINSIZEREL} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_DRACO_DEBUG} ${_CONAN_PKG_LIBS_DRACO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DRACO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DRACO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::draco PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_DRACO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_DRACO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_DRACO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_DRACO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DRACO_DEBUG}>)
    set_property(TARGET CONAN_PKG::draco PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_DRACO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_DRACO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_DRACO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_DRACO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_DRACO_DEBUG}>)
    set_property(TARGET CONAN_PKG::draco PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_DRACO_LIST} ${CONAN_CXX_FLAGS_DRACO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_DRACO_RELEASE_LIST} ${CONAN_CXX_FLAGS_DRACO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_DRACO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_DRACO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_DRACO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_DRACO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_DRACO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_DRACO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPENGL} ${CONAN_FRAMEWORKS_FOUND_OPENGL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL}" "${CONAN_LIB_DIRS_OPENGL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}"
                                  "" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPENGL_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPENGL_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_DEBUG}" "${CONAN_LIB_DIRS_OPENGL_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_DEBUG "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}"
                                  "debug" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPENGL_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELEASE}" "${CONAN_LIB_DIRS_OPENGL_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELEASE "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}"
                                  "release" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPENGL_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPENGL_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPENGL_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" opengl)
    set(_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPENGL_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPENGL_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPENGL_MINSIZEREL}" "${CONAN_LIB_DIRS_OPENGL_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL "${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" opengl)

    add_library(CONAN_PKG::opengl INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPENGL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPENGL_RELEASE} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPENGL_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPENGL_MINSIZEREL} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPENGL_DEBUG} ${_CONAN_PKG_LIBS_OPENGL_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPENGL_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPENGL_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPENGL}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPENGL_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPENGL_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPENGL_DEBUG}>)
    set_property(TARGET CONAN_PKG::opengl PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPENGL_LIST} ${CONAN_CXX_FLAGS_OPENGL_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPENGL_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPENGL_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPENGL_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPENGL_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPENGL_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPENGL_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPENGL_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ZLIB} ${CONAN_FRAMEWORKS_FOUND_ZLIB} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB}" "${CONAN_LIB_DIRS_ZLIB}"
                                  CONAN_PACKAGE_TARGETS_ZLIB "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}"
                                  "" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ZLIB_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ZLIB_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_DEBUG}" "${CONAN_LIB_DIRS_ZLIB_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_DEBUG "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}"
                                  "debug" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ZLIB_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELEASE}" "${CONAN_LIB_DIRS_ZLIB_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELEASE "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}"
                                  "release" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ZLIB_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ZLIB_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ZLIB_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" zlib)
    set(_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ZLIB_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ZLIB_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ZLIB_MINSIZEREL}" "${CONAN_LIB_DIRS_ZLIB_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL "${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" zlib)

    add_library(CONAN_PKG::zlib INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ZLIB} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ZLIB_RELEASE} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ZLIB_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ZLIB_MINSIZEREL} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ZLIB_DEBUG} ${_CONAN_PKG_LIBS_ZLIB_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ZLIB_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ZLIB_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ZLIB}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ZLIB_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ZLIB_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ZLIB_DEBUG}>)
    set_property(TARGET CONAN_PKG::zlib PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ZLIB_LIST} ${CONAN_CXX_FLAGS_ZLIB_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ZLIB_RELEASE_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ZLIB_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ZLIB_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ZLIB_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ZLIB_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ZLIB_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ZLIB_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_BZIP2} ${CONAN_FRAMEWORKS_FOUND_BZIP2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2}" "${CONAN_LIB_DIRS_BZIP2}"
                                  CONAN_PACKAGE_TARGETS_BZIP2 "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}"
                                  "" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_BZIP2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_BZIP2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_DEBUG}" "${CONAN_LIB_DIRS_BZIP2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_DEBUG "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}"
                                  "debug" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_BZIP2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELEASE}" "${CONAN_LIB_DIRS_BZIP2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELEASE "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}"
                                  "release" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_BZIP2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_BZIP2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_BZIP2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" bzip2)
    set(_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_BZIP2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_BZIP2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_BZIP2_MINSIZEREL}" "${CONAN_LIB_DIRS_BZIP2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL "${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" bzip2)

    add_library(CONAN_PKG::bzip2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_BZIP2} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_BZIP2_RELEASE} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_BZIP2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_BZIP2_MINSIZEREL} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_BZIP2_DEBUG} ${_CONAN_PKG_LIBS_BZIP2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_BZIP2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_BZIP2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_BZIP2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_BZIP2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_BZIP2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_BZIP2_DEBUG}>)
    set_property(TARGET CONAN_PKG::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_BZIP2_LIST} ${CONAN_CXX_FLAGS_BZIP2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_BZIP2_RELEASE_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_BZIP2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_BZIP2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_BZIP2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_BZIP2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_BZIP2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_BZIP2_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::glfw CONAN_PKG::glew CONAN_PKG::glm CONAN_PKG::assimp CONAN_PKG::stb CONAN_PKG::xorg CONAN_PKG::glu CONAN_PKG::pugixml CONAN_PKG::minizip CONAN_PKG::utfcpp CONAN_PKG::kuba-zip CONAN_PKG::poly2tri CONAN_PKG::rapidjson CONAN_PKG::draco CONAN_PKG::opengl CONAN_PKG::zlib CONAN_PKG::bzip2)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1930 = VS 17.0 (v143 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "17" AND NOT MSVC_VERSION EQUAL 1930) OR
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

